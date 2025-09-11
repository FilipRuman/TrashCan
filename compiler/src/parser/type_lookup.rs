use anyhow::{Context, Result};
use std::collections::HashMap;

use crate::{lexer::tokens::TokenKind, parser::Parser};

use super::types::{Type, parse_array_type, parse_reference_type, parse_symbol_type};

pub struct TypeLookup {
    pub binding_power_lu: HashMap<TokenKind, i8>,

    pub led_lu: HashMap<TokenKind, fn(&mut Parser, &i8, Type) -> Result<Type>>,
    pub nod_lu: HashMap<TokenKind, fn(&mut Parser) -> Result<Type>>,
}
impl TypeLookup {
    pub fn get_led(
        &self,
        token_kind: TokenKind,
    ) -> Result<&fn(&mut Parser, &i8, Type) -> Result<Type>> {
        self.led_lu
            .get(&token_kind)
            .with_context(|| format!("led was not found for token kind: {:?}", token_kind))
    }
    pub fn get_nod(&self, token_kind: TokenKind) -> Result<&fn(&mut Parser) -> Result<Type>> {
        self.nod_lu
            .get(&token_kind)
            .with_context(|| format!("nod was not found for token kind: {:?}", token_kind))
    }
    pub fn get_bp(&self, token_kind: &TokenKind) -> Result<&i8> {
        self.binding_power_lu
            .get(token_kind)
            .with_context(|| format!("bp was not found for token kind: {:?}", token_kind))
    }
    fn led(
        &mut self,
        token_kind: TokenKind,
        bp: i8,
        function: fn(&mut Parser, &i8, Type) -> Result<Type>,
    ) {
        self.led_lu.insert(token_kind, function);
        self.binding_power_lu.insert(token_kind, bp);
    }

    fn nod(&mut self, token_kind: TokenKind, bp: i8, function: fn(&mut Parser) -> Result<Type>) {
        self.nod_lu.insert(token_kind, function);
        if bp >= -1 {
            self.binding_power_lu.insert(token_kind, bp);
        }
    }

    pub fn new() -> TypeLookup {
        let mut lookup = TypeLookup {
            binding_power_lu: HashMap::new(),
            led_lu: HashMap::new(),
            nod_lu: HashMap::new(),
        };

        lookup.led(TokenKind::OpenBracket, 5, parse_array_type);
        lookup.nod(TokenKind::Identifier, 1, parse_symbol_type);
        lookup.nod(TokenKind::Reference, 0, parse_reference_type);

        lookup
    }
}
