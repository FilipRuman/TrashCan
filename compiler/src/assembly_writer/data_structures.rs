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
    pub output: Vec<FunctionInputData>,
    pub label_name: String,
}
#[derive(Clone, Debug)]
pub struct FunctionInputData {
    pub name: String,
    pub data_type: DataType,
    //
    // this will be negative
    pub stack_frame_offset: i32,
}
impl FunctionInputData {
    pub fn assign(&self, data: &Data, assembly_data: &mut AssemblyData) -> Result<String> {
        let mut output_code = String::new();
        let copy_register = assembly_data.get_free_register()?;

        let offset_register = assembly_data.get_free_register()?;
        for offset in 0..data.size {
            output_code += &(set(
                offset_register,
                (offset as i32 + self.stack_frame_offset) as u32,
            ) + &data.read_register(copy_register, offset, assembly_data)?
                + &write_data_to_stack(offset_register, copy_register));
        }

        assembly_data.mark_registers_free(&[offset_register, copy_register]);
        Ok(output_code)
    }
}
#[derive(Clone, Debug)]
pub struct Struct {
    pub size: u32, //TODO::
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
    pub data_type: DataType,
    // pub is_pointer: bool,
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
        output_code += &(set(offset_register, self.stack_frame_offset as u32)
            + &write_data_to_stack(offset_register, input_register));
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
        register_index: u32,
        assembly_data: &mut AssemblyData,
    ) -> Result<String> {
        if self.size < register_index {
            bail!(
                "you tried to read outside of the variable size: {}  index: {} variable: {:?} ",
                self.size,
                register_index,
                self
            )
        }
        let mut output_code = String::new();
        let offset_register = assembly_data.get_free_register()?;
        output_code += &(set(offset_register, self.stack_frame_offset as u32)
            + &read_data_off_stack(offset_register, output_register));
        assembly_data.mark_registers_free(&[offset_register]);
        Ok(output_code)
    }
}

#[derive(Debug, Clone, PartialEq)]
pub enum DataType {
    U32,
    U8,
    Bool,
    Char,
    Array { inside: Box<DataType>, len: u32 },
    Struct { name: String },
    Pointer { inside: Box<DataType> },
}
impl DataType {
    pub fn to_string(&self) -> String {
        match self {
            DataType::U32 => "U32".to_string(),
            DataType::U8 => "U8".to_string(),
            DataType::Bool => "Bool".to_string(),
            DataType::Char => "Char".to_string(),
            DataType::Array { inside, len } => format!("[{}]", inside.to_string()),
            DataType::Struct { name } => name.to_string(),
            DataType::Pointer { inside } => todo!("*{}", inside.to_string()),
        }
    }
    pub fn parse_type(
        variable_type: crate::parser::types::Type,
        assembly_data: &mut AssemblyData,
    ) -> Result<DataType> {
        Ok(match variable_type {
            crate::parser::types::Type::Symbol(name) => match name.as_str() {
                "u32" => DataType::U32,
                "u8" => DataType::U8,
                "bool" => DataType::Bool,
                "char" => DataType::Char,
                other => {
                    bail!("data type with name:{other} was not handled by DataType::parse_type()");
                }
            },
            crate::parser::types::Type::Array {
                left_type,
                dimensions,
            } => DataType::Array {
                inside: Box::new(DataType::parse_type(*left_type, assembly_data)?),
                len: dimensions as u32,
            },
        })
    }
    pub fn size(&self, assembly_data: &mut AssemblyData) -> Result<u32> {
        Ok(match self {
            DataType::U32 => 1,
            DataType::U8 => 1, //TODO: add support for 8 bit size variables
            DataType::Bool => 1,
            DataType::Char => 1,
            DataType::Array { inside, len } => {
                inside.size(assembly_data).context("DataType::size()")? * len
            }
            DataType::Struct { name } => assembly_data.find_struct(name)?.size,
            DataType::Pointer { inside } => todo!(),
        })
    }
}

impl ExpressionOutput {
    pub fn expect_data_len(&self, expected: usize, debug_data: &DebugData) -> Result<()> {
        let len = self.data.len();
        if len != expected {
            bail!(
                "expected {} output data found {} {:?}",
                expected,
                len,
                debug_data
            )
        }
        Ok(())
    }
}
#[derive(Debug, Clone)]
pub struct ExpressionOutput {
    pub code: String,
    pub data: Vec<Data>,
}
