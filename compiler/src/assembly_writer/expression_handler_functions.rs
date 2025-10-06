pub mod assignment;
pub mod conditional;
pub mod functions;
pub mod loops;
pub mod structs;

use crate::{
    lexer::tokens::Token,
    parser::{
        expression::{DebugData, Expression},
        types::Type,
    },
};
use anyhow::{Context, Result, bail};
use structs::{handle_struct_access, handle_struct_initialization};

use super::{assembly_instructions::*, helper_methods::STACK_HEAD_POINTER, *};

pub fn dereference(
    input_expr: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    let expr_out = handle_expr(input_expr, assembly_data)?;
    output_code += &expr_out.code;
    let input_data = expr_out
        .data
        .context("expected input expression to output data")?;
    let output_data = {
        let output_data_type = input_data.data_type.unwrap_from_references();
        let size = output_data_type.size(assembly_data)?;
        let alloc_out = assembly_data.allocate_stack(size)?;

        output_code += &alloc_out.0;
        Data {
            stack_frame_offset: alloc_out.1 as i32,
            size,
            data_type: output_data_type,
        }
    };

    let data_copy_register = assembly_data.get_free_register()?;
    for i in 0..output_data.size {
        output_code += &(input_data.read_register(data_copy_register, i, assembly_data)?
            + &output_data.write_register(data_copy_register, i, assembly_data)?);
    }
    assembly_data.mark_registers_free(&[data_copy_register]);

    Ok(ExpressionOutput {
        code: output_code,
        data: Some(output_data),
    })
}

pub fn handle_member_expression(
    left: Expression,
    right: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    // 1 if current var is struct: call - handle_struct_access it will push new variables into
    //   scope
    // 2. handle 'right' expr
    // 3. if current var is struct: pop current var scope.

    let mut output_code = String::new();
    let left_expr_output = handle_expr(left, assembly_data)?;
    output_code += &left_expr_output.code;
    let var = left_expr_output
        .data
        .context("left expression was not valid- lack of output data!")?;

    let (right_expr_output, var_was_struct) = match var.data_type.unwrap_from_references().clone() {
        DataType::Struct { name } => {
            let context = format!("handle_struct_access, struct_name: {name}, variable: {var:?}");
            let mut code =
                handle_struct_access(var.clone(), name, assembly_data).context(context)?;
            let expr_out = handle_expr(right, assembly_data)?;
            code += &expr_out.code;
            (
                ExpressionOutput {
                    code,
                    data: expr_out.data,
                },
                true,
            )
        }
        _ => (handle_expr(right, assembly_data)?, false),
    };
    if var_was_struct {
        assembly_data.variable_code_blocks.pop_front();
    }
    output_code += &right_expr_output.code;

    Ok(ExpressionOutput {
        code: output_code,
        data: right_expr_output.data,
    })
}

pub fn handle_as(
    expression: Expression,
    target_type: Type,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let expr_out = handle_expr(expression, assembly_data)?;
    let input_data = expr_out
        .data
        .context("input expression has to output data")?;
    let data_type = DataType::parse_type(target_type, assembly_data)?;
    let data = Data {
        stack_frame_offset: input_data.stack_frame_offset,
        size: data_type.size(assembly_data)?,
        data_type,
    };

    Ok(ExpressionOutput {
        code: String::new(),
        data: Some(data),
    })
}

