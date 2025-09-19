use std::collections::HashMap;

use crate::{
    assembly_writer::{
        assembly_instructions::{
            add, comment, gte, jmp_label, jmpc_label, label, lt, not, set, sub,
        },
        data_structures::{
            AssemblyData, CodeBlockType, Data, DataType, ExpressionOutput, VariableCodeBlocks,
        },
        handle_expr,
    },
    parser::expression::Expression,
};
use anyhow::{Context, Result, bail};

pub fn handle_while_loop(
    condition: Expression,
    inside: Vec<Expression>,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    let while_start = assembly_data.get_label_name("while_start");
    let while_end = assembly_data.get_label_name("while_end");
    let condition_register = assembly_data.get_free_register()?;
    let label_addr_conversion_register = assembly_data.get_free_register()?;
    assembly_data
        .variable_code_blocks
        .push_front(VariableCodeBlocks {
            variables: HashMap::new(),
            code_block_type: CodeBlockType::Inclusive,
        });
    output_code += &label(&while_start);
    // handle_condition
    {
        let condition_expr_out = handle_expr(condition, assembly_data)?;
        output_code += &condition_expr_out.code;
        output_code += &condition_expr_out
            .data
            .context("condition register doesn't output data!")?
            .read_register(condition_register, 0, assembly_data)?;

        output_code += &(not(condition_register)
            + &jmpc_label(
                &while_end,
                label_addr_conversion_register,
                condition_register,
            ));
        assembly_data.current_var_name_for_function.clear();
    }

    output_code += &comment("while loop contents:");
    assembly_data.current_var_name_for_function.clear();

    for inside_expr in inside {
        let inside_expr_out = handle_expr(inside_expr, assembly_data)?;
        output_code += &inside_expr_out.code;
        assembly_data.current_var_name_for_function.clear();
    }

    output_code += &comment("while loop contents - end");
    output_code += &jmp_label(&while_start, label_addr_conversion_register);

    output_code += &label(&while_end);

    assembly_data.variable_code_blocks.pop_front();

    assembly_data.mark_registers_free(&[condition_register, label_addr_conversion_register]);
    Ok(ExpressionOutput {
        code: output_code,
        data: None,
    })
}
pub fn handle_for_loop(
    iterator_name: String,
    iteration_target: Expression,
    inside: Vec<Expression>,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    let for_start = assembly_data.get_label_name("for_start");
    let for_end = assembly_data.get_label_name("for_end");
    let condition_register = assembly_data.get_free_register()?;
    let iter_register = assembly_data.get_free_register()?;
    let label_addr_conversion_register = assembly_data.get_free_register()?;
    let to_register = assembly_data.get_free_register()?;

    assembly_data
        .variable_code_blocks
        .push_front(VariableCodeBlocks {
            variables: HashMap::new(),
            code_block_type: CodeBlockType::Inclusive,
        });

    // handle_condition

    let iterator = {
        let alloc_out = assembly_data.allocate_stack(1)?;
        output_code += &alloc_out.0;
        let data = Data {
            stack_frame_offset: alloc_out.1 as i32,
            size: 1,
            data_type: DataType::U32,
        };
        assembly_data.add_var(data.clone(), iterator_name)?;
        data
    };

    {
        if let Expression::Range {
            from,
            to,
            debug_data,
        } = iteration_target
        {
            let from_expr_out = handle_expr(*from, assembly_data)?;
            output_code += &from_expr_out.code;
            let to_expr_out = handle_expr(*to, assembly_data)?;
            output_code += &to_expr_out.code;

            output_code += &from_expr_out
                .data
                .context("from expression in range in for loop doesn't output any data")?
                .read_register(iter_register, 0, assembly_data)?;

            output_code += &to_expr_out
                .data
                .context("to expression in range in for loop doesn't output any data")?
                .read_register(to_register, 0, assembly_data)?;

            // -1 because it's better to place iterator incrementation, in here not at the end
            output_code += &(set(condition_register, 1)
                + &sub(iter_register, condition_register)
                + &sub(to_register, condition_register));
            output_code += &label(&for_start);

            output_code += &(set(condition_register, 1) + &add(iter_register, condition_register));
            output_code += &(gte(iter_register, to_register, condition_register)
                + &jmpc_label(&for_end, label_addr_conversion_register, condition_register))
        } else {
            bail!("expected iteration target expression to be a Range, found {iteration_target:?}.")
        }
    }

    output_code += &iterator.write_register(iter_register, 0, assembly_data)?;

    output_code += &comment("for loop contents:");

    assembly_data.current_var_name_for_function.clear();
    for inside_expr in inside {
        let inside_expr_out = handle_expr(inside_expr, assembly_data)?;
        output_code += &inside_expr_out.code;

        assembly_data.current_var_name_for_function.clear();
    }

    output_code += &comment("for loop contents - end");
    output_code += &jmp_label(&for_start, label_addr_conversion_register);

    output_code += &label(&for_end);

    assembly_data.variable_code_blocks.pop_front();
    assembly_data.mark_registers_free(&[
        condition_register,
        label_addr_conversion_register,
        iter_register,
        to_register,
    ]);
    Ok(ExpressionOutput {
        code: output_code,
        data: None,
    })
}
