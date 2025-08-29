use crate::{
    lexer::tokens::Token,
    parser::{
        expression::{DebugData, Expression},
        types::Type,
    },
};
use anyhow::{Context, Result, anyhow, bail};

pub fn handle_function(assembly_data: &mut AssemblyData) {
    assembly_data.current_offset_from_stack_frame_base = 0;

    // move stack back,
    // jump to position marked at the beginning of stack that moved back (parent function),
    // clear used variables,
    // TODO: add support for declaring variables per function- probably some random id of function
    // added to a name in variables hashmap
}

use super::{
    assembly_instructions::*, core_fucntions::print_raw,
    helper_methods::validate_data_input_for_function, *,
};
pub fn handle_assignment(
    target: Expression,
    operator: Token,
    value: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code: String = String::new();
    let (binary_expression_left, variable_name) = match target.clone() {
        Expression::Identifier(value, _debug) => (target.clone(), value.clone()),
        Expression::VariableDeclaration {
            var_type: _,
            name,
            mutable: _,
            debug_data,
        } => {
            let expression_output = super::handle_expr(target.clone(), assembly_data)?.clone();
            output_code += &expression_output.code;
            (
                Expression::Identifier(name.to_owned(), debug_data.to_owned()),
                name.clone(),
            )
        }
        other => {
            return Err(anyhow!(
                "expected identifier or variable declaration found: {other:?} {:?}",
                target.debug_data()
            ));
        }
    };

    let read_registry = assembly_data.get_free_register()?;
    let data = if operator.value != "=" {
        let binary_operator = Token {
            kind: crate::lexer::tokens::TokenKind::Arrow, // whatever
            value: operator.value.split_at(1).1.to_string(),
            line: operator.line,
        };

        let binary_expr_output = handle_binary_expr(
            binary_expression_left,
            binary_operator,
            value,
            assembly_data,
        )?;
        output_code += &binary_expr_output.code;
        binary_expr_output.data[0].clone()
    } else {
        let value_expression_output = handle_expr(value, assembly_data)?;
        output_code += &value_expression_output.code;
        value_expression_output.data[0].clone()
    };

    let variable = assembly_data
        .find_var(&variable_name)
        .context("handle_assignment")?
        .clone();

    if data.data_type != variable.data_type {
        return Err(anyhow!(
            "expected: {:?} found: {:?} {:?}",
            variable.data_type,
            data.data_type,
            target.debug_data()
        ));
    }

    for offset in 0..variable.size {
        output_code += &data.read_register(read_registry, offset, assembly_data)?;
        output_code += &variable.write_register(read_registry, offset, assembly_data)?;
    }

    assembly_data.mark_registries_free(&[read_registry]);
    let variable_name = match target.clone() {
        Expression::Identifier(value, _) => value,
        Expression::VariableDeclaration {
            var_type: _,
            name,
            mutable: _,
            debug_data: _,
        } => {
            output_code += &handle_expr(target, assembly_data)?.code;
            name
        }
        other => {
            return Err(anyhow!(
                "expected identifier or variable declaration found: {other:?}"
            ));
        }
    };
    let variable = assembly_data.find_var(&variable_name)?.clone();

    let read_registry = assembly_data.get_free_register()?;
    for offset in 0..variable.size {
        output_code += &data.read_register(read_registry, offset, assembly_data)?;
        output_code += &variable.write_register(read_registry, offset, assembly_data)?;
    }

    assembly_data.mark_registries_free(&[read_registry]);

    Ok(ExpressionOutput {
        code: output_code,
        data: Vec::new(),
    })
}
pub fn handle_function_call(
    left: Expression,
    values: Vec<Expression>,
    debug_data: DebugData,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let name = convert_expression_to_function_name(left, assembly_data)?;

    if let Some(out) = handle_core_function_call(&name, &values, debug_data, assembly_data)
        .context("handle_core_function_call")?
    {
        return Ok(out);
    }
    let mut output_code = String::new();

    let mut data_input: Vec<Data> = Vec::new();
    for value_expression in values {
        let expr_out =
            handle_expr(value_expression, assembly_data).context("function call input")?;
        output_code += &expr_out.code;
        expr_out.expect_data_len(1, &debug_data)?;
        data_input.push(expr_out.data[0].clone());
    }

    let function = assembly_data.find_function(&name)?.clone();
    // validate_data_input_for_function(data_input, function, debug_data)?;

    output_code += &call_function_code(&data_input, function.to_owned(), assembly_data)?;

    Ok(ExpressionOutput {
        code: output_code,
        data: function.output.clone(),
    })
}

pub fn call_function_code(
    data_input: &Vec<Data>,
    function: Function,
    assembly_data: &mut AssemblyData,
) -> Result<String> {
    let mut output_code = String::new();

    // setup data inputs on stack
    //
    //
    //
    // call function
    //
    //
    // setup new stack frame

    todo!();
    // Ok(())
}