//
// pub fn handle_as(
//     expression: Expression,
//     target_type: Type,
//     assembly_data: &mut AssemblyData,
// ) -> Result<ExpressionOutput> {
//     let mut output_code = String::new();
//     let expr_out = handle_expr(expression, assembly_data)?;
//     let input_data = expr_out
//         .data
//         .context("input expression has to output data")?;
//     output_code += &expr_out.code;
//     let data_type = DataType::parse_type(target_type, assembly_data)?;
//     let size = data_type.size(assembly_data)?;
//
//     let alloc_out = assembly_data.allocate_stack(size)?;
//     output_code += &alloc_out.0;
//     let data = Data {
//         stack_frame_offset: alloc_out.1 as i32,
//         size,
//         data_type,
//     };
//     let copy_register = assembly_data.get_free_register()?;
//     for i in 0..data.size {
//         if input_data.size > i {
//             output_code += &input_data.read_register(copy_register, i, assembly_data)?;
//         } else {
//             output_code += &set(copy_register, 0);
//         }
//         output_code += &data.write_register(copy_register, i, assembly_data)?;
//     }
//     assembly_data.mark_registers_free(&[copy_register]);
//
//     Ok(ExpressionOutput {
//         code: output_code,
//         data: Some(data),
//     })
// }
pub fn handle_reference(
    inside: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    output_code += &comment("handle_reference");
    let expr_out = handle_expr(inside, assembly_data)?;

    output_code += &expr_out.code;

    output_code += &comment("handle_reference - handled expression");
    let (alloc_code, alloc_offset_from_stack_frame) = assembly_data.allocate_stack(1)?;
    output_code += &alloc_code;
    let addr_of_reference_register = assembly_data.get_free_register()?;
    let data_of_reference = expr_out
        .data
        .context("you can't create reference to nothing!")?;
    output_code += &data_of_reference.read_addr_of_self(addr_of_reference_register);

    let data = Data {
        stack_frame_offset: alloc_offset_from_stack_frame as i32,
        size: 1,
        data_type: DataType::Reference {
            inside: Box::new(data_of_reference.data_type),
            offset_of_data_from_reference_addr: 0,
        },
    };

    output_code +=
        &data.write_directly_to_reference_pointer(addr_of_reference_register, assembly_data)?;

    output_code += &comment("handle_reference - end");

    assembly_data.mark_registers_free(&[addr_of_reference_register]);
    Ok(ExpressionOutput {
        code: output_code,
        data: Some(data),
    })
}

