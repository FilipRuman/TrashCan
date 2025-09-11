use super::{
    AssemblyData, ExpressionOutput,
    assembly_instructions::{self, comment, phrp, read, set},
    data_structures::{self, Data},
    handle_expr,
    helper_methods::read_data_off_stack,
};
use crate::{assembly_writer::data_structures::DataType, parser::expression::Expression};
use anyhow::*;

pub fn array_len(assembly_data: &mut AssemblyData) -> Result<ExpressionOutput> {
    let mut output_code = String::new();

    let alloc_out = assembly_data.allocate_stack(1)?;
    output_code += &alloc_out.0;

    let data = Data {
        stack_frame_offset: alloc_out.1 as i32,
        size: 1,
        is_reference: false,
        data_type: DataType::U32,
    };

    let read_register = assembly_data.get_free_register()?;
    let var = assembly_data
        .find_var(&assembly_data.current_var_name)?
        .clone();
    output_code += &var.read_register(read_register, 0, assembly_data)?;
    output_code += &data.write_register(read_register, 0, assembly_data)?;

    Ok(ExpressionOutput {
        code: output_code,
        data: Some(data),
    })
}
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
    assembly_data.mark_registers_free(&[peripheral_registry, serial_out_data_registry]);
    Ok(ExpressionOutput {
        code: output_code,
        data: None,
    })
}
pub fn halt_func() -> Result<ExpressionOutput> {
    Ok(ExpressionOutput {
        code: assembly_instructions::halt(),
        data: None,
    })
}
