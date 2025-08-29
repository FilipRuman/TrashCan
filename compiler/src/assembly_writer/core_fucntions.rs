use super::{
    AssemblyData, ExpressionOutput,
    assembly_instructions::{phrp, set},
    handle_expr,
};
use crate::parser::expression::Expression;
use anyhow::*;

pub fn print_raw(value: Expression, assembly_data: &mut AssemblyData) -> Result<ExpressionOutput> {
    let peripheral_registry = assembly_data.get_free_register()?;
    let serial_out_data_registry = assembly_data.get_free_register()?;

    let mut output_code = String::new();

    //  serial peripheral index - 0
    output_code += &set(peripheral_registry, 0);

    let expression_output = handle_expr(value, assembly_data)?;
    output_code += &expression_output.code;

    for data in expression_output.data {
        for register in 0..data.size {
            output_code +=
                &(data.read_register(serial_out_data_registry, register, assembly_data)?
                    + &phrp(peripheral_registry, serial_out_data_registry));
        }
    }
    assembly_data.mark_registries_free(&[peripheral_registry, serial_out_data_registry]);
    Ok(ExpressionOutput {
        code: output_code,
        data: Vec::new(),
    })
}
