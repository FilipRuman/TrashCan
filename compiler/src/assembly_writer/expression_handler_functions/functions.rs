use std::collections::HashMap;

use crate::{
    assembly_writer::{
        assembly_instructions::*,
        core_functions::{array_len, halt_func, print_raw},
        data_structures::*,
        expect_input_len, handle_expr,
        helper_methods::*,
    },
    parser::expression::{DebugData, Expression},
};
use anyhow::{Context, Result, bail};
use log::*;
pub fn parse_function_declarations(
    expressions: &Vec<Expression>,
    assembly_data: &mut AssemblyData,
) -> Result<()> {
    for expression in expressions {
        if let Expression::Function {
            name,
            properties: input_types,
            public: _,
            output: output_type,
            inside: _,
            debug_data: _,
        } = expression
        {
            // -1 because the start of the stack frame will be address that you need to jump back to.
            let mut current_stack_offset = -1;
            let mut input = Vec::with_capacity(input_types.len());
            for input_expression in input_types {
                let (input_type, var_name) = if let Expression::FunctionProperty {
                    var_name,
                    var_type,
                    debug_data: _,
                } = input_expression
                {
                    (var_type.clone(), var_name.to_owned())
                } else {
                    bail!("expected function property!");
                };

                let (is_reference, data_type) = DataType::parse_type(input_type, assembly_data)?;

                let offset = current_stack_offset;
                current_stack_offset -= data_type.size(assembly_data)? as i32;
                input.push(FunctionInputData {
                    is_reference,
                    name: var_name.to_owned(),
                    data_type,
                    stack_frame_offset: offset,
                });
            }
            let output_data: Option<FunctionInputData> = {
                if output_type.is_none() {
                    None
                } else {
                    let (is_reference, data_type) = DataType::parse_type(
                        output_type.as_ref().unwrap().to_owned(),
                        assembly_data,
                    )?;
                    Some(FunctionInputData {
                        is_reference,
                        name: name.to_owned(),
                        data_type,
                        stack_frame_offset: current_stack_offset,
                    })
                }
            };

            let label_name = assembly_data.get_label_name(&format!("function_{name}_"));
            assembly_data.functions.insert(
                name.to_owned(),
                Function {
                    name: name.to_owned(),
                    input,
                    output: output_data,
                    label_name,
                },
            );
        }
    }
    Ok(())
}

fn verify_function_output_with_return(
    output: Option<FunctionInputData>,
    return_data: Option<Data>,
) -> Result<()> {
    if output.is_some() != return_data.is_some() {
        bail!(
            "function output -> expected:'{:?}', found:'{:?}'",
            output,
            return_data
        )
    }
    if output.is_some() {
        let output_data_type = output.unwrap().data_type;
        let return_data_type = return_data.unwrap().data_type;
        if output_data_type != return_data_type {
            bail!(
                "function output -> expected:'{:?}', found:'{:?}'",
                output_data_type,
                return_data_type
            )
        }
    }

    Ok(())
}
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
                is_reference: input.is_reference,
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
                verify_function_output_with_return(
                    function.output.to_owned(),
                    expr_output.data.to_owned(),
                )
                .with_context(|| format!("{debug_data:?}"))?;

                // write to output variables on stack
                if let Some(target_output) = function.output.to_owned() {
                    output_code +=
                        &target_output.assign(&expr_output.data.unwrap(), assembly_data)?;
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
        data: None,
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
        data_input.push(
            expr_out
                .data
                .context("function_call -> input_data is none")?
                .clone(),
        );
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

    let needed_stack = if let Some(function_output) = function.output.to_owned() {
        // * -1 because the stack offset will be negative
        -function_output.stack_frame_offset as u32
    } else if !function.input.is_empty() {
        // * -1 because the stack offset will be negative
        -function.input[function.input.len() - 1].stack_frame_offset as u32
    } else {
        // just for position to jump back to
        1
    };

    info!("call_function_code - needed_stack: {needed_stack}");
    let offset_register = assembly_data.get_free_register()?;

    // the address to which i will add negative offsets
    let (code, stack_offset) = assembly_data.allocate_stack(needed_stack)?;
    output_code += &code;

    // write inputs
    let destination_addr_register = assembly_data.get_free_register()?;
    let source_register = assembly_data.get_free_register()?;
    let source_offset_register = assembly_data.get_free_register()?;
    for (input_data, function_input) in data_input.iter().zip(function.input) {
        if function_input.is_reference {
            // smth. is wrong in here, doesn't read destination addr
            // read destination addr
            output_code += &comment("call_function_code - handle reference variable");
            output_code += &(set(
                destination_addr_register,
                function_input.stack_frame_offset as u32,
            ) + &add(destination_addr_register, STACK_HEAD_POINTER));

            if input_data.is_reference {
                output_code += &input_data.read_pointer_addr(source_register, assembly_data)?;
            } else {
                output_code += &input_data.read_addr_of_self(source_register);
            }

            output_code += &write(destination_addr_register, source_register);

            output_code += &comment("call_function_code - handle reference variable, end");
        } else {
            for offset in 0..input_data.size {
                let offset_from_head_frame =
                    (function_input.stack_frame_offset + offset as i32) as u32;

                // read source
                output_code +=
                    &(input_data.read_register(source_register, offset, assembly_data)?);
                // read destination addr
                output_code += &(set(destination_addr_register, offset_from_head_frame)
                    + &add(destination_addr_register, STACK_HEAD_POINTER));
                //write data
                output_code += &write(destination_addr_register, source_register);
            }
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

    output_code += &comment(&format!("function call output: {:?}", function.output));

    let output_data = if let Some(output) = function.output.to_owned() {
        Some(Data {
            stack_frame_offset: assembly_data.current_offset_from_stack_frame_base as i32
                + output.stack_frame_offset,
            size: output.data_type.size(assembly_data)?,
            is_reference: output.is_reference,

            data_type: output.data_type,
        })
    } else {
        None
    };
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
        "[].len" => {
            expect_input_len(values, 0).context("array_len")?;

            Ok(Some(array_len(assembly_data)?))
        }
        "halt" => Ok(Some(halt_func()?)),

        _ => Ok(None),
    }
}
