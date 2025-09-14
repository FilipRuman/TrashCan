use std::{
    collections::{HashMap, VecDeque},
    env::Vars,
};

use anyhow::*;
use log::info;

use crate::parser::expression::DebugData;

use super::{
    assembly_instructions::*,
    expression_handler_functions::{functions::data_types::Function, structs::data_types::Struct},
    helper_methods::*,
};

pub struct AssemblyData {
    pub free_registries: VecDeque<u8>,
    pub variable_code_blocks: VecDeque<VariableCodeBlocks>,
    pub current_label_id: u32,
    pub structs: HashMap<String, Struct>,
    pub functions: HashMap<String, Function>,
    pub current_offset_from_stack_frame_base: u32,
    pub current_var_name: String,
}
pub struct VariableCodeBlocks {
    pub variables: HashMap<String, Data>,
    pub code_block_type: CodeBlockType,
}
pub enum CodeBlockType {
    /// allows you to access variables form parent code blocks, eg. if statement, for-loop  
    Inclusive,

    /// blocks you from accessing variables from parent code blocks, eg. function calls
    Exclusive,
}

impl AssemblyData {
    pub fn add_var(&mut self, data: Data, name: String) -> Result<()> {
        for code_block in &self.variable_code_blocks {
            if code_block.variables.contains_key(&name) {
                bail!("variable with name:'{name}' already exists!");
            }

            if let CodeBlockType::Exclusive = code_block.code_block_type {
                break;
            }
        }

        // this shouldn't really ever error out
        let current_code_block = self.variable_code_blocks.get_mut(0).context("AssemblyData::add_var-> this would only happen if there is a bug with popping code blocks too fast.")?;
        info!(
            "add_var - name:{name},code_blocks.variables- {:?} ",
            current_code_block.variables
        );

        current_code_block.variables.insert(name, data);
        Ok(())
    }
    pub fn find_var(&self, name: &str) -> Result<&Data> {
        // iterates thru all code blocks to find the variable.
        // if encounters a function call it stops because you can't access vars from parent
        // function
        for code_block in self.variable_code_blocks.iter() {
            match code_block.variables.get(name) {
                Some(var) => {
                    return Ok(var);
                }
                None => {}
            }

            if let CodeBlockType::Exclusive = code_block.code_block_type {
                {
                    break;
                }
            }
        }
        bail!("variable with name: {name} was not found!");
    }

    pub fn find_struct(&self, name: &str) -> Result<Struct> {
        if let Some(struct_val) = self.structs.get(name) {
            Ok(struct_val.clone())
        } else {
            bail!("struct with name: {name} was not found!")
        }
    }
    pub fn find_function(&self, name: &str) -> Result<&Function> {
        self.functions
            .get(name)
            .with_context(|| format!("function with name: {name} was not found!"))
    }
    pub fn new() -> Self {
        AssemblyData {
            current_var_name: String::new(),
            // 0..=253-> STACK_BASE_POINTER: u8 = 254; && STACK_FRAME_POINTER: u8 = 255;
            free_registries: (0..=253).collect(),
            variable_code_blocks: vec![VariableCodeBlocks {
                variables: HashMap::new(),
                code_block_type: CodeBlockType::Exclusive,
            }]
            .into(),
            current_label_id: 0,
            structs: HashMap::new(),
            functions: HashMap::new(),
            current_offset_from_stack_frame_base: 0,
        }
    }
    pub fn get_label_name(&mut self, type_name: &str) -> String {
        format!("{type_name}{}", self.current_label_id)
    }

    pub fn get_free_register(&mut self) -> Result<u8> {
        self.free_registries
            .pop_back()
            .context("all registries are used!")
    }
    pub fn mark_registers_free(&mut self, slice: &[u8]) {
        for registry in slice {
            self.free_registries.push_back(*registry);
        }
    }
    /// return: base address of allocation
    pub fn allocate_stack(&mut self, size: u32) -> Result<(String, u32)> {
        let allocation_base_addr = self.current_offset_from_stack_frame_base;
        info!(
            "allocate_stack - current: {} size: {}",
            self.current_offset_from_stack_frame_base, size
        );
        self.current_offset_from_stack_frame_base += size;
        let size_register = self.get_free_register()?;
        let code = set(size_register, size) + &add(STACK_HEAD_POINTER, size_register);

        Ok((code, allocation_base_addr))
    }
}

