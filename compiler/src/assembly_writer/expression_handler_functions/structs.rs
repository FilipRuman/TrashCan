pub mod data_types;

use std::collections::HashMap;

use anyhow::{Context, Result, bail};
use data_types::Struct;
use log::info;

use crate::{
    assembly_writer::{
        assembly_instructions::comment,
        data_structures::{
            AssemblyData, CodeBlockType, Data, DataType, ExpressionOutput, VariableCodeBlocks,
        },
        expression_handler_functions::functions::handle_function_call,
        handle_expr,
    },
    parser::expression::Expression,
};
pub fn handle_struct_initialization(
    struct_type: Struct,
    assembly_data: &mut AssemblyData,
    inside: Vec<Expression>,
) -> Result<ExpressionOutput> {
    info!("handle_struct_initialization - inside: {inside:#?}");
    if struct_type.properties.len() != inside.len() {
        bail!(
            "Struct only has: '{}' properties, found '{}' assignments - {:?}",
            struct_type.properties.len(),
            inside.len(),
            struct_type.properties.len()
        );
    }
    let mut output_code = String::new();
    output_code += &comment(&format!("handle_struct_initialization {struct_type:#?}"));

    let alloc_base_stack_offset = {
        let (alloc_code, alloc_base_stack_offset) =
            assembly_data.allocate_stack(struct_type.size)?;
        output_code += &alloc_code;
        alloc_base_stack_offset
    };

    for (i, assignment_expression) in inside.iter().enumerate() {
        if let Expression::Assignment {
            target,
            operator,
            value,
            debug_data,
        } = assignment_expression
        {
            if operator.value != "=" {
                bail!("expected '=' operator inside struct initialization, found: {operator:?}");
            }

            let property_name = if let Expression::Identifier(name, _) = *target.to_owned() {
                name
            } else {
                bail!(
                "struct property nr. {i} initialization was not in the correct format. expected target expression of assignment expression to be a
'Expression::Identifier', found '{assignment_expression:#?}'"
            );
            };

            let target_property_type =  struct_type
                .properties
                .get(&property_name)
                .with_context(|| format!("there is no property with name: '{property_name}' on '{struct_type:#?}'\n property nr:{i}, {debug_data:?}"))?;

            assembly_data
                .variable_code_blocks
                .push_front(VariableCodeBlocks {
                    variables: HashMap::new(),
                    code_block_type: CodeBlockType::Exclusive,
                });
            let property_data = Data {
                stack_frame_offset: (alloc_base_stack_offset
                    + target_property_type.offset_from_struct_base)
                    as i32,
                size: target_property_type.data_type.size(assembly_data)?,
                is_reference: target_property_type.is_reference,
                data_type: target_property_type.data_type.clone(),
            };
            assembly_data.add_var(property_data, property_name)?;

            output_code += &handle_expr(assignment_expression.clone(), assembly_data)?.code;

            assembly_data.variable_code_blocks.pop_front();

            // let value_expr_out = handle_expr(*value.to_owned(), assembly_data)?;
            // output_code += &value_expr_out.code;
            //
            // let data = match value_expr_out.data {
            //     Some(data) => {
            //         if data.data_type != target_property_type.data_type {
            //             bail!(
            //                 "struct property nr. {i} initialization was not in the correct format. expected input data type: {:#?}, found data: {:#?}",
            //                 target_property_type.data_type,
            //                 data
            //             )
            //         }
            //         data
            //     }
            //     None => {
            //         bail!(
            //             "struct property nr. {i} initialization was not in the correct format. expected input data type: {:#?}, found data: {:#?}",
            //             target_property_type.data_type,
            //             value_expr_out.data
            //         )
            //     }
            // };
            //
            // for offset in  data.size{
            // data.read_register(output_register, register_to_read_index, assembly_data)
            // }
        } else {
            bail!(
                "struct property nr. {i} initialization was not in the correct format. expected 'Expression::Assignment', found '{assignment_expression:#?}'"
            )
        }
    }

    output_code += &comment("handle_struct_initialization end");
    Ok(ExpressionOutput {
        code: output_code,
        data: Some(Data {
            stack_frame_offset: alloc_base_stack_offset as i32,
            size: struct_type.size,
            is_reference: false,
            data_type: DataType::Struct {
                name: struct_type.name,
            },
        }),
    })
}
pub fn handle_struct_access(
    base_variable: Data,
    struct_name: String,
    assembly_data: &mut AssemblyData,
) -> Result<()> {
    let struct_type = assembly_data
        .find_struct(&struct_name)
        .with_context(|| format!("there is no struct type with name: '{struct_name}'"))?;

    let mut variables = HashMap::with_capacity(struct_type.properties.len());

    for property in struct_type.properties {

        if base_variable.is_reference{

        }else {

        }
        variables.insert(
            property.0,
            Data {
                stack_frame_offset: base_variable.stack_frame_offset
                    + property.1.offset_from_struct_base as i32,
                size: property.1.data_type.size(assembly_data)?,
                is_reference: property.1.is_reference,
                data_type: property.1.data_type,
            },
        );
    }

    assembly_data
        .variable_code_blocks
        .push_front(VariableCodeBlocks {
            variables,
            code_block_type: CodeBlockType::Exclusive,
        });
    Ok(())
}
