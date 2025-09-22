use crate::{assembly_writer::data_structures::DataType, parser::expression::Expression};
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