pub fn handle_prefix_expr(
    prefix: Token,
    value: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    let data_register = assembly_data.get_free_register()?;
    let operation_data_register = assembly_data.get_free_register()?;
    let output_expr = handle_expr(value, assembly_data)?;

    let input_data = output_expr
        .data
        .context("expected value expression to output data!")?;
    output_code += &output_expr.code;

    let code_to_run = match prefix.value.as_str() {
        "-" => {
            &(set(data_register, (-1_i32) as u32) + &mul(data_register, operation_data_register))
        }
        "!" => &not(data_register),
        other => bail!("prefix operation: {other} wasn't handled"),
    };

    let output_data = {
        let size = input_data.size;
        let (code, stack_frame_offset) = assembly_data.allocate_stack(size)?;
        output_code += &code;
        Data {
            stack_frame_offset: stack_frame_offset as i32,
            size,
            data_type: input_data.data_type.clone(),
        }
    };

    for i in 0..input_data.size {
        output_code += &input_data.read_register(data_register, i, assembly_data)?;
        // add support for separate handles for different data types
        output_code += code_to_run;
        output_code += &output_data.write_register(data_register, 0, assembly_data)?;
    }

    output_code += &comment("handle_binary_expr - end");
    assembly_data.mark_registers_free(&[data_register, operation_data_register]);
    Ok(ExpressionOutput {
        code: output_code,
        data: Some(output_data),
    })
}
pub fn handle_binary_expr(
    left: Expression,
    operator: Token,
    right: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let debug_data = left.debug_data().to_owned();
    let mut output_code = String::new();
    output_code += &comment("handle_binary_expr");

    let output_left = handle_expr(left, assembly_data)?;
    output_code += &output_left.code;
    assembly_data.current_var_name_for_function.clear();

    let output_right = handle_expr(right, assembly_data)?;
    output_code += &output_right.code;
    assembly_data.current_var_name_for_function.clear();

    let output_register = assembly_data.get_free_register()?;
    let a_register = assembly_data.get_free_register()?;
    let b_register = assembly_data.get_free_register()?;

    let right_data = &output_right
        .data
        .context("right expression doesn't output any data")?;
    let left_data = &output_left
        .data
        .context("left expression doesn't output any data")?;
    if right_data.data_type != left_data.data_type {
        bail!(
            "right data type:{:?} != left data type {:?}, {:?}",
            right_data.data_type,
            left_data.data_type,
            debug_data
        );
    }
    let (code_to_run, output_data_type) = match operator.value.as_str() {
        "+" => (
            &(add(a_register, b_register) + &cp(output_register, a_register)),
            left_data.data_type.unwrap_from_references().clone(),
        ),
        "-" => (
            &(sub(a_register, b_register) + &cp(output_register, a_register)),
            left_data.data_type.unwrap_from_references().clone(),
        ),
        "*" => (
            &(mul(a_register, b_register) + &cp(output_register, a_register)),
            left_data.data_type.unwrap_from_references().clone(),
        ),
        "/" => (
            &(div(a_register, b_register) + &cp(output_register, a_register)),
            left_data.data_type.unwrap_from_references().clone(),
        ),
        "%" => (
            &(modu(a_register, b_register) + &cp(output_register, a_register)),
            left_data.data_type.unwrap_from_references().clone(),
        ),
        ">>" => (
            &(shr(a_register, b_register) + &cp(output_register, a_register)),
            left_data.data_type.unwrap_from_references().clone(),
        ),
        "<<" => (
            &(shl(a_register, b_register) + &cp(output_register, a_register)),
            left_data.data_type.unwrap_from_references().clone(),
        ),
        "&&" => (
            &(and(a_register, b_register) + &cp(output_register, a_register)),
            left_data.data_type.unwrap_from_references().clone(),
        ),
        "||" => (
            &(or(a_register, b_register) + &cp(output_register, a_register)),
            left_data.data_type.unwrap_from_references().clone(),
        ),
        "^" => (
            &(xor(a_register, b_register) + &cp(output_register, a_register)),
            left_data.data_type.unwrap_from_references().clone(),
        ),

        "==" => (&eq(a_register, b_register, output_register), DataType::Bool),
        ">=" => (
            &gte(a_register, b_register, output_register),
            DataType::Bool,
        ),
        "<=" => (
            &lte(a_register, b_register, output_register),
            DataType::Bool,
        ),
        "<" => (&lt(a_register, b_register, output_register), DataType::Bool),
        ">" => (&gt(a_register, b_register, output_register), DataType::Bool),
        other => bail!("binary operation: {other} wasn't handled"),
    };
    // allocate output on stack
    let output_data = {
        let size = output_data_type.size(assembly_data)?;
        let (code, stack_frame_offset) = assembly_data.allocate_stack(size)?;
        output_code += &code;
        Data {
            stack_frame_offset: stack_frame_offset as i32,
            size,
            data_type: output_data_type,
        }
    };

    output_code += &comment(&format!(
        "handle_binary_expr - output_register- r{}",
        output_register
    ));
    for i in 0..left_data.size {
        output_code += &left_data.read_register(a_register, i, assembly_data)?;
        output_code += &right_data.read_register(b_register, i, assembly_data)?;
        // add support for separate handles for different data types
        output_code += code_to_run;

        output_code += &output_data.write_register(output_register, 0, assembly_data)?;
    }

    output_code += &comment("handle_binary_expr - end");
    assembly_data.mark_registers_free(&[a_register, b_register, output_register]);
    Ok(ExpressionOutput {
        code: output_code,
        data: Some(output_data),
    })
}

