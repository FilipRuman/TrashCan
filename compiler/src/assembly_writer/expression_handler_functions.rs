use crate::{
    lexer::tokens::Token,
    parser::{
        expression::{DebugData, Expression},
        types::Type,
    },
};
use anyhow::{Context, Result, anyhow, bail};

use super::{
    assembly_instructions::*,
    core_fucntions::{halt_func, print_raw},
    helper_methods::{
        STACK_FRAME_POINTER, STACK_HEAD_POINTER, change_stack_frame_pointer,
        validate_data_input_for_function,
    },
    *,
};

pub fn handle_function(
    name: String,
    inside: Vec<Expression>,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let function = assembly_data
        .functions
        .get(&name)
        .context("handle_function -> assembly_data.functions.get(self.name)")?
        .clone();

    // 1 because 0 -> return addr
    assembly_data.current_offset_from_stack_frame_base = 1;

    let mut output_code = String::new();
    output_code += &label(&function.label_name);

    let initial_stack_frame_register = assembly_data.get_free_register()?;
    let jump_back_addr_register = assembly_data.get_free_register()?;

    output_code += &cp(initial_stack_frame_register, STACK_FRAME_POINTER);

    output_code += &cp(STACK_FRAME_POINTER, STACK_HEAD_POINTER);

    assembly_data
        .variable_code_blocks
        .push_front(VariableCodeBlocks {
            variables: HashMap::new(),
            code_block_type: CodeBlockType::FunctionCall,
        });

    for input in &function.input {
        let size = input.data_type.size(assembly_data)?;
        assembly_data.add_var(
            Data {
                stack_frame_offset: input.stack_frame_offset,
                size,
                data_type: input.data_type.to_owned(),
            },
            input.name.to_owned(),
        )?;
        info!("Function input variable: {input:?}");
    }

    // run contents
    //
    //

    for expression in inside {
        match expression {
            Expression::Return { value, debug_data } => {
                output_code += &comment("Return");
                let expr_output = handle_expr(*value, assembly_data)?;
                output_code += &expr_output.code;
                verify_function_output_with_return(&function.output, &expr_output.data)
                    .with_context(|| format!("{debug_data:?}"))?;

                // write to output variables on stack
                for (target_output, data) in function.output.iter().zip(expr_output.data) {
                    output_code += &target_output.assign(&data, assembly_data)?;
                }

                output_code += &cp(jump_back_addr_register, STACK_FRAME_POINTER);

                // deallocate all variables used in this function from stack
                output_code += &cp(STACK_HEAD_POINTER, STACK_FRAME_POINTER);

                // go back to stack frame of parent function
                output_code += &cp(STACK_FRAME_POINTER, initial_stack_frame_register);

                // read return addr + jmp to it
                output_code += &(read(jump_back_addr_register, jump_back_addr_register)
                    + &jmp(jump_back_addr_register));
            }
            other => {
                output_code += &handle_expr(other, assembly_data)?.code;
            }
        }
    }
    assembly_data.mark_registers_free(&[initial_stack_frame_register, jump_back_addr_register]);
    assembly_data.variable_code_blocks.pop_front();

    Ok(ExpressionOutput {
        code: output_code,
        // i don't need to return any data. the function call expression will do it!
        data: vec![],
    })
}

fn verify_function_output_with_return(
    output: &[FunctionInputData],
    return_data: &[Data],
) -> Result<()> {
    for (i, (target_output, data)) in output.iter().zip(return_data).enumerate() {
        if target_output.data_type != data.data_type {
            bail!(
                "function input nr.{i}-> expected:'{:?}', found:'{:?}'",
                target_output.data_type,
                data.data_type
            )
        }
    }
    Ok(())
}

pub fn handle_assignment(
    target: Expression,
    operator: Token,
    value: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code: String = String::new();

    output_code += &comment("assignment");
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
    output_code += &comment(&format!("assignment data: {data:?}"));

    for offset in 0..variable.size {
        output_code += &data.read_register(read_registry, offset, assembly_data)?;
        output_code += &variable.write_register(read_registry, offset, assembly_data)?;
    }

    assembly_data.mark_registers_free(&[read_registry]);
    let variable = assembly_data.find_var(&variable_name)?.clone();

    let read_registry = assembly_data.get_free_register()?;
    for offset in 0..variable.size {
        output_code += &data.read_register(read_registry, offset, assembly_data)?;
        output_code += &variable.write_register(read_registry, offset, assembly_data)?;
    }

    output_code += &comment("end assignment");
    assembly_data.mark_registers_free(&[read_registry]);

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

    let function_call_output = call_function_code(&data_input, function.to_owned(), assembly_data)?;
    output_code += &function_call_output.code;

    Ok(ExpressionOutput {
        code: output_code,
        data: function_call_output.data,
    })
}

