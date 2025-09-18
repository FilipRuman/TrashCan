use crate::{
    assembly_writer::{
        assembly_instructions::set,
        data_structures::{AssemblyData, Data, DataType, ExpressionOutput},
        helper_methods::write_data_to_stack,
    },
    parser::expression::{DebugData, Expression},
};
use anyhow::{Context, Result, bail};
use std::collections::HashMap;

#[derive(Clone, Debug)]
pub struct StructProperty {
    pub data_type: DataType,
    pub offset_from_struct_base: u32,
}
#[derive(Clone, Debug)]
pub struct Struct {
    pub size: u32,
    pub name: String,
    pub properties: HashMap<String, StructProperty>,
    pub contents_parsed: StructParsingState,
}

#[derive(Clone, Debug)]
pub enum StructParsingState {
    Done,
    Awaiting { properties: Vec<Expression> },
}
