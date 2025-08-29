use std::collections::{HashMap, VecDeque};

use anyhow::{Context, Result, anyhow, bail};
use assembly_instructions::{cp, halt, set, write};
use expression_handler_functions::{
    handle_assignment, handle_binary_expr, handle_function_call, handle_identifier, handle_if,
    handle_number, handle_variable_declaration,
};
use helper_methods::{read_data_off_stack, write_data_to_stack};
use log::info;

use crate::{
    lexer::tokens::TokenKind,
    parser::expression::{DebugData, Expression},
};

pub mod assembly_instructions;
pub mod core_fucntions;
pub mod expression_handler_functions;
pub mod helper_methods;

pub struct AssemblyData {
    pub free_registries: VecDeque<u8>,
    pub variables: HashMap<String, Data>,
    pub current_label_id: u32,
    pub current_offset_from_stack_frame_base: u32,
    pub structs: HashMap<String, Struct>,
    pub functions: HashMap<String, Function>,
}
#[derive(Clone, Debug)]
pub struct Function {
    pub name: String,
    pub input: Vec<FunctionInputData>,
    pub output: Vec<Data>,
}
#[derive(Clone, Debug)]
pub struct FunctionInputData {
    pub data_type: DataType,
    // this will be negative
    pub stack_frame_offset: i32,
}
pub struct Struct {
    pub size: u32, //TODO::
}

impl AssemblyData {
    pub fn find_var(&self, name: &str) -> Result<&Data> {
        self.variables
            .get(name)
            .with_context(|| format!("variable with name: {name} was not found!"))
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
            variables: HashMap::new(),
            current_label_id: 0,
            current_offset_from_stack_frame_base: 0,
            structs: HashMap::new(),
            functions: HashMap::new(),
        }
    }
    pub fn get_label_name(&mut self, type_name: &str) -> String {
        format!("{type_name}{}", self.current_label_id)
    }

    fn get_free_register(&mut self) -> Result<u8> {
        self.free_registries
            .pop_back()
            .context("all registries are used!")
    }
    fn mark_registries_free(&mut self, slice: &[u8]) {
        for registry in slice {
            self.free_registries.push_back(*registry);
        }
    }
    /// return: base address of allocation
    fn allocate_stack(&mut self, size: u32) -> u32 {
        let allocation_base_addr = self.current_offset_from_stack_frame_base;
        self.current_offset_from_stack_frame_base += size;

        allocation_base_addr
    }
}

#[derive(Debug, Clone)]
pub struct Data {
    pub stack_frame_offset: u32,
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
        output_code += &(set(offset_register, self.stack_frame_offset)
            + &write_data_to_stack(offset_register, input_register));
        assembly_data.mark_registries_free(&[offset_register]);
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
        output_code += &(set(offset_register, self.stack_frame_offset)
            + &read_data_off_stack(offset_register, output_register));
        assembly_data.mark_registries_free(&[offset_register]);
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
            DataType::U32 => format!("U32"),
            DataType::U8 => format!("U8"),
            DataType::Bool => format!("Bool"),
            DataType::Char => format!("Char"),
            DataType::Array { inside, len } => format!("[{}]", inside.to_string()),
            DataType::Struct { name } => format!("{name}"),
            DataType::Pointer { inside } => todo!("*{}", inside.to_string()),
        }
    }
    fn parse_type(
        variable_type: crate::parser::types::Type,
        assembly_data: &mut AssemblyData,
    ) -> Result<DataType> {
        Ok(match variable_type {
            crate::parser::types::Type::Symbol(name) => match name.as_str() {
                "u32" => DataType::U32,
                "u8" => DataType::U8,
                "Bool" => DataType::Bool,
                "Char" => DataType::Char,
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

pub fn convert_expressions_to_code(expressions: Vec<Expression>) -> Result<String> {
    let mut output: String = String::new();
    let mut assembly_data = AssemblyData::new();

    // parse  struct declarations

    // parse function declarations

    // parse rest
    for expression in expressions {
        output += &handle_expr(expression, &mut assembly_data)?.code;
    }
    output += &halt();

    Ok(output)
}

#[derive(Debug, Clone)]
pub struct ExpressionOutput {
    pub code: String,
    pub data: Vec<Data>,
}
pub fn expect_input_len(expressions: &[Expression], expected: usize) -> Result<()> {
    let len = expressions.len();
    if len != expected {
        bail!(
            "expected input expressions count:{}  found: '{:?}' ",
            expected,
            expressions,
        )
    }
    Ok(())
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
#[allow(unused_variables)]
fn handle_expr(
    expression: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    match expression {
        Expression::Number(value, debug_data) => handle_number(value, assembly_data),
        Expression::String(_, debug_data) => todo!(),
        Expression::Identifier(name, debug_data) => {
            handle_identifier(name, assembly_data, debug_data)
        }
        Expression::Prefix {
            prefix,
            value,
            debug_data,
        } => todo!(),
        Expression::Keyword(token_kind) => match token_kind {
            TokenKind::SemiColon => Ok(ExpressionOutput {
                code: "\n".to_string(),
                data: vec![],
            }),
            other => bail!(
                "handle_expr: encountered keyword expression with token kind {other:?}, which was not handled!"
            ),
        },
        Expression::Assignment {
            target,
            operator,
            value,
            debug_data,
        } => handle_assignment(*target, operator, *value, assembly_data),
        Expression::VariableDeclaration {
            var_type,
            name,
            mutable,
            debug_data,
        } => handle_variable_declaration(var_type, name, mutable, assembly_data),
        Expression::Grouping(expression, debug_data) => todo!(),
        Expression::Class {
            public,
            name,
            properties,
            functions,
            debug_data,
        } => todo!(),
        Expression::ClassProperty {
            var_name,
            var_type,
            debug_data,
        } => todo!(),
        Expression::ClassFunction { name, debug_data } => todo!(),
        Expression::Binary {
            left,
            operator,
            right,
            debug_data,
        } => handle_binary_expr(*left, operator, *right, assembly_data),
        Expression::ClassInstantiation {
            name,
            properties,
            debug_data,
        } => todo!(),
        Expression::ArrayInitialization {
            properties,
            debug_data,
        } => todo!(),
        Expression::Function {
            name,
            properties,
            public,
            output,
            inside,
            debug_data,
        } => todo!(),
        Expression::FunctionProperty {
            var_name,
            var_type,
            debug_data,
        } => todo!(),
        Expression::MemberExpr {
            member,
            name,
            debug_data,
        } => todo!(),
        Expression::Return { value, debug_data } => todo!(),
        Expression::If {
            condition,
            inside,
            debug_data,
        } => handle_if(*condition, inside, assembly_data),
        Expression::Else {
            condition,
            inside,
            debug_data,
        } => todo!(),
        Expression::IndexArray {
            left,
            indexes,
            debug_data,
        } => todo!(),
        Expression::While {
            condition,
            inside,
            debug_data,
        } => todo!(),
        Expression::For {
            iterator_name,
            iteration_target,
            inside,
            debug_data,
        } => todo!(),
        Expression::Range {
            from,
            to,
            debug_data,
        } => todo!(),
        Expression::FunctionCall {
            left,
            values,
            debug_data,
        } => handle_function_call(*left, values, debug_data, assembly_data),
        Expression::Out {
            var_type,
            var_name,
            debug_data,
        } => todo!(),
        Expression::PrintRaw { value, debug_data } => todo!(),
    }
}
