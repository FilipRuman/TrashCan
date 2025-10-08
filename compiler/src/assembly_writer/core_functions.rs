use super::assembly_instructions::{
    absolute_set_label, add, comment, cp, jmp, jmp_label, label, read, relative_jmp,
    relative_set_label, write,
};
use super::data_structures::{Data, StaticVariable};
use super::expression_handler_functions::functions::{call_function_code, handle_function_call};
use super::helper_methods::{self, STACK_FRAME_POINTER};
use super::{
    AssemblyData, ExpressionOutput,
    assembly_instructions::{self, phrp, set},
    handle_expr,
};
use crate::{assembly_writer::data_structures::DataType, parser::expression::Expression};
use anyhow::*;
use log::info;

#[repr(u32)]
pub enum SyscallTypeID {
    Print = 0,
    Malloc = 1,
}

pub fn syscall(
    id_expression: Expression,
    data_expression: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    let id_expr_out = handle_expr(id_expression, assembly_data)?;
    output_code += &id_expr_out.code;
    let data_expr_out = handle_expr(data_expression, assembly_data)?;
    output_code += &data_expr_out.code;

    let output_data_alloc_out = assembly_data.allocate_stack(1)?;
    output_code += &output_data_alloc_out.0;

    let output_data = Data {
        stack_frame_offset: output_data_alloc_out.1 as i32,
        size: 1,
        data_type: DataType::U32,
    };

    let syscall_id_register = assembly_data.get_free_register()?;
    output_code += &id_expr_out
        .data
        .context("expected syscall id expression to output data")?
        .read_register(syscall_id_register, 0, assembly_data)?;
    let input_data_register = assembly_data.get_free_register()?;
    output_code += &data_expr_out
        .data
        .context("expected input data expression to output data")?
        .read_referenced_address(input_data_register, assembly_data)?;

    let output_data_register = assembly_data.get_free_register()?;
    output_code += &output_data.read_addr_of_self(output_data_register);

    output_code += &assembly_instructions::syscall(
        syscall_id_register,
        input_data_register,
        output_data_register,
    );

    output_code += &output_data.write_register(output_data_register, 0, assembly_data)?;
    assembly_data.mark_registers_free(&[
        output_data_register,
        syscall_id_register,
        input_data_register,
    ]);

    Ok(ExpressionOutput {
        code: output_code,
        data: Some(output_data),
    })
}

pub fn mark(expr: Expression, assembly_data: &mut AssemblyData) -> Result<ExpressionOutput> {
    let text = if let Expression::String(text, _) = expr {
        text
    } else {
        bail!("expected input expression to be a string")
    };
    Ok(ExpressionOutput {
        code: format!("//; {text} \n"),
        data: None,
    })
}
pub fn read_addr_of_function(
    input_expr: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    let alloc_out = assembly_data.allocate_stack(1)?;

    let addr_register = assembly_data.get_free_register()?;
    output_code += &alloc_out.0;
    let data = Data {
        stack_frame_offset: alloc_out.1 as i32,
        size: 1,
        data_type: DataType::U32,
    };
    let function_name = if let Expression::String(value, _) = input_expr {
        value.split_at(1).1.to_owned()
    } else {
        bail!("expected input expression to be a string - name of the function!");
    };
    let function_label = assembly_data.find_function(&function_name)?;

    output_code += &helper_methods::absolute_set_label(
        addr_register,
        &function_label.label_name.clone(),
        assembly_data,
    )?;
    output_code += &data.write_register(addr_register, 0, assembly_data)?;

    assembly_data.mark_registers_free(&[addr_register]);
    Ok(ExpressionOutput {
        code: output_code,
        data: Some(data),
    })
}

pub fn idt(input_expr: Expression, assembly_data: &mut AssemblyData) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    let expr_out = handle_expr(input_expr, assembly_data)?;
    output_code += &expr_out.code;

    let data = expr_out
        .data
        .context("expected input expression to output data")?;
    let data_copy_register = assembly_data.get_free_register()?;
    if data.data_type == DataType::U32 {
        output_code += &(data.read_register(data_copy_register, 0, assembly_data)?
            + &assembly_instructions::idt(data_copy_register));
    } else {
        bail!("expected input expression to output data of type 'U32'")
    }
    assembly_data.mark_registers_free(&[data_copy_register]);
    Ok(ExpressionOutput {
        code: output_code,
        data: None,
    })
}

