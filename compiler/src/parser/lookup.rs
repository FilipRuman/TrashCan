use std::collections::HashMap;

use crate::lexer::tokens::TokenKind;
use anyhow::{Context, Result};

use super::{
    Parser,
    expression::Expression,
    expression_parsing_functions::{
        parse_array_initialization, parse_assignment, parse_binary_expr, parse_class,
        parse_class_instantiation, parse_else, parse_for, parse_function, parse_function_call,
        parse_grouping, parse_identifier_nod, parse_if, parse_indexing_array, parse_keyword_nod,
        parse_member_expr, parse_number_nod, parse_out, parse_prefix_nod, parse_range,
        parse_return, parse_string_nod, parse_variable_declaration, parse_while,
    },
};

type LedFunctionType = fn(&mut Parser, &i8, Expression) -> Result<Expression>;

pub struct Lookup {
    pub binding_power_lu: HashMap<TokenKind, i8>,

    pub led_lu: HashMap<TokenKind, LedFunctionType>,
    pub nod_lu: HashMap<TokenKind, fn(&mut Parser) -> Result<Expression>>,
}
impl Lookup {
    pub fn get_led(&self, token_kind: TokenKind) -> Result<&LedFunctionType> {
        self.led_lu
            .get(&token_kind)
            .with_context(|| format!("led was not found for token kind: {token_kind:?}"))
    }
    pub fn get_nod(&self, token_kind: TokenKind) -> Result<&fn(&mut Parser) -> Result<Expression>> {
        self.nod_lu
            .get(&token_kind)
            .with_context(|| format!("nod was not found for token kind: {token_kind:?}",))
    }
    pub fn get_bp(&self, token_kind: &TokenKind) -> Result<&i8> {
        self.binding_power_lu
            .get(token_kind)
            .with_context(|| format!("bp was not found for token kind: {token_kind:?}"))
    }
    fn led(
        &mut self,
        token_kind: TokenKind,
        bp: i8,
        function: fn(&mut Parser, &i8, Expression) -> Result<Expression>,
    ) {
        self.led_lu.insert(token_kind, function);
        self.binding_power_lu.insert(token_kind, bp);
    }

    fn nod(
        &mut self,
        token_kind: TokenKind,
        bp: i8,
        function: fn(&mut Parser) -> Result<Expression>,
    ) {
        self.nod_lu.insert(token_kind, function);
        if bp >= -1 {
            self.binding_power_lu.insert(token_kind, bp);
        }
    }

    pub fn new() -> Lookup {
        let mut lookup = Lookup {
            binding_power_lu: HashMap::new(),
            led_lu: HashMap::new(),
            nod_lu: HashMap::new(),
        };

        lookup.led(TokenKind::Assignment, 1, parse_assignment);
        lookup.led(TokenKind::Equals, 1, parse_assignment);
        lookup.led(TokenKind::NotEquals, 1, parse_assignment);
        lookup.led(TokenKind::PlusEquals, 1, parse_assignment);
        lookup.led(TokenKind::MinusEquals, 1, parse_assignment);
        // lookup.led(TokenKind::StarEquals, 1, parse_assignment);
        // lookup.led(TokenKind::SlashEquals, 1, parse_assignment);

        lookup.led(TokenKind::Plus, 2, parse_binary_expr);
        lookup.led(TokenKind::Minus, 2, parse_binary_expr);
        lookup.led(TokenKind::Star, 3, parse_binary_expr);
        lookup.led(TokenKind::Slash, 3, parse_binary_expr);

        lookup.led(TokenKind::Less, 4, parse_binary_expr);
        lookup.led(TokenKind::LessEquals, 4, parse_binary_expr);
        lookup.led(TokenKind::Greater, 4, parse_binary_expr);
        lookup.led(TokenKind::GreaterEquals, 4, parse_binary_expr);
        lookup.led(TokenKind::Equals, 4, parse_binary_expr);

        lookup.led(TokenKind::Or, 1, parse_binary_expr);
        lookup.led(TokenKind::And, 1, parse_binary_expr);

        lookup.led(TokenKind::Dot, 1, parse_member_expr);
        lookup.led(TokenKind::DotDot, 1, parse_range);

        lookup.led(TokenKind::OpenParen, 2, parse_function_call);
        lookup.led(TokenKind::OpenBracket, 5, parse_indexing_array);

        lookup.binding_power_lu.insert(TokenKind::CloseBracket, -1);
        lookup.led(TokenKind::OpenCurly, 5, parse_class_instantiation);
        lookup.binding_power_lu.insert(TokenKind::CloseCurly, 0);

        lookup.nod(TokenKind::OpenParen, 2, parse_grouping);
        lookup.nod(TokenKind::CloseParen, 0, parse_grouping);

        lookup.nod(TokenKind::Fn, 0, parse_function);
        lookup.nod(TokenKind::If, 0, parse_if);
        lookup.nod(TokenKind::Else, 0, parse_else);
        lookup.nod(TokenKind::While, 0, parse_while);
        lookup.nod(TokenKind::For, 0, parse_for);

        lookup.nod(TokenKind::Out, 0, parse_out);
        lookup.nod(TokenKind::Let, 0, parse_variable_declaration);
        lookup.nod(TokenKind::Class, 0, parse_class);

        lookup.nod(TokenKind::String, 0, parse_string_nod);
        lookup.nod(TokenKind::Identifier, 0, parse_identifier_nod);
        lookup.nod(TokenKind::Number, 0, parse_number_nod);

        // -99 so I don't add new bp in lookup and override old one
        lookup.nod(TokenKind::Minus, -99, parse_prefix_nod);
        lookup.nod(TokenKind::Plus, -99, parse_prefix_nod);
        lookup.nod(TokenKind::Plus, -99, parse_prefix_nod);

        lookup.nod(TokenKind::Not, 0, parse_prefix_nod);

        lookup.nod(TokenKind::OpenCurly, 0, parse_array_initialization);

        lookup.nod(TokenKind::Return, 0, parse_return);

        lookup.nod(TokenKind::SemiColon, -1, parse_keyword_nod);
        lookup.nod(TokenKind::Comma, -1, parse_keyword_nod);

        lookup.binding_power_lu.insert(TokenKind::EndOfFile, -1);

        lookup
    }
}
