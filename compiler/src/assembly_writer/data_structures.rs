use std::{
    collections::{HashMap, VecDeque},
    env::Vars,
};

use anyhow::*;
use log::info;

use crate::parser::expression::DebugData;

use super::{assembly_instructions::*, helper_methods::*};

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
    If,
    FunctionCall,
}

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
    pub is_reference: bool,
    // this will be negative because allocated on parent stack frame
    pub stack_frame_offset: i32,
}
impl FunctionInputData {
    pub fn assign(&self, data: &Data, assembly_data: &mut AssemblyData) -> Result<String> {
        let mut output_code = String::new();
        let copy_register = assembly_data.get_free_register()?;

        let offset_register = assembly_data.get_free_register()?;
        if self.is_reference {
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
#[derive(Clone, Debug)]
pub struct Struct {
    pub size: u32,
    pub name: String,
    pub properties: HashMap<String, StructProperty>,
}
impl Struct {
    pub fn access_property(
        &self,
        stack_frame_offset: u32,
        name: String,
        debug_data: DebugData,
        assembly_data: &mut AssemblyData,
    ) -> Result<ExpressionOutput> {
        let mut output_code = String::new();
        let property = self.properties.get(&name).with_context(|| {
            format!(
                "there was not property with name:'{name}' on:'{}, {debug_data:?}",
                self.name
            )
        })?;
        let stack_alloc = assembly_data.allocate_stack(1)?;
        output_code += &stack_alloc.0;
        let pointer_stack_offset_register = assembly_data.get_free_register()?;
        let alloc_addr_register = assembly_data.get_free_register()?;

        if property.is_reference {
            todo!()
        } else {
            output_code += &(set(alloc_addr_register, stack_alloc.1)
                + &set(
                    pointer_stack_offset_register,
                    stack_frame_offset + property.offset_from_struct_base,
                ));
        }

        write_data_to_stack(alloc_addr_register, pointer_stack_offset_register);
        assembly_data.mark_registers_free(&[pointer_stack_offset_register, alloc_addr_register]);
        Ok(ExpressionOutput {
            code: output_code,
            data: Some(Data {
                stack_frame_offset: stack_alloc.1 as i32,
                size: property.data_type.size(assembly_data)?,
                is_reference: true,
                data_type: property.data_type.clone(),
            }),
        })
    }
}

#[derive(Clone, Debug)]
pub struct StructProperty {
    pub is_reference: bool,
    pub data_type: DataType,
    pub offset_from_struct_base: u32,
}
impl AssemblyData {
    pub fn add_var(&mut self, data: Data, name: String) -> Result<()> {
        for code_block in &self.variable_code_blocks {
            if code_block.variables.contains_key(&name) {
                bail!("variable with name:'{name}' already exists!");
            }

            if let CodeBlockType::FunctionCall = code_block.code_block_type {
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

            if let CodeBlockType::FunctionCall = code_block.code_block_type {
                {
                    break;
                }
            }
        }
        bail!("variable with name: {name} was not found!");
    }

    pub fn find_struct(&self, name: &str) -> Result<&Struct> {
        self.structs
            .get(name)
            .with_context(|| format!("struct with name: {name} was not found!"))
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
                code_block_type: CodeBlockType::FunctionCall,
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
                    bail!("data type with name:{other} was not handled by DataType::parse_type()");
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
