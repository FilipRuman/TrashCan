use std::collections::HashMap;

use crate::{
    assembly_writer::{
        assembly_instructions::*, data_structures::*, handle_expr,
        helper_methods::STACK_HEAD_POINTER,
    },
    parser::expression::Expression,
};
use anyhow::{Context, Result, bail};

pub fn handle_if(
    chained_elses: Vec<Expression>,
    condition: Expression,
    inside: Vec<Expression>,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    push_new_variable_code_block(assembly_data);
    let mut output_code = String::new();

    let chain_end_label = assembly_data.get_label_name(&format!("if_chain_end"));
    output_code += &comment(&format!("if- condition: {condition:?}"));

    let initial_stack_head_data = save_initial_stack_head(assembly_data, &mut output_code)?;
    let initial_offset_from_stack_base = assembly_data.current_offset_from_stack_frame_base;

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
        assembly_data.current_var_name_for_function.clear();

        let expression_output = handle_expr(inside_expression, assembly_data)?;
        output_code += &expression_output.code;
    }
    output_code += &jmp_label(&chain_end_label, addr_conversion_register);
    output_code += &comment("if contents end");

    output_code += &label(&label_name);

    // deallocate all used stack
    output_code += &initial_stack_head_data.read_register(STACK_HEAD_POINTER, 0, assembly_data)?;
    assembly_data.current_offset_from_stack_frame_base = initial_offset_from_stack_base;

    assembly_data.variable_code_blocks.pop_front();

    for else_expr in chained_elses {
        assembly_data.current_var_name_for_function.clear();
        if let Expression::Else {
            condition,
            inside,
            debug_data,
        } = else_expr
        {
            output_code += &handle_else(&chain_end_label, condition, inside, assembly_data)?;
        } else {
            bail!(
                "in chained else expressions for if statement: expected else statement found: '{:?}' ",
                else_expr
            );
        }
    }
    output_code += &label(&chain_end_label);
    assembly_data.mark_registers_free(&[condition_register, addr_conversion_register]);
    Ok(ExpressionOutput {
        code: output_code,
        data: None,
    })
}

fn push_new_variable_code_block(assembly_data: &mut AssemblyData) {
    assembly_data
        .variable_code_blocks
        .push_front(VariableCodeBlocks {
            variables: HashMap::new(),
            code_block_type: CodeBlockType::Inclusive,
        });
}

pub fn handle_else(
    chain_end_label: &str,
    condition: Option<Box<Expression>>,
    inside: Vec<Expression>,
    assembly_data: &mut AssemblyData,
) -> Result<String> {
    push_new_variable_code_block(assembly_data);
    let mut output_code = String::new();
    output_code += &comment(&format!("else - condition: {condition:?}"));

    let initial_stack_head_data = save_initial_stack_head(assembly_data, &mut output_code)?;
    let initial_offset_from_stack_base = assembly_data.current_offset_from_stack_frame_base;

    let label_name = assembly_data.get_label_name("else");
    let addr_conversion_register = assembly_data.get_free_register()?;
    let condition_register = assembly_data.get_free_register()?;
    if let Some(condition) = condition {
        let debug_data = condition.debug_data().to_owned();
        output_code += &comment("else condition data");
        let condition_data = handle_expr(*condition, assembly_data)?;
        output_code += &condition_data.code;

        output_code += &comment("read condition");
        output_code += &condition_data
            .data
            .context("handle_else -> condition expression doesn't output any data! ")?
            .read_register(condition_register, 0, assembly_data)?;

        output_code += &not(condition_register);
        output_code += &jmpc_label(&label_name, addr_conversion_register, condition_register);
    }

    output_code += &comment("else contents");
    for inside_expression in inside {
        assembly_data.current_var_name_for_function.clear();

        let expression_output = handle_expr(inside_expression, assembly_data)?;
        output_code += &expression_output.code;
    }
    output_code += &jmp_label(chain_end_label, addr_conversion_register);
    output_code += &comment("else contents end");
    output_code += &label(&label_name);
    //
    // deallocate all used stack
    output_code += &initial_stack_head_data.read_register(STACK_HEAD_POINTER, 0, assembly_data)?;
    assembly_data.current_offset_from_stack_frame_base = initial_offset_from_stack_base;

    assembly_data.mark_registers_free(&[addr_conversion_register, condition_register]);
    assembly_data.variable_code_blocks.pop_front();
    Ok(output_code)
}

fn save_initial_stack_head(
    assembly_data: &mut AssemblyData,
    output_code: &mut String,
) -> Result<Data, anyhow::Error> {
    let initial_stack_head_data = {
        let alloc_out = assembly_data.allocate_stack(1)?;
        *output_code += &alloc_out.0;
        let initial_stack_head_data = Data {
            stack_frame_offset: alloc_out.1 as i32,
            size: 1,
            data_type: DataType::U32,
        };
        *output_code +=
            &initial_stack_head_data.write_register(STACK_HEAD_POINTER, 0, assembly_data)?;
        initial_stack_head_data
    };
    Ok(initial_stack_head_data)
}