pub fn handle_identifier(
    name: String,
    assembly_data: &mut AssemblyData,
    debug_data: DebugData,
) -> Result<ExpressionOutput> {
    assembly_data.current_var_name_for_array_initialization = name.to_owned();
    assembly_data.current_var_name_for_function = name.to_owned();

    if let Ok(variable) = assembly_data.find_var(&name) {
        Ok(ExpressionOutput {
            code: String::new(),
            data: Some(variable.to_owned()),
        })
    } else if assembly_data.find_struct(&name).is_ok() {
        Ok(ExpressionOutput {
            code: String::new(),
            data: Some(Data {
                stack_frame_offset: 0,
                size: 0,
                data_type: DataType::Struct {
                    name: name.to_owned(),
                },
            }),
        })
    } else {
        bail!("neither there was a variable nor a struct type with name: '{name}'")
    }
}
pub fn handle_string(value: String, assembly_data: &mut AssemblyData) -> Result<ExpressionOutput> {
    let mut chars = value.chars();
    // remove "" from front
    chars.next();
    info!("chars: {chars:?}");

    let mut output_code = String::new();
    let register = assembly_data.get_free_register()?;

    let size = chars.clone().count() as u32 + 1;
    let data_type = DataType::Array {
        inside: Box::new(DataType::Char),
        len: chars.clone().count() as u32,
    };

    let (alloc_code, stack_frame_offset) = assembly_data.allocate_stack(size)?;
    output_code += &alloc_code;

    let data = Data {
        stack_frame_offset: stack_frame_offset as i32,
        size,
        data_type,
    };
    output_code += &(set(register, chars.clone().count() as u32)
        + &data.write_register(register, 0, assembly_data)?);
    for (i, char) in chars.enumerate() {
        output_code += &(set(register, char as u32)
            + &data.write_register(register, i as u32 + 1, assembly_data)?);
    }

    Ok(ExpressionOutput {
        code: output_code,
        data: Some(data),
    })
}
pub fn handle_bool(value: bool, assembly_data: &mut AssemblyData) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    let register = assembly_data.get_free_register()?;

    output_code += &set(register, value as u32);
    let data_type = DataType::Bool;
    let size = data_type.size(assembly_data)?;

    let (code, stack_frame_offset) = assembly_data.allocate_stack(size)?;
    output_code += &code;
    let data = Data {
        stack_frame_offset: stack_frame_offset as i32,
        size,
        data_type,
    };
    output_code += &data.write_register(register, 0, assembly_data)?;

    Ok(ExpressionOutput {
        code: output_code,
        data: Some(data),
    })
}
pub fn handle_array_initialization(
    inside_type: Type,
    length: u32,
    properties: Vec<Expression>,
    assembly_data: &mut AssemblyData,
    debug_data: DebugData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    output_code += &comment("array_initialization");

    let data_copy_register = assembly_data.get_free_register()?;

    let inside_data_type = DataType::parse_type(inside_type, assembly_data)?;
    let inside_data_type_size = inside_data_type.size(assembly_data)?;
    // +1 -> 0'th index = len
    let size = inside_data_type_size * length + 1;
    let (allocation_code, stack_frame_offset) = assembly_data.allocate_stack(size)?;

    output_code += &allocation_code;
    let output_data = Data {
        stack_frame_offset: stack_frame_offset as i32,
        size,
        data_type: DataType::Array {
            inside: Box::new(inside_data_type.clone()),
            len: length,
        },
    };
    // clear all data
    output_code += &set(data_copy_register, 0);
    for i in 0..output_data.size {
        output_code += &output_data.write_register(data_copy_register, i, assembly_data)?;
    }

    info!("handle_array_initialization- properties: {properties:?}");
    output_code += &comment(" write array length");
    output_code += &(set(data_copy_register, length as u32)
        + &output_data.write_register(data_copy_register, 0, assembly_data)?);

    for (i, property_expr) in properties.iter().enumerate() {
        info!("handle_array_initialization- property_expr: {property_expr:?}");
        let expr_out = handle_expr(property_expr.clone(), assembly_data)?;
        let expr_data = expr_out
            .data
            .context("handle_array_initialization - input property")?;

        output_code += &expr_out.code;

        if expr_data.data_type != inside_data_type {
            bail!(
                "handle_array_initialization - expected input property nr.'{i}' to have type: {inside_data_type:?} found: {:?}",
                expr_data.data_type
            )
        }
        for w in 0..inside_data_type_size {
            output_code += &expr_data.read_register(data_copy_register, w, assembly_data)?;
            output_code += &comment(&format!(
                "i-{i} w-{w} inside_data_type_size-{inside_data_type_size}"
            ));

            output_code += &output_data.write_register(
                data_copy_register,
                // 1'st register is array len
                i as u32 * inside_data_type_size + w + 1,
                assembly_data,
            )?;
        }
    }

    output_code += &comment("array_initialization- end");
    assembly_data.mark_registers_free(&[data_copy_register]);
    Ok(ExpressionOutput {
        code: output_code,
        data: Some(output_data),
    })
}
pub fn handle_array_indexing(
    var_to_index: Data,
    index_expr: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    output_code += &comment("index_array");
    output_code += &comment(&format!("index_array - var:{var_to_index:?}"));
    let data_type =
        if let DataType::Array { inside, len } = var_to_index.data_type.unwrap_from_references() {
            *inside
        } else {
            bail!("you can only index array variables!");
        };

    let data_size = data_type.size(assembly_data)?;
    let allocation_out = assembly_data.allocate_stack(data_size)?;
    output_code += &allocation_out.0;

    let data = Data {
        stack_frame_offset: allocation_out.1 as i32,
        size: data_size,
        data_type: DataType::Reference {
            inside: Box::new(data_type),
            offset_of_data_from_reference_addr: 0,
        },
    };

    let index_expr_out = handle_expr(index_expr, assembly_data)?;
    output_code += &index_expr_out.code;

    let index_register = assembly_data.get_free_register()?;
    let index_data = &index_expr_out
        .data
        .context("handle_array_indexing -> index expression doesn't output any data!")?;
    index_data
        .expect_data_type(&[DataType::U8, DataType::U32])
        .context("index array- index data")?;
    output_code += &index_data.read_register(index_register, 0, assembly_data)?;

    let addr_register = assembly_data.get_free_register()?;

    let var_stack_frame_offset_register = assembly_data.get_free_register()?;
    output_code += &set(
        var_stack_frame_offset_register,
        var_to_index.stack_frame_offset as u32,
    );
    let offset_register = assembly_data.get_free_register()?;
    output_code += &comment(&format!(
        "array indexing- var_to_index.is_reference: {}",
        var_to_index.is_reference()
    ));

    // setup offset register
    output_code += &(
        // offset = i * data_size
        cp(offset_register, index_register)
            + &set(addr_register, data_size)
            + &mul(offset_register, addr_register)
            + &comment("add 1 offset to account for 1'st register holding size of array")
            + &set(addr_register, 1)
            + &add(offset_register, addr_register)
    );

    output_code +=
        &var_to_index.read_addr_of_register(addr_register, offset_register, assembly_data)?;
    output_code += &comment(&format!(
        "index_array: read_addr_of_register - end addr_register:{addr_register} , offset_register:{offset_register}",
    ));

    output_code += &data.write_directly_to_reference_pointer(addr_register, assembly_data)?;
    output_code += &comment("index_array - end");

    assembly_data.mark_registers_free(&[
        index_register,
        addr_register,
        offset_register,
        var_stack_frame_offset_register,
    ]);
    Ok(ExpressionOutput {
        code: output_code,
        data: Some(data),
    })
}
pub fn handle_open_square_brackets(
    left: Expression,
    inside_expr: Vec<Expression>,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    let left_expr_out = handle_expr(left, assembly_data)?;
    output_code += &left_expr_out.code;

    let data = left_expr_out
        .data
        .context("expected expression on the left form square brackets to output data!")?;
    if let DataType::Struct { name } = data.data_type.unwrap_from_references() {
        let struct_type = assembly_data
            .find_struct(&name)
            .with_context(|| format!("there was no struct type with name: '{name}'"))?;
        let expr_out= handle_struct_initialization(struct_type.to_owned(), assembly_data, inside_expr.clone())
            .with_context(|| format!("handle_struct_initialization, target struct_type:'{:#?}', found_expression:'{:#?}'", &struct_type,&inside_expr))
?;
        Ok(ExpressionOutput {
            code: output_code + &expr_out.code,
            data: expr_out.data,
        })
    } else {
        let expr_out = handle_array_indexing(
            data,
            inside_expr
                .first()
                .context("found no data needed for indexing an array {}")?
                .clone(),
            assembly_data,
        )
        .context("handle_array_indexing")?;
        Ok(ExpressionOutput {
            code: output_code + &expr_out.code,
            data: expr_out.data,
        })
    }
}

pub fn handle_number(value: u32, assembly_data: &mut AssemblyData) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    let register = assembly_data.get_free_register()?;
    output_code += &comment("handle number");
    output_code += &set(register, value);
    let data_type = DataType::U32;
    let size = data_type.size(assembly_data)?;

    let (code, stack_frame_offset) = assembly_data.allocate_stack(size)?;
    output_code += &code;
    let data = Data {
        stack_frame_offset: stack_frame_offset as i32,
        size,
        data_type,
    };
    output_code += &data.write_register(register, 0, assembly_data)?;

    output_code += &comment("handle number end");
    Ok(ExpressionOutput {
        code: output_code,
        data: Some(data),
    })
}
