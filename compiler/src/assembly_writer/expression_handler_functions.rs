pub mod functions;
pub mod structs;

use crate::{
    lexer::tokens::Token,
    parser::{
        expression::{DebugData, Expression},
        types::Type,
    },
};
use anyhow::{Context, Result, anyhow, bail};
use structs::{handle_struct_access, handle_struct_initialization};

use super::{assembly_instructions::*, helper_methods::STACK_FRAME_POINTER, *};

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
pub fn handle_assignment(
    target: Expression,
    operator: Token,
    value: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code: String = String::new();

    output_code += &comment("assignment");
    let target_expr_out = handle_expr(target.clone(), assembly_data)?;
    output_code += &target_expr_out.code;

    assembly_data.current_var_name_for_function.clear();

    let data = if operator.value != "=" {
        let binary_operator = Token {
            kind: crate::lexer::tokens::TokenKind::Arrow, // whatever
            value: operator.value.split_at(1).1.to_string(),
            line: operator.line,
        };

        let binary_expr_output =
            handle_binary_expr(target.clone(), binary_operator, value, assembly_data)?;
        output_code += &binary_expr_output.code;
        binary_expr_output
            .data
            .context("binary expression doesn't output any data!")?
    } else {
        let value_expression_output = handle_expr(value, assembly_data)?;
        output_code += &value_expression_output.code;
        value_expression_output
            .data
            .context("value expression doesn't output any data!")?
            .clone()
    };

    let target_data = target_expr_out
        .data
        .context("expected target expression to output data!")?;

    if !data.data_type.eq(&target_data.data_type) {
        return Err(anyhow!(
            "expected: {:?} found: {:?} {:?}",
            target_data.data_type,
            data.data_type,
            target.debug_data()
        ));
    }

    output_code += &comment(&format!("assignment data: {data:?}"));
    let read_registry = assembly_data.get_free_register()?;

    output_code += &comment(&format!(
        "assignment- variable.is_reference: {} data.is_reference: {} ",
        target_data.is_reference(),
        data.is_reference()
    ));

    if target_data.is_reference() && data.is_reference() {
        output_code += &data.read_referenced_address(read_registry, assembly_data)?;
        output_code +=
            &target_data.write_to_last_reference_in_chain(read_registry, assembly_data)?;
    } else {
        for offset in 0..data.size {
            output_code += &data.read_register(read_registry, offset, assembly_data)?;
            output_code += &target_data.write_register(read_registry, offset, assembly_data)?;
        }
    }

    assembly_data.current_var_name_for_function.clear();

    output_code += &comment("end assignment");
    assembly_data.mark_registers_free(&[read_registry]);

    Ok(ExpressionOutput {
        code: output_code,
        data: None,
    })
}
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

pub fn handle_variable_declaration(
    variable_type: Type,
    variable_name: String,
    mutable: bool,
    assembly_data: &mut AssemblyData,
    debug_data: DebugData,
) -> Result<ExpressionOutput> {
    assembly_data.current_var_name_for_array_initialization = variable_name.to_owned();
    assembly_data.current_var_name_for_function = variable_name.to_owned();

    let data_type = DataType::parse_type(variable_type, assembly_data)?;

    let size = data_type.size(assembly_data)?;

    let mut code = comment(&format!("variable declaration: {variable_name}"));
    let (alloc_code, stack_offset) = assembly_data.allocate_stack(size)?;
    code += &alloc_code;
    let addr_of_self_register = assembly_data.get_free_register()?;
    let data = Data {
        stack_frame_offset: stack_offset as i32,
        size,
        data_type: data_type.clone(),
    };
    assembly_data
        .add_var(data.clone(), variable_name)
        .with_context(|| format!("{debug_data:?}"))?;

    code += &comment("variable declaration end");
    Ok(ExpressionOutput {
        code,
        // add support for pointers and variables not stored on stack
        data: Some(data),
    })
}

