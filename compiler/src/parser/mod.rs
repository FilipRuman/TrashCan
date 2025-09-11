use anyhow::{Result, bail};

use expression::{DebugData, Expression};
use expression_parsing_functions::parse_expr;
use lookup::Lookup;
use type_lookup::TypeLookup;

use crate::lexer::tokens::{Token, TokenKind};

pub mod expression;
pub mod expression_parsing_functions;
pub mod lookup;
pub mod type_lookup;
pub mod types;

pub struct Parser {
    pub index: usize,
    pub tokens: Vec<Token>,
    pub lookup: Lookup,
    pub type_lookup: TypeLookup,
}

const TAKEN_ARRAY_LENGTH_CHECK_SAFETY_CHECK: bool = false;
impl Parser {
    pub fn get_current_debug_data(&self) -> Result<DebugData> {
        Ok(DebugData {
            line: self.current_token()?.line as usize,
        })
    }
    pub fn new(tokens: Vec<Token>) -> Parser {
        Parser {
            index: 0,
            tokens,
            lookup: Lookup::new(),
            type_lookup: TypeLookup::new(),
        }
    }
    pub fn get_token(&self, index: usize) -> Result<&Token> {
        if TAKEN_ARRAY_LENGTH_CHECK_SAFETY_CHECK && index >= self.tokens.len() {
            bail!(
                "index:{} was greater than tokens array length:{} !",
                index,
                self.tokens.len()
            );
        }

        Ok(&self.tokens[index])
    }
    pub fn advance(&mut self) -> Result<&Token> {
        self.index += 1;
        self.get_token(self.index - 1)
    }
    pub fn current_token(&self) -> Result<&Token> {
        self.get_token(self.index)
    }
    pub fn current_token_kind(&self) -> Result<&TokenKind> {
        Ok(&self.get_token(self.index)?.kind)
    }
    pub fn current_bp_type(&self) -> Result<i8> {
        Ok(match self.type_lookup.get_bp(self.current_token_kind()?) {
            Ok(bp) => *bp,
            Err(_) => -1,
        })
    }
    pub fn current_bp(&self) -> Result<&i8> {
        self.lookup
            .get_bp(self.current_token_kind()?, self.get_current_debug_data()?)
    }

    pub fn expect(&mut self, expected: &TokenKind) -> Result<&Token> {
        let current = self.advance()?;
        if &current.kind == expected {
            return Ok(current);
        }

        bail!("Expected: {:?} but found: {:?} ", expected, current);
    }
}
pub fn parse(tokens: Vec<Token>) -> Result<Vec<Expression>> {
    let mut parser = Parser::new(tokens);

    let mut parsed_lines: Vec<Expression> = Vec::new();
    while parser.current_token_kind()? != &TokenKind::EndOfFile {
        println!("\n parse new line :: \n");
        parsed_lines.push(parse_expr(&mut parser, &0)?);
    }

    Ok(parsed_lines)
}
