use anyhow::Result;

use crate::assembly_writer::{
    assembly_instructions::{add, set},
    data_structures::{AssemblyData, Data, DataType},
    helper_methods::{STACK_FRAME_POINTER, write_data_to_stack},
};
#[derive(Clone, Debug)]
pub struct Function {
    pub name: String,
    pub input: Vec<FunctionInputData>,
    pub output: Option<FunctionInputData>,
    pub label_name: String,
}
#[derive(Clone, Debug)]
pub struct FunctionInputData {
    pub name: String,
    pub data_type: DataType,
    // this will be negative because allocated on parent stack frame
    pub stack_frame_offset: i32,
}
impl FunctionInputData {
    pub fn assign(&self, data: &Data, assembly_data: &mut AssemblyData) -> Result<String> {
        let mut output_code = String::new();
        let copy_register = assembly_data.get_free_register()?;

        let offset_register = assembly_data.get_free_register()?;
        if self.data_type.is_reference() {
            output_code += &(set(offset_register, self.stack_frame_offset as u32)
                + &set(copy_register, data.stack_frame_offset as u32)
                + &add(copy_register, STACK_FRAME_POINTER)
                + &write_data_to_stack(offset_register, copy_register));
        } else {
            for offset in 0..data.size {
                output_code += &(set(
                    offset_register,
                    (offset as i32 + self.stack_frame_offset) as u32,
                ) + &data.read_register(copy_register, offset, assembly_data)?
                    + &write_data_to_stack(offset_register, copy_register));
            }
        }

        assembly_data.mark_registers_free(&[offset_register, copy_register]);
        Ok(output_code)
    }
}
