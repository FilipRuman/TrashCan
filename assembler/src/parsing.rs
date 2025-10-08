use std::collections::HashMap;

use cpu::chips::{b8::B8, thread::instructions::Instruction};

use anyhow::{Context, Ok, Result, anyhow};
use log::info;
pub fn parse_line(
    line_text: &str,
    line_nr: usize,
    current_line_address: &mut u32,
    labels: &mut HashMap<String, u32>,
) -> Result<Option<InstructionData>> {
    let mut token_line: Vec<Token> = Vec::with_capacity(4); // typical max command size
    for word in line_text.split(&[' ', '\t', ',']) {
        if word.is_empty() {
            continue;
        }
        let token = parse_word(word, current_line_address).with_context(|| {
            format!(
                "encountered err while parsing a word in assembly code- line:{line_nr} word:{word}",
            )
        })?;
        match token {
            Token::Comment => return Ok(None),
            Token::Number(_) => {
                token_line.push(token);
            }
            Token::Identifier(_) => {
                token_line.push(token);
            }
            Token::Label(_, _) => {
                token_line.push(token);
            }
        };
    }

    if token_line.is_empty() {
        return Ok(None);
    }

    Ok(Some(parse_instruction(
        token_line,
        line_nr,
        current_line_address,
        labels,
    )?))
}
pub type InstructionData = (Option<Instruction>, Option<AdditionalData>);

#[derive(Clone)]
pub enum AdditionalData {
    RawNumber(u32),
    Label(String, bool),
}

