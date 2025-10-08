pub mod parsing;

use std::collections::HashMap;

use cpu::chips::{b8::B8, b32::B32, thread::instructions::Instruction};

use anyhow::{Context, Result};
use log::info;
use parsing::{InstructionData, parse_line};

pub async fn assemble_file(input_path: &str, output_path: &str) -> Result<()> {
    let file_contents_u8 = tokio::fs::read(input_path)
        .await
        .context("reading input file")?;

    let text = String::from_utf8(file_contents_u8)?;

    let mut contents: Vec<u8> = Vec::new(); //typical size

    // add 1 offset with data that does nothing.
    // this is needed for code that starts with label. labels addr has to be decreased by 1, so if
    // it's addr is 0, -1 it underflows a u32. the offset is needed because JMP instruction adds +1
    // offset.
    let mut current_line_address: u32 = 1;
    let mut instructions: Vec<(InstructionData, u32)> =
        vec![((Some(Instruction::Cp(B8(0), B8(0))), None), 0)];

    let mut labels: HashMap<String, u32> = HashMap::new();
    for (line_nr, line_text) in text.lines().enumerate() {
        let instruction_option =
            parse_line(line_text, line_nr, &mut current_line_address, &mut labels)?;
        if let Some(instruction_data) = instruction_option {
            instructions.push((instruction_data, current_line_address));
        }
    }
    for (instruction_data, line_addr) in instructions {
        contents.append(&mut instruction_data_to_binary(
            instruction_data,
            &labels,
            line_addr,
        )?);
    }
    tokio::fs::write(output_path, contents.clone())
        .await
        .context("writing output file")?;
    info!("assembled file: {input_path}",);
    Ok(())
}
fn instruction_data_to_binary(
    instruction_data: InstructionData,
    labels: &HashMap<String, u32>,
    current_addr: u32,
) -> Result<Vec<u8>> {
    let mut output = Vec::with_capacity(4); // most common size
    if let Some(instruction) = instruction_data.0 {
        let b32: B32 = instruction.into();
        output.push(b32.byte(0).0 as u8);
        output.push(b32.byte(1).0 as u8);
        output.push(b32.byte(2).0 as u8);
        output.push(b32.byte(3).0 as u8);
    }

    if let Some(additional_data) = instruction_data.1 {
        let b32: B32 = match additional_data {
            parsing::AdditionalData::RawNumber(num) => B32(num as u32),
            parsing::AdditionalData::Label(label_name, is_relative) => {
                let addr = labels
                    .get(&label_name)
                    .with_context(|| format!("label with name: {label_name} was not found!"))?;

                if is_relative {
                    let mut value = *addr as i32 - current_addr as i32;
                    //value += -value.signum();

                    B32((value) as u32)
                } else {
                    B32(*addr)
                }
            }
        };
        output.push(b32.byte(0).0 as u8);
        output.push(b32.byte(1).0 as u8);
        output.push(b32.byte(2).0 as u8);
        output.push(b32.byte(3).0 as u8);
    }
    Ok(output)
}
