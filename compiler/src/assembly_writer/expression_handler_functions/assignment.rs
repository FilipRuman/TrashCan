use crate::{
    assembly_writer::{
        assembly_instructions::*,
        data_structures::{AssemblyData, DataType, ExpressionOutput},
        handle_expr,
    },
    lexer::tokens::Token,
    parser::{expression::Expression, types::Type},
};
use anyhow::{Context, Result, bail};

use super::handle_binary_expr;

pub fn assign_new_variable(
    var_type: Option<Type>,
    name: String,
    mutable: bool,
    value: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code: String = String::new();

    output_code += &comment("assign_new_variable");

    let value_expression_output = handle_expr(value, assembly_data)?;
    output_code += &value_expression_output.code;
    let data = value_expression_output
        .data
        .context("value expression doesn't output any data!")?
        .clone();

    if let Some(target_var_type) = var_type {
        let target_data_type = DataType::parse_type(target_var_type, assembly_data)?;
        if !data.data_type.eq(&target_data_type) {
            bail!(
                "expected: {:?} found: {:?}",
                target_data_type,
                data.data_type,
            );
        }
    }
    assembly_data.add_var(data, name)?;

    output_code += &comment("assign_new_variable - end");

    Ok(ExpressionOutput {
        code: output_code,
        data: None,
    })
}
pub fn handle_assignment(
    target: Expression,
    operator: Token,
    value: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code: String = String::new();

    output_code += &comment("assignment");
    if let Expression::VariableDeclaration {
        var_type,
        name,
        mutable,
        debug_data,
    } = target.clone()
    {
        if operator.value != "=" {
            bail!(
                "you can't apply '{}' operation to variable declaration",
                operator.value
            );
        }
        return assign_new_variable(var_type, name, mutable, value, assembly_data)
            .context("assign_new_variable");
    }
    let target_expr_out = handle_expr(target.clone(), assembly_data)?;
    output_code += &target_expr_out.code;

    assembly_data.current_var_name_for_function.clear();

    let data = if operator.value != "=" {
        let binary_operator = Token {
            kind: crate::lexer::tokens::TokenKind::Arrow, // whatever
            value: operator.value.split_at(1).0.to_string(),
            line: operator.line,
        };

        let binary_expr_output =
            handle_binary_expr(target.clone(), binary_operator, value, assembly_data)?;
        output_code += &binary_expr_output.code;
        binary_expr_output
            .data
            .context("binary expression doesn't output any data!")?
    } else {
        let value_expression_output = handle_expr(value, assembly_data)?;
        output_code += &value_expression_output.code;
        value_expression_output
            .data
            .context("value expression doesn't output any data!")?
            .clone()
    };

    let target_data = target_expr_out
        .data
        .context("expected target expression to output data!")?;

    if !data.data_type.eq(&target_data.data_type) {
        bail!(
            "expected: {:?} found: {:?} {:?}",
            target_data.data_type,
            data.data_type,
            target.debug_data()
        );
    }

    output_code += &comment(&format!("assignment data: {data:?}"));
    let read_registry = assembly_data.get_free_register()?;

    output_code += &comment(&format!(
        "assignment- variable.is_reference: {} data.is_reference: {} ",
        target_data.is_reference(),
        data.is_reference()
    ));

    if target_data.is_reference() && data.is_reference() {
        output_code += &data.read_referenced_address(read_registry, assembly_data)?;
        output_code +=
            &target_data.write_to_last_reference_in_chain(read_registry, assembly_data)?;
    } else {
        for offset in 0..data.size {
            output_code += &data.read_register(read_registry, offset, assembly_data)?;
            output_code += &target_data.write_register(read_registry, offset, assembly_data)?;
        }
    }

    assembly_data.current_var_name_for_function.clear();

    output_code += &comment("end assignment");
    assembly_data.mark_registers_free(&[read_registry]);

    Ok(ExpressionOutput {
        code: output_code,
        data: None,
    })
}