fn parse_instruction(
    tokens: Vec<Token>,
    line_nr: usize,
    current_line_address: &mut u32,
    labels: &mut HashMap<String, u32>,
) -> Result<InstructionData> {
    match &tokens[0] {
        Token::Comment => Err(anyhow!(
            "encountered comment which should been handled by code in function calling parse_instruction"
        )),
        Token::Label(name, address) => {
            // -1 because the cpu increments its position after jmp by 1
            labels.insert(name.to_owned(), *address - 1);
            Ok((None, None))
        }
        Token::Number(number) => {
            *current_line_address += 1;
            Ok((None, Some(AdditionalData::RawNumber(*number))))
        }
        Token::Identifier(identifier_name) => {
            *current_line_address += 1;
            match identifier_name.as_str() {
                "Jmp" => parse_instruction_1(&tokens, line_nr, Instruction::Jmp).context("Jmp"),
                "RJmp" => parse_instruction_1(&tokens, line_nr, Instruction::RJmp).context("RJmp"),
                "Jmpc" => parse_instruction_2(&tokens, line_nr, Instruction::Jmpc).context("Jmpc"),
                "Init" => parse_instruction_2(&tokens, line_nr, Instruction::Init).context("Init"),
                "Intr" => parse_instruction_2(&tokens, line_nr, Instruction::Intr).context("Intr"),
                "Idt" => parse_instruction_1(&tokens, line_nr, Instruction::Idt).context("Idt"),
                "Phrp" => parse_instruction_2(&tokens, line_nr, Instruction::Phrp).context("Phrp"),
                "Read" => parse_instruction_2(&tokens, line_nr, Instruction::Read).context("Read"),
                "Write" => parse_instruction_2(&tokens, line_nr, Instruction::Write).context("Write"),
                "Cp" => parse_instruction_2(&tokens, line_nr, Instruction::Cp).context("Cp"),
                "Clr" => parse_instruction_1(&tokens, line_nr, Instruction::Clr).context("Clr"),
                "RSet" => {
                    // set takes 2 lines because the second one is value
                    *current_line_address += 1;
                    let additional_data =
                        parse_second_argument_for_set_instruction(&tokens, line_nr,true)?;
                    Ok((
                        Some(Instruction::Set(parse_registry_token(&tokens, 1, line_nr)?)),
                        Some(additional_data),
                    ))
                },
                "RJmpc" => parse_instruction_2(&tokens, line_nr, Instruction::RJmpc).context("RJmpc"),
                "Set" => {
                    // set takes 2 lines because the second one is value
                    *current_line_address += 1;
                    let additional_data =
                        parse_second_argument_for_set_instruction(&tokens, line_nr,false)?;
                    Ok((
                        Some(Instruction::Set(parse_registry_token(&tokens, 1, line_nr)?)),
                        Some(additional_data),
                    ))
                },
                "Pgt" => parse_instruction_1(&tokens, line_nr, Instruction::Pgt).context("Pgt"),

                "Add" => parse_instruction_2(&tokens, line_nr, Instruction::Add).context("Add"),
                "Sub" => parse_instruction_2(&tokens, line_nr, Instruction::Sub).context("Sub"),
                "Div" => parse_instruction_2(&tokens, line_nr, Instruction::Div).context("Div"),
                "Mul" => parse_instruction_2(&tokens, line_nr, Instruction::Mul).context("Mul"),
                "Mod" => parse_instruction_2(&tokens, line_nr, Instruction::Mod).context("Mod"),
                "Neg" => parse_instruction_1(&tokens, line_nr, Instruction::Neg).context("Neg"),
                "Abs" => parse_instruction_1(&tokens, line_nr, Instruction::Abs).context("Abs"),

                "And" => parse_instruction_2(&tokens, line_nr, Instruction::And).context("And"),
                "Or" => parse_instruction_2(&tokens, line_nr, Instruction::Or).context("Or"),
                "Xor" => parse_instruction_2(&tokens, line_nr, Instruction::Xor).context("Xor"),
                "Not" => parse_instruction_1(&tokens, line_nr, Instruction::Not).context("Not"),
                "Shr" => parse_instruction_2(&tokens, line_nr, Instruction::Shr).context("Shr"),
                "Shl" => parse_instruction_2(&tokens, line_nr, Instruction::Shl).context("Shl"),

                "Eq" => parse_instruction_3(&tokens, line_nr, Instruction::Eq).context("Eq"),
                "Gte" => parse_instruction_3(&tokens, line_nr, Instruction::Gte).context("Gte"),
                "Lte" => parse_instruction_3(&tokens, line_nr, Instruction::Lte).context("Lte"),
                "Lt" => parse_instruction_3(&tokens, line_nr, Instruction::Lt).context("Lt"),
                "Gt" => parse_instruction_3(&tokens, line_nr, Instruction::Gt).context("Gt"),

                "Halt" => Ok((Some(Instruction::Halt()), None)).context("Halt"),
                "Sleep" => parse_instruction_1(&tokens, line_nr, Instruction::Sleep).context("Sleep"),
                "Rng" => parse_instruction_3(&tokens, line_nr, Instruction::Rng).context("Rng"),
                "Syscall" => parse_instruction_3(&tokens, line_nr, Instruction::Syscall).context("Syscall"),

                "Push" => parse_instruction_1(&tokens, line_nr, Instruction::Push).context("Push"),
                "Call" => parse_instruction_1(&tokens, line_nr, Instruction::Call).context("Call"),
                "Ret" => Ok((Some(Instruction::Ret()), None)).context("Ret"),
                "Iret"=>parse_instruction_1(&tokens, line_nr, Instruction::IRet).context("IRet"), 

                not_handled_name => Err(anyhow!(
                    "instruction with name: {not_handled_name} doesn't exist / is not currently handled. line: {line_nr}"
                )),
            }.context("Parse_instruction")
        }
    }
}

fn parse_second_argument_for_set_instruction(
    tokens: &[Token],
    line_nr: usize,
    is_relative: bool,
) -> Result<AdditionalData, anyhow::Error> {
    let additional_data = match tokens
        .get(2)
        .with_context(|| format!("instruction at line:{line_nr} needs at least: 2 parameters!"))?
    {
        Token::Number(number) => AdditionalData::RawNumber(*number),
        Token::Label(name, _) => AdditionalData::Label(name.to_owned(), is_relative),
        token => {
            return Err(anyhow!(
                "Set instruction takes a second parameter in form of a raw number or label. instead found: {token:?}"
            ));
        }
    };
    Ok(additional_data)
}

fn parse_instruction_1<F>(
    tokens: &[Token],
    line_nr: usize,
    make: F,
) -> std::result::Result<(Option<Instruction>, Option<AdditionalData>), anyhow::Error>
where
    F: FnOnce(B8) -> Instruction,
{
    let arg1 = parse_registry_token(tokens, 1, line_nr)?;
    Ok((Some(make(arg1)), None))
}