pub fn direct_reference_access(
    input_expr: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    output_code += &comment("direct_reference_access");
    let alloc_out = assembly_data.allocate_stack(1)?;
    output_code += &alloc_out.0;
    let data = Data {
        stack_frame_offset: alloc_out.1 as i32,
        size: 1,
        data_type: DataType::Reference {
            inside: Box::new(DataType::U32),
            offset_of_data_from_reference_addr: 0,
        },
    };

    output_code += &comment("direct_reference_access - handle_inside_expr");
    let input_expr_out = handle_expr(input_expr, assembly_data)?;
    output_code += &input_expr_out.code;
    output_code += &comment("direct_reference_access - handle_inside_expr- end");

    let data_copy_register = assembly_data.get_free_register()?;
    output_code += &(input_expr_out
        .data
        .context("expected input expression to output data!")?
        .read_addr_of_last_reference_in_chain(data_copy_register, assembly_data)?
        + &data.write_directly_to_reference_pointer(data_copy_register, assembly_data)?);

    assembly_data.mark_registers_free(&[data_copy_register]);

    output_code += &comment("direct_reference_accesss - end");
    Ok(ExpressionOutput {
        code: output_code,
        data: Some(data),
    })
}
pub fn print(input_expr: Expression, assembly_data: &mut AssemblyData) -> Result<ExpressionOutput> {
    syscall(
        Expression::Number(SyscallTypeID::Print as u32, input_expr.debug_data()),
        input_expr,
        assembly_data,
    )
}

pub fn malloc(
    input_expression: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    output_code += &comment("malloc");
    let alloc_function = assembly_data
        .find_function("core_allocate")
        .context("to use malloc you need to decleare 'core_allocate' fucntion")?
        .clone();

    output_code += &comment("malloc- input expr");
    let input_expr_out = handle_expr(input_expression, assembly_data)?;
    output_code += &input_expr_out.code;
    let input_data = input_expr_out
        .data
        .context("expected input expression to output data!")?;
    output_code += &comment("malloc- input expr end");

    let alloc_out = assembly_data.allocate_stack(1)?;
    output_code += &alloc_out.0;

    let size_register = assembly_data.get_free_register()?;
    let syscall_id_register = assembly_data.get_free_register()?;
    let output_addr_register = assembly_data.get_free_register()?;
    output_code += &set(syscall_id_register, SyscallTypeID::Malloc as u32);

    let heap_allocation_base_addr_data = Data {
        stack_frame_offset: alloc_out.1 as i32,
        size: 1,
        data_type: DataType::U32,
    };
    output_code += &set(output_addr_register, alloc_out.1);
    output_code += &add(output_addr_register, STACK_FRAME_POINTER);
    output_code +=
        &assembly_instructions::syscall(syscall_id_register, size_register, output_addr_register);

    let heap_allocation_base_addr_register = assembly_data.get_free_register()?;
    output_code += &heap_allocation_base_addr_data.read_register(
        heap_allocation_base_addr_register,
        0,
        assembly_data,
    )?;

    // reuse allocation
    let output_data = Data {
        stack_frame_offset: alloc_out.1 as i32,
        size: input_data.size,
        data_type: DataType::Reference {
            inside: Box::new(input_data.data_type.clone()),
            offset_of_data_from_reference_addr: 0,
        },
    };
    output_code += &output_data
        .write_directly_to_reference_pointer(heap_allocation_base_addr_register, assembly_data)?;
    let data_copy_register = assembly_data.get_free_register()?;

    output_code += &comment("malloc- copy data");
    for i in 0..input_data.size {
        output_code += &(input_data.read_register(data_copy_register, i, assembly_data)?
            + &output_data.write_register(data_copy_register, i, assembly_data)?);
    }

    output_code += &comment("malloc- end");
    assembly_data.mark_registers_free(&[
        size_register,
        data_copy_register,
        heap_allocation_base_addr_register,
    ]);
    Ok(ExpressionOutput {
        code: output_code,
        data: Some(output_data),
    })
}
pub fn free(
    input_expression: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    output_code += &comment("free");

    let alloc_function = assembly_data
        .find_function("core_deallocate")
        .context("to use free you need to declare 'core_deallocate' function")?
        .clone();

    output_code += &comment("free - input expr");

    let input_expr_out = handle_expr(input_expression, assembly_data)?;
    output_code += &input_expr_out.code;
    let input_data = input_expr_out
        .data
        .context("expected input expression to output data!")?;

    let size_register = assembly_data.get_free_register()?;
    let address_register = assembly_data.get_free_register()?;

    let support_register = assembly_data.get_free_register()?;
    if let DataType::Reference {
        ref inside,
        offset_of_data_from_reference_addr,
    } = input_data.data_type
    {
        output_code += &set(size_register, inside.size(assembly_data)?);

        output_code += &(input_data.read_addr_of_self(address_register)
            + &read(address_register, address_register)
            + &set(support_register, offset_of_data_from_reference_addr)
            + &add(address_register, support_register));
    } else {
        bail!("TODO")
    }

    output_code += &comment("free - input expr end");

    // allocate stack for input data for core_deallocate function
    let alloc_out = assembly_data.allocate_stack(2)?;
    output_code += &alloc_out.0;

    let addr_data = {
        let addr_data = Data {
            stack_frame_offset: alloc_out.1 as i32,
            size: 1,
            data_type: DataType::U32,
        };
        output_code += &addr_data.write_register(address_register, 0, assembly_data)?;
        addr_data
    };
    let size_data = {
        let size_data = Data {
            stack_frame_offset: alloc_out.1 as i32 + 1,
            size: 1,
            data_type: DataType::U32,
        };
        output_code += &size_data.write_register(size_register, 0, assembly_data)?;
        size_data
    };
    let function_call_out = call_function_code(
        &[addr_data, size_data],
        alloc_function.clone(),
        assembly_data,
    )?;
    output_code += &function_call_out.code;
    output_code += &comment("free - end");
    assembly_data.mark_registers_free(&[size_register, address_register, support_register]);
    Ok(ExpressionOutput {
        code: output_code,
        data: None,
    })
}
pub fn access_static_variable(
    name_expr: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let name = if let Expression::String(val, _) = name_expr {
        val.split_at(1).1.to_string()
    } else {
        bail!("argument to be a String in function for accessing static variables.");
    };
    let mut output_code = String::new();
    output_code += &comment("access_static_variable");

    let static_variable = assembly_data
        .static_variables
        .get(&name)
        .with_context(|| format!("there was no static variable with name: '{}'", name.clone()))?
        .clone();
    let alloc_out = assembly_data.allocate_stack(1)?;
    output_code += &alloc_out.0;

    let data = Data {
        stack_frame_offset: alloc_out.1 as i32,
        size: 1,
        data_type: DataType::Reference {
            inside: Box::new(static_variable.data_type),
            offset_of_data_from_reference_addr: 0,
        },
    };
    let label_addr_translation_register = assembly_data.get_free_register()?;
    output_code += &(helper_methods::absolute_set_label(
        label_addr_translation_register,
        &name,
        assembly_data,
    )? + &data
        .write_directly_to_reference_pointer(label_addr_translation_register, assembly_data)?);
    assembly_data.mark_registers_free(&[label_addr_translation_register]);

    output_code += &comment("access_static_variable-end");
    Ok(ExpressionOutput {
        code: output_code,
        data: Some(data),
    })
}

