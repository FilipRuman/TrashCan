use std::fs;

use anyhow::{Context, Result};
use lexer::tokens;
use log::info;
use tokens::TokenKind;

pub mod assembly_writer;
mod lexer;
mod parser;

pub async fn compile(input_path: &str, output_path: &str) -> Result<()> {
    let content = tokio::fs::read(input_path)
        .await
        .context("Couldn't find input file!")?;
    info!("content:{content:?} ------------ \n");

    info!("tokens:  ------------ \n");
    let tokens = lexer::tokenize(
        String::from_utf8(content)?,
        vec![
            TokenKind::Tab,
            TokenKind::WhiteSpace,
            TokenKind::Comment,
            TokenKind::NextLine,
        ],
    )?;
    for (i, token) in tokens.iter().enumerate() {
        token.debug(i as u32);
    }

    info!("ast:  ------------ \n");

    let expressions = parser::parse(tokens).context("encountered while parsing")?;
    info!("{expressions:?}");

    info!("Output:  ------------ \n");

    let output_code = assembly_writer::convert_expressions_to_code(expressions)
        .context("encountered while writing asembly")?;
    tokio::fs::write(output_path, &output_code)
        .await
        .context("Couldn't find output file!")?;

    info!("{output_code}");
    Ok(())
}