fn parse_instruction_3<F>(
    tokens: &[Token],
    line_nr: usize,
    make: F,
) -> std::result::Result<(Option<Instruction>, Option<AdditionalData>), anyhow::Error>
where
    F: FnOnce(B8, B8, B8) -> Instruction,
{
    let arg1 = parse_registry_token(tokens, 1, line_nr)?;
    let arg2 = parse_registry_token(tokens, 2, line_nr)?;
    let arg3 = parse_registry_token(tokens, 3, line_nr)?;
    Ok((Some(make(arg1, arg2, arg3)), None))
}
fn parse_instruction_2<F>(
    tokens: &[Token],
    line_nr: usize,
    make: F,
) -> std::result::Result<(Option<Instruction>, Option<AdditionalData>), anyhow::Error>
where
    F: FnOnce(B8, B8) -> Instruction,
{
    let arg1 = parse_registry_token(tokens, 1, line_nr)?;
    let arg2 = parse_registry_token(tokens, 2, line_nr)?;
    Ok((Some(make(arg1, arg2)), None))
}
fn safe_get_identifier_token_contents(
    tokens: &[Token],
    index: usize,
    line_nr: usize,
) -> Result<String> {
    match tokens.get(index).with_context(|| {
        format!("instruction at line:{line_nr} needs at least: {index} parameters!")
    })? {
        Token::Identifier(contents) => Ok(contents.to_owned()),
        token => Err(anyhow!(
            "expected identifier found {token:?} at line:{line_nr}"
        )),
    }
}
// fn get_number_token_value(tokens: &[Token], index: usize, line_nr: usize) -> Result<u32> {
//     match tokens.get(index).with_context(|| {
//         format!("instruction at line:{line_nr} needs at least: {index} parameters!")
//     })? {
//         Token::Number(contents) => Ok(*contents),
//         token => Err(anyhow!("expected number found {token:?} at line:{line_nr}")),
//     }
// }
fn parse_registry_token(tokens: &[Token], index: usize, line_nr: usize) -> Result<B8> {
    let text = safe_get_identifier_token_contents(tokens, index, line_nr)?;
    // remove r form register name eg. r0
    let registry_index = text.split_at(1).1;

    let int = registry_index.parse::<u8>().with_context(|| {
        format!("text: '{text}' at line: {line_nr} wasn't a valid register.- {registry_index}")
    })?;

    Ok(B8(int as u8))
}

fn parse_word(word: &str, current_line_address: &mut u32) -> Result<Token> {
    let first_char = word
        .chars()
        .next()
        .context("word didn't have first char!")?;
    match first_char {
        '/' => Ok(Token::Comment),
        '0' => Ok(parse_number_token(word)?),
        '1' => Ok(parse_number_token(word)?),
        '2' => Ok(parse_number_token(word)?),
        '3' => Ok(parse_number_token(word)?),
        '4' => Ok(parse_number_token(word)?),
        '5' => Ok(parse_number_token(word)?),
        '6' => Ok(parse_number_token(word)?),
        '7' => Ok(parse_number_token(word)?),
        '8' => Ok(parse_number_token(word)?),
        '9' => Ok(parse_number_token(word)?),
        // name- remove : form word and get name eg. :test_label
        ':' => Ok(Token::Label(
            word.split_at(1).1.to_string(),
            *current_line_address,
        )),
        _ => Ok(Token::Identifier(word.to_string())),
    }
}

fn parse_number_token(word: &str) -> Result<Token> {
    Ok(Token::Number(parse_num(word).with_context(|| {
        format!("string '{word}' was not a valid u32 number!")
    })?))
}

fn parse_num(s: &str) -> Result<u32, std::num::ParseIntError> {
    if let Some(hex) = s.strip_prefix("0x") {
        u32::from_str_radix(hex, 16)
    } else if let Some(bin) = s.strip_prefix("0b") {
        u32::from_str_radix(bin, 2)
    } else if let Some(oct) = s.strip_prefix("0o") {
        u32::from_str_radix(oct, 8)
    } else {
        // default to decimal
        s.parse::<u32>()
    }
}

#[derive(PartialEq, Debug)]
pub enum Token {
    Comment,
    Number(u32),
    Identifier(String),
    Label(String, u32),
}