pub fn convert_expression_to_function_name(
    expression: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<String> {
    match expression {
        Expression::Identifier(name, _) => {
            if let Ok(var) = assembly_data.find_var(&name) {
                return Ok(var.data_type.to_string());
            }
            // if let Ok(_) = assembly_data.find_struct(&name) {
            //     return Ok(name);
            // }

            Ok(name)
            // bail!("cannot find value '{name}' in this scope!");
        }
        Expression::MemberExpr {
            member,
            name,
            debug_data: _,
        } => Ok(format!(
            "{}.{name}",
            convert_expression_to_function_name(*member, assembly_data)?
        )),

        other => {
            bail!(
                "convert_expression_to_function_name doesn't handle: {other:?} expression type! {:?}",
                other.debug_data()
            )
        }
    }
}
pub fn handle_core_function_call(
    name: &str,
    values: &[Expression],
    debug_data: DebugData,
    assembly_data: &mut AssemblyData,
) -> Result<Option<ExpressionOutput>> {
    match name {
        "print_raw" => {
            expect_input_len(values, 1).context("print_raw")?;

            Ok(Some(print_raw(values[0].to_owned(), assembly_data)?))
        }

        _ => Ok(None),
    }
}

pub fn handle_variable_declaration(
    variable_type: Type,
    variable_name: String,
    mutable: bool,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let data_type = DataType::parse_type(variable_type, assembly_data)?;
    let size = data_type.size(assembly_data)?;
    let stack_offset = assembly_data.current_offset_from_stack_frame_base;
    assembly_data.variables.insert(
        variable_name,
        Data {
            stack_frame_offset: stack_offset,
            size,
            data_type: data_type.clone(),
        },
    );
    assembly_data.current_offset_from_stack_frame_base += size;

    Ok(ExpressionOutput {
        code: String::new(),
        // add support for pointers and variables not stored on stack
        data: vec![Data {
            data_type,
            stack_frame_offset: stack_offset,
            size,
        }],
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
    output_left
        .expect_data_len(1, &debug_data)
        .context("binary expression- left")?;
    let output_right = handle_expr(right, assembly_data)?;
    output_right
        .expect_data_len(1, &debug_data)
        .context("binary expression- right")?;

    let output_register = assembly_data.get_free_register()?;
    let a_register = assembly_data.get_free_register()?;
    let b_register = assembly_data.get_free_register()?;

    let right_data = &output_right.data[0];
    let left_data = &output_left.data[0];
    if right_data.data_type != left_data.data_type {
        bail!(
            "right data type:{:?} != left data type {:?}, {:?}",
            right_data.data_type,
            left_data.data_type,
            debug_data
        );
    }

    if output_left.data[0].size != 1 {
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
    let stack_frame_offset = assembly_data.allocate_stack(size);
    let output_data = Data {
        stack_frame_offset,
        size,
        data_type: output_data_type,
    };

    output_code += &output_data.write_register(output_register, 0, assembly_data)?;

    assembly_data.mark_registries_free(&[a_register, b_register, output_register]);
    Ok(ExpressionOutput {
        code: output_code,
        data: vec![output_data],
    })
}

pub fn handle_identifier(
    name: String,
    assembly_data: &mut AssemblyData,
    debug_data: DebugData,
) -> Result<ExpressionOutput> {
    let variable = assembly_data.find_var(&name).context("handle_identifier")?;
    Ok(ExpressionOutput {
        code: String::new(),
        data: vec![variable.to_owned()],
    })
}
pub fn handle_number(value: u32, assembly_data: &mut AssemblyData) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    let register = assembly_data.get_free_register()?;
    info!("handle_number: {value}");
    output_code += &set(register, value);
    let data_type = DataType::U32;
    let size = data_type.size(assembly_data)?;

    let data = Data {
        stack_frame_offset: assembly_data.allocate_stack(size),
        size,
        data_type,
    };
    output_code += &data.write_register(register, 0, assembly_data)?;

    Ok(ExpressionOutput {
        code: output_code,
        data: vec![data],
    })
}
pub fn handle_if(
    condition: Expression,
    inside: Vec<Expression>,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();

    let debug_data = condition.debug_data().to_owned();
    let condition_data = handle_expr(condition, assembly_data)?;
    output_code += &condition_data.code;
    condition_data.expect_data_len(1, &debug_data)?;

    let condition_register = assembly_data.get_free_register()?;
    output_code += &condition_data.data[0].read_register(condition_register, 0, assembly_data)?;
    output_code += &not(condition_register);
    let label_name = assembly_data.get_label_name("if");

    let addr_conversion_register = assembly_data.get_free_register()?;
    output_code += &jmpc_label(&label_name, addr_conversion_register, condition_register);
    for inside_expression in inside {
        let expression_output = handle_expr(inside_expression, assembly_data)?;
        output_code += &expression_output.code;
    }
    output_code += &label(&label_name);

    assembly_data.mark_registries_free(&[condition_register, addr_conversion_register]);
    Ok(ExpressionOutput {
        code: output_code,
        data: Vec::new(),
    })
}
