use crate::{
    assembly_writer::{
        assembly_instructions::{comment, jmp_label, jmpc_label, label, not},
        data_structures::{AssemblyData, ExpressionOutput},
        handle_expr,
    },
    parser::expression::Expression,
};
use anyhow::{Context, Result};

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

    for inside_expr in inside {
        let inside_expr_out = handle_expr(inside_expr, assembly_data)?;
        output_code += &inside_expr_out.code;
    }

    output_code += &comment("while loop contents - end");
    output_code += &jmp_label(&while_start, label_addr_conversion_register);

    output_code += &label(&while_end);

    assembly_data.mark_registers_free(&[condition_register]);
    Ok(ExpressionOutput {
        code: output_code,
        data: None,
    })
}
