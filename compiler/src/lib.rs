use std::collections::VecDeque;

use anyhow::{Context, Ok, Result, bail};
use lexer::tokens;
use log::info;
use parser::expression::Expression;
use tokens::TokenKind;

pub mod assembly_writer;
mod lexer;
mod parser;
pub async fn parse_file(
    input_path: &str,
    input_code_files_base_address: String,
) -> Result<parser::ParserOutput> {
    let content = tokio::fs::read(input_code_files_base_address + input_path)
        .await
        .with_context(|| format!("Couldn't find input file!- '{input_path}'",))?;

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
    parser::parse(tokens).context("encountered while parsing")
}

pub async fn iterative_file_parsing(
    input_path: String,
    input_code_files_base_address: String,
) -> Result<Vec<Expression>> {
    let mut file_contents_from_includes_vec: Vec<Vec<Expression>> = Vec::new();

    let mut files_to_parse: VecDeque<String> = VecDeque::new();
    files_to_parse.push_back(input_path);
    let mut size = 0;

    while files_to_parse.len() != 0 {
        let current_file = files_to_parse.pop_front().unwrap();
        let parsing_output =
            parse_file(&current_file, input_code_files_base_address.clone()).await?;

        size += parsing_output.expressions.len();
        files_to_parse.append(&mut parsing_output.files_to_include.into());

        file_contents_from_includes_vec.push(parsing_output.expressions);
    }

    let mut out_vec = Vec::with_capacity(size);

    for file_contents in file_contents_from_includes_vec.iter_mut().rev() {
        out_vec.append(file_contents);
    }

    Ok(out_vec)
}

pub async fn compile(
    input_path: &str,
    output_path: &str,
    input_code_files_base_address: String,
) -> Result<()> {
    info!("Output:  ------------ \n");
    let expressions =
        iterative_file_parsing(input_path.to_string(), input_code_files_base_address).await?;

    let output_code = assembly_writer::convert_expressions_to_code(expressions)
        .context("encountered while writing asembly")?;
    tokio::fs::write(output_path, &output_code)
        .await
        .context("Couldn't find output file!")?;

    Ok(())
}
