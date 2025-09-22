use anyhow::{Context, Result, bail};
use log::info;

use crate::{
    lexer::tokens::TokenKind,
    parser::{self, Parser},
};
#[derive(Clone, Debug)]
pub enum Type {
    Symbol(String),
    Reference(Box<Type>),
    Array { left_type: Box<Type>, len: u32 },
}
pub fn parse_reference_type(parser: &mut Parser) -> Result<Type> {
    parser.expect(&TokenKind::Reference)?;
    Ok(Type::Reference(Box::new(
        parse_type(parser, &0).context("parse_reference_type -> inside type")?,
    )))
}
pub fn parse_symbol_type(parser: &mut Parser) -> Result<Type> {
    Ok(Type::Symbol(
        parser.expect(&TokenKind::Identifier)?.value.to_owned(),
    ))
}

pub fn parse_array_type(parser: &mut Parser, bp: &i8, left: Type) -> Result<Type> {
    parser.expect(&TokenKind::OpenBracket)?;
    let len = parser.expect(&TokenKind::Number)?.value.parse::<u32>()?;
    parser.expect(&TokenKind::CloseBracket)?;

    Ok(Type::Array {
        left_type: Box::new(left),
        len,
    })
}
pub fn parse_type(parser: &mut Parser, bp: &i8) -> Result<Type> {
    let nod = parser.current_token()?;

    info!("parse_type - current_token = {nod:?} - bp {bp:?}");
    let mut left = parser.type_lookup.get_nod(nod.kind)?(parser)?;

    while parser.current_bp_type()? > *bp {
        let led = parser.current_token()?.kind;
        let led_fn = parser.type_lookup.get_led(led)?;

        left = led_fn(parser, &parser.current_bp()?.to_owned(), left)?;
    }

    Ok(left)
}
const SHOW_TYPE_DEBUG: bool = true;
fn debug_type(text: &str) {
    if !SHOW_TYPE_DEBUG {
        return;
    }

    info!("{}", text);
}
