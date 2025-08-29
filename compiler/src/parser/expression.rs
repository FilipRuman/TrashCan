use anyhow::{Result, anyhow, bail};
use core::panic;

use anyhow::Context;

use crate::lexer::tokens::{Token, TokenKind};

use super::{
    Parser,
    types::{Type, parse_type},
};

#[derive(Debug, Clone, Copy)]
pub struct DebugData {
    pub line: usize,
}

#[derive(Debug, Clone)]
pub enum Expression {
    Number(u32, DebugData),
    String(String, DebugData),
    Identifier(String, DebugData),
    Prefix {
        prefix: Token,
        value: Box<Expression>,
        debug_data: DebugData,
    },
    Keyword(TokenKind),
    // target operator value
    Assignment {
        target: Box<Expression>,
        operator: Token,
        value: Box<Expression>,

        debug_data: DebugData,
    },
    // type name mutable
    VariableDeclaration {
        var_type: Type,
        name: String,
        mutable: bool,

        debug_data: DebugData,
    },
    Grouping(Box<Expression>, DebugData),
    Class {
        public: bool,
        name: String,
        properties: Vec<Expression>,
        functions: Vec<Expression>,

        debug_data: DebugData,
    },
    ClassProperty {
        var_name: String,
        var_type: Type,

        debug_data: DebugData,
    },
    ClassFunction {
        name: String, /* ,type : Type */

        debug_data: DebugData,
    },

    Binary {
        left: Box<Expression>,
        operator: Token,
        right: Box<Expression>,

        debug_data: DebugData,
    },
    ClassInstantiation {
        name: String,
        properties: Vec<Expression>,

        debug_data: DebugData,
    },
    ArrayInitialization {
        properties: Vec<Expression>,

        debug_data: DebugData,
    },
    Function {
        name: String,
        properties: Vec<Expression>,
        public: bool,
        output: Option<Type>,
        inside: Vec<Expression>,

        debug_data: DebugData,
    },
    FunctionProperty {
        var_name: String,
        var_type: Type,

        debug_data: DebugData,
    },
    MemberExpr {
        member: Box<Expression>,
        name: String,

        debug_data: DebugData,
    },
    Return {
        value: Box<Expression>,

        debug_data: DebugData,
    },
    If {
        condition: Box<Expression>,
        inside: Vec<Expression>,

        debug_data: DebugData,
    },
    Else {
        condition: Option<Box<Expression>>,
        inside: Vec<Expression>,

        debug_data: DebugData,
    },
    IndexArray {
        left: Box<Expression>,
        indexes: Vec<Expression>,

        debug_data: DebugData,
    },

    While {
        condition: Box<Expression>,
        inside: Vec<Expression>,

        debug_data: DebugData,
    },
    For {
        iterator_name: String,
        iteration_target: Box<Expression>,
        inside: Vec<Expression>,

        debug_data: DebugData,
    },
    Range {
        from: Box<Expression>,
        to: Box<Expression>,
        debug_data: DebugData,
    },
    FunctionCall {
        left: Box<Expression>,
        values: Vec<Expression>,
        debug_data: DebugData,
    },
    Out {
        var_type: Option<Type>,
        var_name: String,
        debug_data: DebugData,
    },
    PrintRaw {
        value: Box<Expression>,
        debug_data: DebugData,
    },
}
impl Expression {
    #[allow(unused_variables)]
    pub fn debug_data(&self) -> &DebugData {
        match self {
            Expression::Number(_, debug_data) => debug_data,
            Expression::String(_, debug_data) => debug_data,
            Expression::Identifier(_, debug_data) => debug_data,
            Expression::Prefix {
                prefix,
                value,
                debug_data,
            } => debug_data,
            Expression::Keyword(token_kind) => todo!(),
            Expression::Assignment {
                target,
                operator,
                value,
                debug_data,
            } => debug_data,
            Expression::VariableDeclaration {
                var_type,
                name,
                mutable,
                debug_data,
            } => debug_data,
            Expression::Grouping(expression, debug_data) => debug_data,
            Expression::Class {
                public,
                name,
                properties,
                functions,
                debug_data,
            } => debug_data,
            Expression::ClassProperty {
                var_name,
                var_type,
                debug_data,
            } => debug_data,
            Expression::ClassFunction { name, debug_data } => debug_data,
            Expression::Binary {
                left,
                operator,
                right,
                debug_data,
            } => debug_data,
            Expression::ClassInstantiation {
                name,
                properties,
                debug_data,
            } => debug_data,
            Expression::ArrayInitialization {
                properties,
                debug_data,
            } => debug_data,
            Expression::Function {
                name,
                properties,
                public,
                output,
                inside,
                debug_data,
            } => debug_data,
            Expression::FunctionProperty {
                var_name,
                var_type,
                debug_data,
            } => debug_data,
            Expression::MemberExpr {
                member,
                name,
                debug_data,
            } => debug_data,
            Expression::Return { value, debug_data } => debug_data,
            Expression::If {
                condition: _,
                inside: _,
                debug_data,
            } => debug_data,
            Expression::Else {
                condition,
                inside,
                debug_data,
            } => debug_data,
            Expression::IndexArray {
                left,
                indexes,
                debug_data,
            } => debug_data,
            Expression::While {
                condition,
                inside,
                debug_data,
            } => debug_data,
            Expression::For {
                iterator_name,
                iteration_target,
                inside,
                debug_data,
            } => debug_data,
            Expression::Range {
                from,
                to,
                debug_data,
            } => debug_data,
            Expression::FunctionCall {
                left,
                values,
                debug_data,
            } => debug_data,
            Expression::Out {
                var_type,
                var_name,
                debug_data,
            } => debug_data,
            Expression::PrintRaw { value, debug_data } => debug_data,
        }
    }
}

const SHOW_EXPRESSION_DEBUG: bool = true;
pub fn debug_expression(text: &str) {
    if !SHOW_EXPRESSION_DEBUG {
        return;
    }

    println!("{}", text);
}
