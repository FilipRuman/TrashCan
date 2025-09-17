use anyhow::*;

use crate::parser::expression::DebugData;

use super::{
    Data, assembly_instructions::*, data_structures::AssemblyData,
    expression_handler_functions::functions::data_types::Function,
};

pub const STACK_HEAD_POINTER: u8 = 254;
pub const STACK_FRAME_POINTER: u8 = 255;
pub fn write_data_to_stack(stack_offset_register: u8, input_register: u8) -> String {
    add(stack_offset_register, STACK_FRAME_POINTER) + &write(stack_offset_register, input_register)
}
pub fn read_data_off_stack(stack_offset_register: u8, output_register: u8) -> String {
    add(stack_offset_register, STACK_FRAME_POINTER) + &read(output_register, stack_offset_register)
}
pub fn change_stack_frame_pointer(offset: u32, assembly_data: &mut AssemblyData) -> Result<String> {
    let offset_register = assembly_data.get_free_register()?;
    let code = set(offset_register, offset) + &add(STACK_FRAME_POINTER, offset_register);
    assembly_data.mark_registers_free(&[offset_register]);
    Ok(code)
}
pub fn validate_data_input_for_function(
    inputs: Vec<Data>,
    function: &Function,
    debug_data: DebugData,
) -> Result<()> {
    if inputs.len() != function.input.len() {
        bail!(
            "expected inputs count for '{}' function: {} found: {}, {debug_data:?}",
            function.name,
            inputs.len(),
            function.input.len()
        )
    }

    for i in 0..inputs.len() {
        let found = inputs[i].data_type.clone();
        let expected = function.input[i].data_type.clone();

        if found != expected {
            bail!(
                "expected input nr:{i} be of type: {expected:?}, found: {found:?}, {debug_data:?}"
            )
        }
    }

    Ok(())
}
