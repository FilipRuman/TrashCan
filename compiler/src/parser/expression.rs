use crate::lexer::tokens::{Token, TokenKind};

use super::types::Type;

#[derive(Debug, Clone, Copy)]
pub struct DebugData {
    pub line: usize,
}

#[derive(Debug, Clone)]
pub enum Expression {
    As(Box<Expression>, Type, DebugData),
    Dereference(Box<Expression>, DebugData),
    Reference(Box<Expression>, DebugData),
    Boolean(bool, DebugData),

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
        var_type: Option<Type>,
        name: String,
        mutable: bool,

        debug_data: DebugData,
    },
    Grouping(Box<Expression>, DebugData),
    Struct {
        public: bool,
        name: String,
        properties: Vec<Expression>,
        functions: Vec<Expression>,

        debug_data: DebugData,
    },
    StructProperty {
        var_name: String,
        var_type: Type,

        debug_data: DebugData,
    },
    StructFunction {
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
        length: u32,
        properties: Vec<Expression>,
        debug_data: DebugData,
        inside_type: Type,
    },
    InterruptFunction {
        name: String,
        property: Box<Expression>,
        public: bool,
        inside: Vec<Expression>,
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
        left: Box<Expression>,
        right: Box<Expression>,

        debug_data: DebugData,
    },
    Break,
    Return {
        value: Box<Expression>,

        debug_data: DebugData,
    },
    If {
        condition: Box<Expression>,
        inside: Vec<Expression>,

        /// those will be else statements with or without conditions
        chained_elses: Vec<Expression>,
        debug_data: DebugData,
    },
    Else {
        condition: Option<Box<Expression>>,
        inside: Vec<Expression>,

        debug_data: DebugData,
    },
    SquareBrackets {
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
}
impl Expression {
    pub fn debug_data(&self) -> &DebugData {
        match self {
            Expression::InterruptFunction {
                name: _,
                property: _,
                public: _,
                inside: _,
                debug_data,
            } => debug_data,
            Expression::Break => todo!(),
            Expression::Number(_, debug_data) => debug_data,
            Self::Boolean(_, debug_data) => debug_data,
            Expression::String(_, debug_data) => debug_data,
            Expression::Identifier(_, debug_data) => debug_data,

            Expression::Dereference(_, debug_data) => debug_data,
            Expression::Prefix {
                prefix: _,
                value: _,
                debug_data,
            } => debug_data,
            Expression::Keyword(token_kind) => todo!(),
            Expression::Assignment {
                target: _,
                operator: _,
                value: _,
                debug_data,
            } => debug_data,
            Expression::VariableDeclaration {
                var_type: _,
                name: _,
                mutable: _,
                debug_data,
            } => debug_data,
            Expression::Grouping(_, debug_data) => debug_data,
            Expression::Struct {
                public: _,
                name: _,
                properties: _,
                functions: _,
                debug_data,
            } => debug_data,
            Expression::StructProperty {
                var_name: _,
                var_type: _,
                debug_data,
            } => debug_data,
            Expression::StructFunction {
                name: _,
                debug_data,
            } => debug_data,
            Expression::Binary {
                left: _,
                operator: _,
                right: _,
                debug_data,
            } => debug_data,
            Expression::ClassInstantiation {
                name: _,
                properties: _,
                debug_data,
            } => debug_data,
            Expression::ArrayInitialization {
                properties: _,
                debug_data,
                length: _,
                inside_type: _,
            } => debug_data,
            Expression::Function {
                name: _,
                properties: _,
                public: _,
                output: _,
                inside: _,
                debug_data,
            } => debug_data,
            Expression::FunctionProperty {
                var_name: _,
                var_type: _,
                debug_data,
            } => debug_data,
            Expression::MemberExpr {
                left: _,
                right: _,
                debug_data,
            } => debug_data,
            Expression::Return {
                value: _,
                debug_data,
            } => debug_data,
            Expression::If {
                condition: _,
                inside: _,
                debug_data,
                chained_elses: _,
            } => debug_data,
            Expression::Else {
                condition: _,
                inside: _,
                debug_data,
            } => debug_data,
            Expression::SquareBrackets {
                left: _,
                indexes: _,
                debug_data,
            } => debug_data,
            Expression::While {
                condition: _,
                inside: _,
                debug_data,
            } => debug_data,
            Expression::For {
                iterator_name: _,
                iteration_target: _,
                inside: _,
                debug_data,
            } => debug_data,
            Expression::Range {
                from: _,
                to: _,
                debug_data,
            } => debug_data,
            Expression::FunctionCall {
                left: _,
                values: _,
                debug_data,
            } => debug_data,
            Expression::Reference(_, debug_data) => debug_data,
            Expression::Boolean(_, debug_data) => debug_data,
            Expression::As(_, _, debug_data) => debug_data,
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