pub fn create_static_variable(
    input_data_expression: Expression,
    name_expr: Expression,

    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let name = if let Expression::String(val, _) = name_expr {
        val.split_at(1).1.to_string()
    } else {
        bail!("expected second argument to be a String in function for creating static variables.");
    };
    let mut output_code = String::new();
    let input_data_expr_out = handle_expr(input_data_expression, assembly_data)?;
    output_code += &input_data_expr_out.code;
    let data = input_data_expr_out
        .data
        .context("expected input expression to output data!")?;

    let static_declaration_end_label = assembly_data.get_label_name("static_declaration_end");
    let label_addr_conversion_register = assembly_data.get_free_register()?;
    output_code += &jmp_label(
        &static_declaration_end_label,
        label_addr_conversion_register,
    );
    output_code += &label(&name);
    for _ in 0..data.size {
        //Whatever so that assembler allocates this memory, this should never be run
        output_code += &set(0, 0);
    }

    output_code += &label(&static_declaration_end_label);

    let data_copy_register = assembly_data.get_free_register()?;
    // write input data to static variable
    {
        let alloc_out = assembly_data.allocate_stack(1)?;
        output_code += &alloc_out.0;
        let data_for_static_variable = Data {
            stack_frame_offset: alloc_out.1 as i32,
            size: 1,
            data_type: DataType::Reference {
                inside: Box::new(data.data_type.clone()),
                offset_of_data_from_reference_addr: 0,
            },
        };
        output_code += &(helper_methods::absolute_set_label(
            label_addr_conversion_register,
            &name,
            assembly_data,
        )? + &data_for_static_variable
            .write_directly_to_reference_pointer(label_addr_conversion_register, assembly_data)?);
        for i in 0..data.size {
            output_code += &(data.read_register(data_copy_register, i, assembly_data)?
                + &data_for_static_variable.write_register(
                    data_copy_register,
                    i,
                    assembly_data,
                )?);
        }
    }

    assembly_data.mark_registers_free(&[label_addr_conversion_register, data_copy_register]);

    assembly_data.static_variables.insert(
        name.clone(),
        StaticVariable {
            data_type: data.data_type,
            label: name,
        },
    );

    Ok(ExpressionOutput {
        code: output_code,
        data: None,
    })
}
pub fn memory_access(
    addr_expr: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    output_code += &comment("memory_access");
    let alloc_out = assembly_data.allocate_stack(1)?;

    output_code += &alloc_out.0;

    let data = Data {
        stack_frame_offset: alloc_out.1 as i32,
        size: 1,
        data_type: DataType::Reference {
            inside: Box::new(DataType::U32),
            offset_of_data_from_reference_addr: 0,
        },
    };
    let expr_out = handle_expr(addr_expr, assembly_data)?;
    output_code += &expr_out.code;
    let reference_addr_register = assembly_data.get_free_register()?;
    output_code += &expr_out
        .data
        .context("expected address expression to output data")?
        .read_register(reference_addr_register, 0, assembly_data)?;

    let destination_addr_registry = assembly_data.get_free_register()?;
    output_code +=
        &data.write_directly_to_reference_pointer(reference_addr_register, assembly_data)?;

    assembly_data.mark_registers_free(&[reference_addr_register, destination_addr_registry]);
    output_code += &comment("memory_access- end");
    Ok(ExpressionOutput {
        code: output_code,
        data: Some(data),
    })
}
pub fn array_len(assembly_data: &mut AssemblyData) -> Result<ExpressionOutput> {
    let mut output_code = String::new();

    let alloc_out = assembly_data.allocate_stack(1)?;
    output_code += &alloc_out.0;

    let data = Data {
        stack_frame_offset: alloc_out.1 as i32,
        size: 1,
        data_type: DataType::U32,
    };

    let read_register = assembly_data.get_free_register()?;
    let var = assembly_data
        .find_var(&assembly_data.current_var_name_for_array_initialization)?
        .clone();
    output_code += &var.read_register(read_register, 0, assembly_data)?;
    output_code += &data.write_register(read_register, 0, assembly_data)?;

    Ok(ExpressionOutput {
        code: output_code,
        data: Some(data),
    })
}

