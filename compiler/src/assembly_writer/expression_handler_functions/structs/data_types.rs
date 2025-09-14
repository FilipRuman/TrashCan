use crate::{
    assembly_writer::{
        assembly_instructions::set,
        data_structures::{AssemblyData, Data, DataType, ExpressionOutput},
        helper_methods::write_data_to_stack,
    },
    parser::expression::DebugData,
};
use anyhow::{Context, Result, bail};
use std::collections::HashMap;

#[derive(Clone, Debug)]
pub struct StructProperty {
    pub is_reference: bool,
    pub data_type: DataType,
    pub offset_from_struct_base: u32,
}
#[derive(Clone, Debug)]
pub struct Struct {
    pub size: u32,
    pub name: String,
    pub properties: HashMap<String, StructProperty>,
}
impl Struct {
    // pub fn access_property(
    //     &self,
    //     stack_frame_offset: u32,
    //     name: String,
    //     debug_data: DebugData,
    //     assembly_data: &mut AssemblyData,
    // ) -> Result<ExpressionOutput> {
    //     let mut output_code = String::new();
    //     let property = self.properties.get(&name).with_context(|| {
    //         format!(
    //             "there was not property with name:'{name}' on:'{}, {debug_data:?}",
    //             self.name
    //         )
    //     })?;
    //     let stack_alloc = assembly_data.allocate_stack(1)?;
    //     output_code += &stack_alloc.0;
    //     let pointer_stack_offset_register = assembly_data.get_free_register()?;
    //     let alloc_addr_register = assembly_data.get_free_register()?;
    //
    //     if property.is_reference {
    //         todo!()
    //     } else {
    //         output_code += &(set(alloc_addr_register, stack_alloc.1)
    //             + &set(
    //                 pointer_stack_offset_register,
    //                 stack_frame_offset + property.offset_from_struct_base,
    //             ));
    //     }
    //
    //     write_data_to_stack(alloc_addr_register, pointer_stack_offset_register);
    //     assembly_data.mark_registers_free(&[pointer_stack_offset_register, alloc_addr_register]);
    //     Ok(ExpressionOutput {
    //         code: output_code,
    //         data: Some(Data {
    //             stack_frame_offset: stack_alloc.1 as i32,
    //             size: property.data_type.size(assembly_data)?,
    //             is_reference: true,
    //             data_type: property.data_type.clone(),
    //         }),
    //     })
    // }
}
