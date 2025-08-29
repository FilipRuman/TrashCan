use anyhow::*;
use log::info;

use crate::{
    lexer::tokens::TokenKind,
    parser::{self, Parser},
};
#[derive(Clone, Debug)]
pub enum Type {
    Symbol(String),
    Array {
        left_type: Box<Type>,
        dimensions: usize,
    },
}

pub fn parse_symbol_type(parser: &mut Parser) -> Result<Type> {
    Ok(Type::Symbol(
        parser.expect(&TokenKind::Identifier)?.value.to_owned(),
    ))
}

pub fn parse_array_type(parser: &mut Parser, bp: &i8, left: Type) -> Result<Type> {
    parser.expect(&TokenKind::OpenBracket)?;
    let mut dimensions = 0;
    while parser.current_token_kind()? == &TokenKind::Comma {
        parser.advance()?;
        dimensions += 1;
    }
    parser.expect(&TokenKind::CloseBracket)?;

    Ok(Type::Array {
        left_type: Box::new(left),
        dimensions,
    })
}
pub fn parse_type(parser: &mut Parser, bp: &i8) -> Result<Type> {
    let nod = parser.current_token()?;
    let mut left = parser.type_lookup.get_nod(nod.kind)?(parser)?;

    while parser.current_bp()? > bp {
        let led = parser.current_token()?.kind.clone();
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