pub fn handle_binary_expr(
    left: Expression,
    operator: Token,
    right: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();

    let debug_data = left.debug_data().to_owned();
    let output_left = handle_expr(left, assembly_data)?;
    output_code += &output_left.code;

    let output_right = handle_expr(right, assembly_data)?;

    output_code += &output_right.code;

    let output_register = assembly_data.get_free_register()?;
    let a_register = assembly_data.get_free_register()?;
    let b_register = assembly_data.get_free_register()?;

    let right_data = &output_right
        .data
        .context("right expression desn't output any data")?;
    let left_data = &output_left
        .data
        .context("left expression desn't output any data")?;
    if right_data.data_type != left_data.data_type {
        bail!(
            "right data type:{:?} != left data type {:?}, {:?}",
            right_data.data_type,
            left_data.data_type,
            debug_data
        );
    }

    if left_data.size != 1 {
        bail!(
            "currently binary operations on data types that are bigger than 1 register (32 bits) are not supported! "
        )
    }
    output_code += &left_data.read_register(a_register, 0, assembly_data)?;
    output_code += &right_data.read_register(b_register, 0, assembly_data)?;
    // add support for separate handles for different data types
    let output_data_type: DataType = match operator.value.as_str() {
        "+" => {
            output_code += &(add(a_register, b_register) + &cp(a_register, output_register));
            left_data.data_type.clone()
        }
        "-" => {
            output_code += &(sub(a_register, b_register) + &cp(a_register, output_register));
            left_data.data_type.clone()
        }
        "*" => {
            output_code += &(mul(a_register, b_register) + &cp(a_register, output_register));
            left_data.data_type.clone()
        }
        "/" => {
            output_code += &(div(a_register, b_register) + &cp(a_register, output_register));
            left_data.data_type.clone()
        }
        "%" => {
            output_code += &(modu(a_register, b_register) + &cp(a_register, output_register));
            left_data.data_type.clone()
        }
        ">>" => {
            output_code += &(shr(a_register, b_register) + &cp(a_register, output_register));
            left_data.data_type.clone()
        }
        "<<" => {
            output_code += &(shl(a_register, b_register) + &cp(a_register, output_register));
            left_data.data_type.clone()
        }
        "&&" => {
            output_code += &(and(a_register, b_register) + &cp(a_register, output_register));
            left_data.data_type.clone()
        }
        "||" => {
            output_code += &(or(a_register, b_register) + &cp(a_register, output_register));
            left_data.data_type.clone()
        }
        "^" => {
            output_code += &(xor(a_register, b_register) + &cp(a_register, output_register));
            left_data.data_type.clone()
        }

        "==" => {
            output_code += &eq(a_register, b_register, output_register);
            DataType::Bool
        }
        ">=" => {
            output_code += &gte(a_register, b_register, output_register);
            DataType::Bool
        }
        "<=" => {
            output_code += &lte(a_register, b_register, output_register);
            DataType::Bool
        }
        "<" => {
            output_code += &lt(a_register, b_register, output_register);
            DataType::Bool
        }
        ">" => {
            output_code += &gt(a_register, b_register, output_register);
            DataType::Bool
        }
        other => bail!("binary operation: {other} wasn't handled"),
    };
    // allocate output on stack
    let size = output_data_type.size(assembly_data)?;
    let (code, stack_frame_offset) = assembly_data.allocate_stack(size)?;
    output_code += &code;
    let output_data = Data {
        stack_frame_offset: stack_frame_offset as i32,
        size,
        data_type: output_data_type,
    };

    output_code += &output_data.write_register(output_register, 0, assembly_data)?;

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

    let variable = assembly_data.find_var(&name).context("handle_identifier")?;
    Ok(ExpressionOutput {
        code: String::new(),
        data: Some(variable.to_owned()),
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
    properties: Vec<Expression>,
    assembly_data: &mut AssemblyData,
    debug_data: DebugData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    output_code += &comment("array_initialization");
    let mut inside_data_type_size = 0;

    let data_copy_register = assembly_data.get_free_register()?;

    let inside_data_type = if let DataType::Array { inside } = assembly_data
        .find_var(&assembly_data.current_var_name_for_array_initialization)?
        .data_type
        .clone()
    {
        *inside
    } else {
        bail!("expected last variable to be an array!")
    };
    inside_data_type_size = inside_data_type.size(assembly_data)?;
    // +1 -> 0'th index = len
    let size = inside_data_type_size * properties.len() as u32 + 1;
    let (allocation_code, mut stack_frame_offset) = assembly_data.allocate_stack(size)?;

    output_code += &allocation_code;
    let output_data = Data {
        stack_frame_offset: stack_frame_offset as i32,
        size,
        data_type: DataType::Array {
            inside: Box::new(inside_data_type.clone()),
        },
    };

    info!("handle_array_initialization- properties: {properties:?}");
    output_code += &comment(" write array length");
    output_code += &(set(data_copy_register, properties.len() as u32)
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
        if let DataType::Array { inside } = var_to_index.data_type.unwrap_from_references() {
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
    info!("handle_open_brackets");
    let name = if let Expression::Identifier(name, _) = left {
        name
    } else {
        bail!("expected left to be: Expression::Identifier found: {left:?}");
    };
    let find_struct = assembly_data.find_struct(&name);
    if let Ok(var) = assembly_data.find_var(&name) {
        handle_array_indexing(
            var.to_owned(),
            inside_expr
                .first()
                .context("found no data needed for indexing an array {}")?
                .clone(),
            assembly_data,
        )
        .context("handle_array_indexing")
    } else if let Ok(struct_type) = find_struct {
        handle_struct_initialization(struct_type.to_owned(), assembly_data, inside_expr.clone())
            .with_context(|| format!("handle_struct_initialization, target struct_type:'{:#?}', found_expression:'{:#?}'", &struct_type,&inside_expr))
    } else {
        bail!(
            "The identifier before the opening brackets is neither a variable name nor a struct name!"
        )
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
pub fn handle_if(
    condition: Expression,
    inside: Vec<Expression>,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    assembly_data
        .variable_code_blocks
        .push_front(VariableCodeBlocks {
            variables: HashMap::new(),
            code_block_type: CodeBlockType::Inclusive,
        });
    let mut output_code = String::new();
    output_code += &comment(&format!("if- condition: {condition:?}"));

    let initial_stack_frame_offset = assembly_data.get_free_register()?;
    output_code += &cp(initial_stack_frame_offset, STACK_FRAME_POINTER);

    let debug_data = condition.debug_data().to_owned();

    output_code += &comment("if comparison");
    output_code += &comment("if condition data");
    let condition_data = handle_expr(condition, assembly_data)?;
    output_code += &condition_data.code;

    let condition_register = assembly_data.get_free_register()?;
    output_code += &comment("read condition");
    output_code += &condition_data
        .data
        .context("handle_if -> condition expression doesn't output any data! ")?
        .read_register(condition_register, 0, assembly_data)?;

    output_code += &not(condition_register);
    let label_name = assembly_data.get_label_name("if");

    let addr_conversion_register = assembly_data.get_free_register()?;
    output_code += &jmpc_label(&label_name, addr_conversion_register, condition_register);

    output_code += &comment("if contents");
    for inside_expression in inside {
        let expression_output = handle_expr(inside_expression, assembly_data)?;
        output_code += &expression_output.code;
    }
    output_code += &comment("if contents end");
    output_code += &label(&label_name);

    // deallocate all stack used by this if's contents
    output_code += &cp(STACK_FRAME_POINTER, initial_stack_frame_offset);
    assembly_data.variable_code_blocks.pop_front();

    output_code += &comment("if end");

    assembly_data.mark_registers_free(&[
        condition_register,
        addr_conversion_register,
        initial_stack_frame_offset,
    ]);
    Ok(ExpressionOutput {
        code: output_code,
        data: None,
    })
}
