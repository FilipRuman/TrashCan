use anyhow::*;

use crate::parser::expression::DebugData;

use super::{Data, Function, assembly_instructions::*};

pub const STACK_BASE_POINTER: u8 = 254;
pub const STACK_FRAME_POINTER: u8 = 255;
pub fn write_data_to_stack(stack_offset_register: u8, input_register: u8) -> String {
    add(stack_offset_register, STACK_FRAME_POINTER) + &write(stack_offset_register, input_register)
}
pub fn read_data_off_stack(stack_offset_register: u8, output_register: u8) -> String {
    add(stack_offset_register, STACK_FRAME_POINTER) + &read(output_register, stack_offset_register)
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
// pub fn while_loop(condition_code: String, condition_registry: u8, contents: String) -> String {
//     set(condition_registry, 1) + jmpc(address_registry, condition_registry)
// }