pub fn call_function_code(
    data_input: &[Data],
    function: Function,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();

    output_code += &comment("call_function_code");

    let needed_stack = if !function.output.is_empty() {
        // * -1 because the stack offset will be negative
        -function.output[function.output.len() - 1].stack_frame_offset as u32
    } else if !function.input.is_empty() {
        function.input[function.input.len() - 1].stack_frame_offset as u32
    } else {
        // just for position to jump back to
        1
    };

    let offset_register = assembly_data.get_free_register()?;

    // the address to which i will add negative offsets
    let (code, stack_offset) = assembly_data.allocate_stack(needed_stack)?;
    output_code += &code;

    // write inputs
    let destination_addr_register = assembly_data.get_free_register()?;
    let source_register = assembly_data.get_free_register()?;
    let source_offset_register = assembly_data.get_free_register()?;
    for (input_data, function_input) in data_input.iter().zip(function.input) {
        for offset in 0..input_data.size {
            let offset_from_head_frame = (function_input.stack_frame_offset + offset as i32) as u32;

            // read source
            output_code += &(set(source_offset_register, offset)
                + &set(source_register, input_data.stack_frame_offset as u32)
                + &add(source_register, source_offset_register)
                + &read_data_off_stack(source_register, source_register));
            // read destination addr
            output_code += &(set(destination_addr_register, offset_from_head_frame)
                + &add(destination_addr_register, STACK_HEAD_POINTER));
            //write data
            output_code += &write(destination_addr_register, source_register);
        }
    }

    // call function

    let return_label_name = assembly_data.get_label_name("function-return");

    //re use register for return addr
    output_code += &set_label(source_register, &return_label_name);
    output_code += &write(STACK_HEAD_POINTER, source_register);

    //re use register for function addr
    output_code += &set_label(destination_addr_register, &function.label_name);
    output_code += &jmp(destination_addr_register);
    output_code += &label(&return_label_name);
    // read outputs

    let mut output_data = Vec::with_capacity(function.output.len());

    output_code += &comment(&format!("function call output: {:?}", function.output));

    for output in function.output {
        output_data.push(Data {
            stack_frame_offset: assembly_data.current_offset_from_stack_frame_base as i32
                + output.stack_frame_offset,
            size: output.data_type.size(assembly_data)?,

            data_type: output.data_type,
        });
    }
    output_code += &comment(&format!(
        "function call converted output data : {output_data:?}",
    ));

    assembly_data.mark_registers_free(&[
        offset_register,
        destination_addr_register,
        source_register,
        source_offset_register,
    ]);
    Ok(ExpressionOutput {
        code: output_code,
        data: output_data,
    })
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
        "halt" => Ok(Some(halt_func()?)),

        _ => Ok(None),
    }
}

pub fn handle_variable_declaration(
    variable_type: Type,
    variable_name: String,
    mutable: bool,
    assembly_data: &mut AssemblyData,
    debug_data: DebugData,
) -> Result<ExpressionOutput> {
    let data_type = DataType::parse_type(variable_type, assembly_data)?;
    let size = data_type.size(assembly_data)?;

    let (mut code, stack_offset) = assembly_data.allocate_stack(size)?;

    code += &comment(&format!("variable declaration: {variable_name}"));
    assembly_data
        .add_var(
            Data {
                stack_frame_offset: stack_offset as i32,
                size,
                data_type: data_type.clone(),
            },
            variable_name,
        )
        .with_context(|| format!("{debug_data:?}"))?;

    code += &comment("variable declaration end");
    Ok(ExpressionOutput {
        code,
        // add support for pointers and variables not stored on stack
        data: vec![Data {
            data_type,
            stack_frame_offset: stack_offset as i32,
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
        data: vec![data],
    })
}
pub fn handle_number(value: u32, assembly_data: &mut AssemblyData) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    let register = assembly_data.get_free_register()?;
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
    assembly_data
        .variable_code_blocks
        .push_front(VariableCodeBlocks {
            variables: HashMap::new(),
            code_block_type: CodeBlockType::If,
        });
    let mut output_code = String::new();
    // I just store it in register, so I can easily access variables from parent if code blocks,
    // this is also more efficient than storing that on a stack like when calling a function.
    let initial_stack_frame_offset = assembly_data.get_free_register()?;
    output_code += &cp(initial_stack_frame_offset, STACK_FRAME_POINTER);

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

    // deallocate all stack used by this if's contents
    output_code += &cp(STACK_FRAME_POINTER, initial_stack_frame_offset);
    assembly_data.variable_code_blocks.pop_front();

    assembly_data.mark_registers_free(&[
        condition_register,
        addr_conversion_register,
        initial_stack_frame_offset,
    ]);
    Ok(ExpressionOutput {
        code: output_code,
        data: Vec::new(),
    })
}
