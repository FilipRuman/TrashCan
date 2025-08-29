pub mod parsing;

use std::collections::HashMap;

use cpu::chips::b32::B32;

use anyhow::{Context, Result};
use log::info;
use parsing::{InstructionData, parse_line};

pub async fn assemble_file(
    input_path: &str,
    output_path: &str,
    code_start_addr_in_memory: u32,
) -> Result<()> {
    let file_contents_u8 = tokio::fs::read(input_path)
        .await
        .context("reading input file")?;

    let text = String::from_utf8(file_contents_u8)?;
    let mut contents: Vec<u8> = Vec::new(); //typical size

    let mut current_line_address: u32 = code_start_addr_in_memory;
    let mut labels: HashMap<String, u32> = HashMap::new();

    let mut instructions: Vec<InstructionData> = Vec::new();
    for (line_nr, line_text) in text.lines().enumerate() {
        let instruction_option =
            parse_line(line_text, line_nr, &mut current_line_address, &mut labels)?;
        if let Some(instruction_data) = instruction_option {
            instructions.push(instruction_data);
        }
    }
    for instruction_data in instructions {
        contents.append(&mut instruction_data_to_binary(instruction_data, &labels)?);
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
            parsing::AdditionalData::Label(label_name) => {
                info!("labels: {labels:?}");
                let addr = labels
                    .get(&label_name)
                    .with_context(|| format!("label with name: {label_name} was not found!"))?;

                B32(*addr as u32)
            }
        };
        output.push(b32.byte(0).0 as u8);
        output.push(b32.byte(1).0 as u8);
        output.push(b32.byte(2).0 as u8);
        output.push(b32.byte(3).0 as u8);
    }
    Ok(output)
}