#[derive(Debug, Clone)]
pub struct Data {
    pub stack_frame_offset: i32,
    pub size: u32,
    pub is_reference: bool,
    pub data_type: DataType,
}
impl Data {
    pub fn write_register(
        &self,
        input_register: u8,
        register_index: u32,
        assembly_data: &mut AssemblyData,
    ) -> Result<String> {
        if self.size < register_index {
            bail!(
                "you tried to write outside of the variable size: {}  index: {} variable: {:?} ",
                self.size,
                register_index,
                self
            )
        }
        let mut output_code = String::new();
        let offset_register = assembly_data.get_free_register()?;
        if self.is_reference {
            output_code += &(set(
                offset_register,
                self.stack_frame_offset as u32 + register_index,
            ) + &read_data_off_stack(offset_register, offset_register)
                + &write(offset_register, input_register));
        } else {
            output_code += &(set(
                offset_register,
                self.stack_frame_offset as u32 + register_index,
            ) + &write_data_to_stack(offset_register, input_register));
        }
        assembly_data.mark_registers_free(&[offset_register]);
        Ok(output_code)
    }
    pub fn write_directly_to_reference_pointer(
        &self,
        input_register: u8,
        assembly_data: &mut AssemblyData,
    ) -> Result<String> {
        let mut output_code = String::new();
        let offset_register = assembly_data.get_free_register()?;

        output_code += &(set(offset_register, self.stack_frame_offset as u32)
            + &write_data_to_stack(offset_register, input_register));
        assembly_data.mark_registers_free(&[offset_register]);
        Ok(output_code)
    }
    pub fn read_addr_of_self(&self, output_register: u8) -> String {
        comment("read_addr_of_self")
            + &set(output_register, self.stack_frame_offset as u32)
            + &add(output_register, STACK_FRAME_POINTER)
            + &comment("read_addr_of_self - end")
    }
    pub fn read_pointer_addr(
        &self,
        output_register: u8,
        assembly_data: &mut AssemblyData,
    ) -> Result<String> {
        if !self.is_reference {
            bail!(
                "you tried to read reference addr of variable: {:?} that is not a pointer",
                self
            )
        }
        let offset_register = assembly_data.get_free_register()?;

        let output_code = comment("read_pointer_addr")
            + &set(offset_register, self.stack_frame_offset as u32)
            + &read_data_off_stack(offset_register, output_register);

        assembly_data.mark_registers_free(&[offset_register]);
        Ok(output_code)
    }
    pub fn for_size<F: Fn(u32) -> Result<String>>(&self, function: F) -> Result<String> {
        let mut output = String::new();
        for i in 0..self.size {
            output += &function(i)?;
        }
        Ok(output)
    }
    pub fn read_register(
        &self,
        output_register: u8,
        register_to_read_index: u32,
        assembly_data: &mut AssemblyData,
    ) -> Result<String> {
        if self.size < register_to_read_index {
            bail!(
                "you tried to read outside of the variable size: {}  index: {} variable: {:?} ",
                self.size,
                register_to_read_index,
                self
            )
        }

        let mut output_code = String::new();
        let offset_register = assembly_data.get_free_register()?;
        let index_register = assembly_data.get_free_register()?;
        output_code += &comment(&format!("offset_register: {offset_register}"));
        output_code += &comment(&format!(
            "read_register- self.is_reference: {}",
            self.is_reference
        ));
        if self.is_reference {
            output_code += &(set(offset_register, self.stack_frame_offset as u32)
                + &read_data_off_stack(offset_register, offset_register)
                + &set(index_register, register_to_read_index)
                + &add(offset_register, index_register)
                + &read(output_register, offset_register))
        } else {
            output_code += &(set(
                offset_register,
                self.stack_frame_offset as u32 + register_to_read_index,
            ) + &read_data_off_stack(offset_register, output_register));
        }
        assembly_data.mark_registers_free(&[offset_register, index_register]);
        output_code += &comment(&format!("read_register- end",));
        Ok(output_code)
    }

    pub(crate) fn expect_data_type(&self, expected: &[DataType]) -> Result<()> {
        if expected.contains(&self.data_type) {
            Ok(())
        } else {
            bail!(
                "expected data type from slice: {expected:?}, found: {:?}",
                self.data_type
            )
        }
    }
}

#[derive(Debug, Clone, PartialEq)]
pub enum DataType {
    U32,
    U8,
    Bool,
    Char,
    Array { inside: Box<DataType> },
    Struct { name: String },
    // offset_from_reference_addr -> this means that to read the actual data you need to read addr
    // stored in a reference and then add this offset to it. this is used to read data inside
    // references to a structs
    // Reference {
    //     inside: Box<DataType>,
    //     offset_of_data_from_reference_addr: u32,
    // },
}
impl DataType {
    pub fn to_string(&self) -> String {
        match self {
            DataType::U32 => "U32".to_string(),
            DataType::U8 => "U8".to_string(),
            DataType::Bool => "Bool".to_string(),
            DataType::Char => "Char".to_string(),
            DataType::Array { inside } => "[]".to_string(),
            DataType::Struct { name } => name.to_string(),
        }
    }
    // returns data type + is reference
    pub fn parse_type(
        variable_type: crate::parser::types::Type,
        assembly_data: &mut AssemblyData,
    ) -> Result<(bool, DataType)> {
        Ok(match variable_type {
            crate::parser::types::Type::Symbol(name) => match name.as_str() {
                "u32" => (false, DataType::U32),
                "u8" => (false, DataType::U8),
                "bool" => (false, DataType::Bool),
                "char" => (false, DataType::Char),
                other => {
                    if assembly_data.find_struct(&name).is_ok() {
                        return Ok((false, DataType::Struct { name }));
                    }

                    bail!(
                        "data type with name:{other} was not handled by DataType::parse_type().\n Most of the time this means that struct with that name doesn't exist!"
                    );
                }
            },
            crate::parser::types::Type::Array {
                left_type,
                dimensions,
            } => (
                false,
                DataType::Array {
                    inside: Box::new(DataType::parse_type(*left_type, assembly_data)?.1),
                },
            ),
            crate::parser::types::Type::Reference(inside) => {
                (true, DataType::parse_type(*inside, assembly_data)?.1)
            }
        })
    }
    pub fn size(&self, assembly_data: &mut AssemblyData) -> Result<u32> {
        Ok(match self {
            DataType::U32 => 1,
            DataType::U8 => 1, //TODO: add support for 8 bit size variables
            DataType::Bool => 1,
            DataType::Char => 1,
            DataType::Array { inside } => inside.size(assembly_data).context("DataType::size()")?,
            DataType::Struct { name } => assembly_data.find_struct(name)?.size,
        })
    }
}
#[derive(Debug, Clone)]
pub struct ExpressionOutput {
    pub code: String,
    pub data: Option<Data>,
}
