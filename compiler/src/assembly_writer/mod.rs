use std::collections::HashMap;

use anyhow::{Context, Result, bail};
use assembly_instructions::halt;
use data_structures::*;
use expression_handler_functions::{
    functions::*,
    handle_array_initialization, handle_assignment, handle_binary_expr, handle_bool,
    handle_identifier, handle_if, handle_member_expression, handle_number,
    handle_open_square_brackets, handle_reference, handle_variable_declaration,
    structs::data_types::{Struct, StructProperty},
};
use log::info;

use crate::{lexer::tokens::TokenKind, parser::expression::Expression};

pub mod assembly_instructions;
pub mod core_functions;
pub mod data_structures;
pub mod expression_handler_functions;
pub mod helper_methods;

pub fn convert_expressions_to_code(expressions: Vec<Expression>) -> Result<String> {
    let mut output: String = String::new();
    let mut assembly_data = AssemblyData::new();

    info!("expressions: {expressions:#?}");

    // parse  struct declarations
    for expression in &expressions {
        if let Expression::Struct {
            public,
            name,
            properties: properties_expr,
            functions,
            debug_data,
        } = expression
        {
            let mut size = 0;
            let mut struct_properties = HashMap::with_capacity(properties_expr.len());
            for property_expr in properties_expr {
                let debug_data = property_expr.debug_data();
                let (name, struct_property) =
                    handle_struct_property(property_expr.clone(), size, &mut assembly_data)
                        .with_context(|| format!("{debug_data:?}"))?;

                size += struct_property.data_type.size(&mut assembly_data)?;
                struct_properties.insert(name, struct_property);
            }

            assembly_data.structs.insert(
                name.to_owned(),
                Struct {
                    size,
                    name: name.to_owned(),
                    properties: struct_properties,
                },
            );
        }
    }

    parse_function_declarations(&expressions, &mut assembly_data)?;
    // parse functions inside structs
    //TODO:

    assembly_data.current_offset_from_stack_frame_base = 0;
    // parse rest
    for expression in expressions {
        info!("new expr- {expression:?}");
        output += &handle_expr(expression, &mut assembly_data)?.code;
        assembly_data.current_var_name_for_function.clear();
    }
    output += &halt();

    Ok(output)
}

fn handle_struct_property(
    expr: Expression,
    offset_from_struct_base: u32,
    assembly_data: &mut AssemblyData,
) -> Result<(String, StructProperty)> {
    if let Expression::StructProperty {
        var_name,
        var_type,
        debug_data,
    } = expr
    {
        let data_type = DataType::parse_type(var_type, assembly_data)?;
        Ok((
            var_name.to_owned(),
            StructProperty {
                data_type,
                offset_from_struct_base,
            },
        ))
    } else {
        bail!(
            "handle_struct_property: expecetd inputted expression to be: 'Expression::StructProperty', found: {expr:?}"
        )
    }
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
    match expression.clone() {
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
                    data: None,
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
        Expression::Grouping(expression, debug_data) => handle_expr(*expression, assembly_data),
        Expression::Struct {
                public,
                name,
                properties,
                functions,
                debug_data,
            } => Ok(ExpressionOutput{ code: String::new(), data:None  }),
        Expression::StructProperty {
                var_name,
                var_type,
                debug_data,
            } => Ok(ExpressionOutput{ code: String::new(), data:None  }),
        Expression::StructFunction { name, debug_data } => Ok(ExpressionOutput{ code: String::new(), data:None  }),
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
            } => bail!("this shouldn't be ever called"),
        Expression::ArrayInitialization {
                properties,
                debug_data,
            } => handle_array_initialization(properties, assembly_data, debug_data),
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
            } => bail!(
                "this should not be called because function properties are directly handled by parsing function declarations!"
            ),
        Expression::MemberExpr {
                left,
                right,
                debug_data,
            } => handle_member_expression(*left,
                *right,assembly_data),
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
        Expression::SquareBrackets {
                left,
                indexes,
                debug_data,
            } => handle_open_square_brackets(*left, indexes, assembly_data),
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
                Expression::Reference(expression, debug_data) => handle_reference(*expression,assembly_data),
    }.with_context(|| format!("Handle expression: {expression:?}"))
}
