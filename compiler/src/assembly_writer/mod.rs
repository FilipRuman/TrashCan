use std::collections::{HashMap, VecDeque};
// to do change:
// class -> struct
// let u32 i -> let i: u32
// ^^the same thing in functions^^

use anyhow::{Context, Result, anyhow, bail};
use assembly_instructions::{cp, halt, set, write};
use data_structures::*;
use expression_handler_functions::{
    handle_assignment, handle_binary_expr, handle_bool, handle_function, handle_function_call,
    handle_identifier, handle_if, handle_number, handle_variable_declaration,
};
use helper_methods::{read_data_off_stack, write_data_to_stack};
use log::info;

use crate::{
    lexer::tokens::TokenKind,
    parser::expression::{DebugData, Expression},
};

pub mod assembly_instructions;
pub mod core_fucntions;
pub mod data_structures;
pub mod expression_handler_functions;
pub mod helper_methods;

pub fn convert_expressions_to_code(expressions: Vec<Expression>) -> Result<String> {
    let mut output: String = String::new();
    let mut assembly_data = AssemblyData::new();

    // parse  struct declarations
    for expression in &expressions {
        if let Expression::Class {
            public,
            name,
            properties,
            functions,
            debug_data,
        } = expression
        {
            todo!();
            // assembly_data.structs.insert(name, Struct { size:  })
        }
    }

    parse_function_declarations(&expressions, &mut assembly_data)?;
    // parse struct contents

    assembly_data.current_offset_from_stack_frame_base = 0;
    // parse rest
    for expression in expressions {
        info!("new expr- {expression:?}");
        output += &handle_expr(expression, &mut assembly_data)?.code;
    }
    output += &halt();

    Ok(output)
}

fn parse_function_declarations(
    expressions: &Vec<Expression>,
    assembly_data: &mut AssemblyData,
) -> Result<()> {
    for expression in expressions {
        if let Expression::Function {
            name,
            properties: input_types,
            public: _,
            output: output_types,
            inside: _,
            debug_data: _,
        } = expression
        {
            // -1 because the start of the stack frame will be address that you need to jump back to.
            let mut current_stack_offset = -1;
            let mut input = Vec::with_capacity(input_types.len());
            for input_expression in input_types {
                let (input_type, var_name) = if let Expression::FunctionProperty {
                    var_name,
                    var_type,
                    debug_data: _,
                } = input_expression
                {
                    (var_type.clone(), var_name.to_owned())
                } else {
                    bail!("expected function property!");
                };

                let data_type = DataType::parse_type(input_type, assembly_data)?;

                let offset = current_stack_offset;
                current_stack_offset -= data_type.size(assembly_data)? as i32;
                input.push(FunctionInputData {
                    name: var_name.to_owned(),
                    data_type,
                    stack_frame_offset: offset,
                });
            }
            let mut output = Vec::with_capacity(output_types.len());
            for output_type in output_types {
                let data_type = DataType::parse_type(output_type.to_owned(), assembly_data)?;

                let offset = current_stack_offset;
                current_stack_offset -= data_type.size(assembly_data)? as i32;
                output.push(FunctionInputData {
                    name: name.to_owned(),
                    data_type,
                    stack_frame_offset: offset,
                });
            }

            let label_name = assembly_data.get_label_name(&format!("function_{name}_"));
            assembly_data.functions.insert(
                name.to_owned(),
                Function {
                    name: name.to_owned(),
                    input,
                    output,
                    label_name,
                },
            );
        }
    }
    Ok(())
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

#[allow(unused_variables)]
fn handle_expr(
    expression: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    info!("handle_expr - {expression:?}");
    match expression {
        Expression::Number(value, debug_data) => handle_number(value, assembly_data),
        Expression::Boolean(value, debug_data) => handle_bool(value, assembly_data),

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
        } => handle_variable_declaration(var_type, name, mutable, assembly_data, debug_data),
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
        } => handle_function(name, inside, assembly_data),
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