pub fn jump(
    address_expression: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();

    let addr_expr_out = handle_expr(address_expression, assembly_data)?;
    output_code += &addr_expr_out.code;

    let address_register = assembly_data.get_free_register()?;
    output_code += &addr_expr_out
        .data
        .context("expected input expression to ouptu data")?
        .read_register(address_register, 0, assembly_data)?;
    output_code += &jmp(address_register);
    Ok(ExpressionOutput {
        code: output_code,
        data: None,
    })
}
pub fn peripheral(
    id_expression: Expression,
    data_expression: Expression,
    assembly_data: &mut AssemblyData,
) -> Result<ExpressionOutput> {
    let mut output_code = String::new();
    let id_expr_out = handle_expr(id_expression, assembly_data)?;
    let data_expr_out = handle_expr(data_expression, assembly_data)?;
    output_code += &(id_expr_out.code + &data_expr_out.code);

    let id_register = assembly_data.get_free_register()?;
    let data_register = assembly_data.get_free_register()?;

    output_code +=
        &id_expr_out
            .data
            .context("id expression")?
            .read_register(id_register, 0, assembly_data)?;
    output_code += &data_expr_out
        .data
        .context("data expression")?
        .read_register(data_register, 0, assembly_data)?;
    output_code += &phrp(id_register, data_register);

    Ok(ExpressionOutput {
        code: output_code,
        data: None,
    })
}

pub fn print_raw(value: Expression, assembly_data: &mut AssemblyData) -> Result<ExpressionOutput> {
    let peripheral_registry = assembly_data.get_free_register()?;
    let serial_out_data_registry = assembly_data.get_free_register()?;

    let mut output_code = String::new();

    let expression_output = handle_expr(value, assembly_data)?;
    output_code += &expression_output.code;

    //  serial peripheral index - 0
    output_code += &set(peripheral_registry, 0);

    if let Some(data) = expression_output.data {
        for register in 0..data.size {
            output_code +=
                &(data.read_register(serial_out_data_registry, register, assembly_data)?
                    + &phrp(peripheral_registry, serial_out_data_registry));
        }
    }
    assembly_data.mark_registers_free(&[peripheral_registry, serial_out_data_registry]);
    Ok(ExpressionOutput {
        code: output_code,
        data: None,
    })
}
pub fn halt_func() -> Result<ExpressionOutput> {
    Ok(ExpressionOutput {
        code: assembly_instructions::halt(),
        data: None,
    })
}
