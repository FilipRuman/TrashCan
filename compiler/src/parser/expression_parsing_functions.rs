use crate::lexer::tokens::TokenKind;
use anyhow::*;
use log::info;

use super::{Parser, expression::*, parse, types::parse_type};

pub fn parse_indexing_array(parser: &mut Parser, _: &i8, left: Expression) -> Result<Expression> {
    parser.expect(&TokenKind::OpenBracket)?;
    let mut indexes = Vec::new();
    while parser.current_token_kind()? != &TokenKind::CloseBracket {
        indexes.push(parse_expr(parser, &0)?);
        if parser.current_token_kind()? == &TokenKind::Comma {
            parser.advance()?;
        }
    }
    parser.expect(&TokenKind::CloseBracket)?;

    Ok(Expression::SquareBrackets {
        left: Box::new(left.clone()),
        indexes,
        debug_data: parser.get_current_debug_data()?,
    })
}

pub fn parse_else(parser: &mut Parser) -> Result<Expression> {
    parser.expect(&TokenKind::Else)?;

    match parser.current_token_kind()? {
        TokenKind::If => {
            parser.expect(&TokenKind::If)?;

            let condition = parse_expr(parser, &0)?;
            parser.expect(&TokenKind::OpenCurly)?;
            let mut inside = Vec::new();
            while parser.current_token_kind()? != &TokenKind::CloseCurly {
                inside.push(parse_expr(parser, &0)?);
            }
            parser.expect(&TokenKind::CloseCurly)?;

            Ok(Expression::Else {
                condition: Some(Box::new(condition)),
                inside,
                debug_data: parser.get_current_debug_data()?,
            })
        }
        _ => {
            parser.expect(&TokenKind::OpenCurly)?;
            let mut inside = Vec::new();
            while parser.current_token_kind()? != &TokenKind::CloseCurly {
                inside.push(parse_expr(parser, &0)?);
            }
            parser.expect(&TokenKind::CloseCurly)?;

            Ok(Expression::Else {
                condition: None,
                inside,
                debug_data: parser.get_current_debug_data()?,
            })
        }
    }
}

pub fn parse_break(parser: &mut Parser) -> Result<Expression> {
    parser.expect(&TokenKind::Break)?;
    Ok(Expression::Break)
}
pub fn parse_function_call(parser: &mut Parser, _: &i8, left: Expression) -> Result<Expression> {
    parser.expect(&TokenKind::OpenParen)?;
    let mut values = Vec::new();
    while parser.current_token_kind()? != &TokenKind::CloseParen {
        values.push(parse_expr(parser, &0)?);
        if parser.current_token_kind()? == &TokenKind::Comma {
            parser.advance()?;
        }
    }
    parser.expect(&TokenKind::CloseParen)?;

    Ok(Expression::FunctionCall {
        left: Box::new(left),
        values,
        debug_data: parser.get_current_debug_data()?,
    })
}
pub fn parse_return(parser: &mut Parser) -> Result<Expression> {
    parser.expect(&TokenKind::Return)?;
    let value = parse_expr(parser, &0)?;

    Ok(Expression::Return {
        value: Box::new(value),

        debug_data: parser.get_current_debug_data()?,
    })
}
pub fn parse_for(parser: &mut Parser) -> Result<Expression> {
    parser.expect(&TokenKind::For)?;
    let iterator_name = parser.expect(&TokenKind::Identifier)?.value.to_owned();
    parser.expect(&TokenKind::In)?;
    let iteration_target = parse_expr(parser, &0).with_context(|| {
        format!(
            "parsing iteration target of for loop: {:?}",
            parser.get_current_debug_data()
        )
    })?;

    parser.expect(&TokenKind::OpenCurly)?;
    let mut inside = Vec::new();
    while parser.current_token_kind()? != &TokenKind::CloseCurly {
        inside.push(parse_expr(parser, &0).with_context(|| {
            format!(
                "parsing contents of for loop: {:?}",
                parser.get_current_debug_data()
            )
        })?);
    }
    parser.expect(&TokenKind::CloseCurly)?;
    Ok(Expression::For {
        iterator_name,
        iteration_target: Box::new(iteration_target),
        inside,

        debug_data: parser.get_current_debug_data()?,
    })
}
pub fn parse_if(parser: &mut Parser) -> Result<Expression> {
    parser.expect(&TokenKind::If)?;
    let condition = parse_expr(parser, &0).with_context(|| {
        format!(
            "parsing condition of if: {:?}",
            parser.get_current_debug_data()
        )
    })?;
    parser.expect(&TokenKind::OpenCurly)?;
    let mut inside = Vec::new();
    while parser.current_token_kind()? != &TokenKind::CloseCurly {
        inside.push(parse_expr(parser, &0).with_context(|| {
            format!(
                "parsing contents of if: {:?}",
                parser.get_current_debug_data()
            )
        })?);
    }
    parser.expect(&TokenKind::CloseCurly)?;

    Ok(Expression::If {
        condition: Box::new(condition),
        inside,

        debug_data: parser.get_current_debug_data()?,
    })
}
pub fn parse_while(parser: &mut Parser) -> Result<Expression> {
    parser.expect(&TokenKind::While)?;
    let condition = parse_expr(parser, &0).with_context(|| {
        format!(
            "parsing condition for while loop: {:?}",
            parser.get_current_debug_data()
        )
    })?;

    parser.expect(&TokenKind::OpenCurly)?;
    let mut inside = Vec::new();
    while parser.current_token_kind()? != &TokenKind::CloseCurly {
        inside.push(parse_expr(parser, &0).with_context(|| {
            format!(
                "parsing contents inside while loop: {:?}",
                parser.get_current_debug_data()
            )
        })?);
    }
    parser.expect(&TokenKind::CloseCurly)?;

    Ok(Expression::While {
        condition: Box::new(condition),
        inside,

        debug_data: parser.get_current_debug_data()?,
    })
}
pub fn parse_range(parser: &mut Parser, _: &i8, left: Expression) -> Result<Expression> {
    parser.expect(&TokenKind::DotDot)?;
    let to = parse_expr(parser, &0)
        .with_context(|| format!("parsing range: {:?}", parser.get_current_debug_data()))?;

    Ok(Expression::Range {
        to: Box::new(to),
        from: Box::new(left),

        debug_data: parser.get_current_debug_data()?,
    })
}
pub fn parse_function(parser: &mut Parser) -> Result<Expression> {
    parser.expect(&TokenKind::Fn)?;

    let public = if parser.current_token_kind()? == &TokenKind::Pub {
        parser.expect(&TokenKind::Pub)?;
        true
    } else {
        false
    };

    let name = parser.expect(&TokenKind::Identifier)?.value.to_owned();
    parser.expect(&TokenKind::OpenParen)?;

    let mut properties = Vec::new();
    while parser.current_token_kind()? != &TokenKind::CloseParen {
        let var_name = parser.expect(&TokenKind::Identifier)?.value.to_owned();
        parser.expect(&TokenKind::Colon)?;
        let var_type = parse_type(parser, &0).with_context(|| {
            format!(
                "parsing property types inside function: {:?}",
                parser.get_current_debug_data()
            )
        })?;
        properties.push(Expression::FunctionProperty {
            var_name,
            var_type,

            debug_data: parser.get_current_debug_data()?,
        });
        if parser.current_token_kind()? == &TokenKind::Comma {
            parser.advance()?;
        }
    }

    parser.expect(&TokenKind::CloseParen)?;
    let output = if parser.current_token_kind()? == &TokenKind::Arrow {
        parser.expect(&TokenKind::Arrow)?;
        Some(parse_type(parser, &0)?)
    } else {
        None
    };
    parser.expect(&TokenKind::OpenCurly)?;
    let mut inside = Vec::new();
    while parser.current_token_kind()? != &TokenKind::CloseCurly {
        inside.push(parse_expr(parser, &0).with_context(|| {
            format!(
                "parsing expresions inside function: {:?}",
                parser.get_current_debug_data()
            )
        })?);
    }

    parser.expect(&TokenKind::CloseCurly)?;

    Ok(Expression::Function {
        name,
        properties,
        public,
        output,
        inside,

        debug_data: parser.get_current_debug_data()?,
    })
}

pub fn parse_expr(parser: &mut Parser, bp: &i8) -> Result<Expression> {
    let nod = parser.current_token().context("parse_expr -> nod")?;
    let mut left = parser
        .lookup
        .get_nod(nod.kind, parser.get_current_debug_data()?)
        .context("parse_expr -> left")?(parser)
    .context("parse_expr -> left function")?;

    while parser.current_bp()? > bp {
        let led = parser
            .current_token()
            .context("parse_expr -> led")?
            .kind
            .clone();
        let led_fn = parser
            .lookup
            .get_led(led, parser.get_current_debug_data()?)
            .context("parse_expr -> led function")?;

        left = led_fn(parser, &parser.current_bp()?.to_owned(), left).with_context(|| {
            format!(
                "parse_expr -> run led function: {led:?} {:?}",
                parser.get_current_debug_data()
            )
        })?;
    }
    Ok(left)
}
pub fn parse_struct(parser: &mut Parser) -> Result<Expression> {
    // class pub NAME {
    // i32 name ;
    // bool[] orher_name;
    // }
    parser.expect(&TokenKind::Struct)?;
    let public = parser.current_token_kind()? == &TokenKind::Pub;
    if public {
        parser.expect(&TokenKind::Pub)?;
    }
    let name = parser.expect(&TokenKind::Identifier)?.value.to_owned();
    parser.expect(&TokenKind::OpenCurly)?;

    let mut properties = Vec::new();
    let mut functions = Vec::new();
    while parser.current_token_kind()? != &TokenKind::EndOfFile
        && parser.current_token_kind()? != &TokenKind::CloseCurly
    {
        //
        let token_kind = parser.current_token_kind()?;
        // Property
        if token_kind == &TokenKind::Identifier {
            let property_name = parser.expect(&TokenKind::Identifier)?.value.clone();
            parser.expect(&TokenKind::Colon)?;
            let property_type = parse_type(parser, &0).with_context(|| {
                format!(
                    "parsing property of a class with name:{name} {:?}",
                    parser.get_current_debug_data()
                )
            })?;
            parser.expect(&TokenKind::Comma)?;
            properties.push(Expression::StructProperty {
                var_name: property_name,
                var_type: property_type,

                debug_data: parser.get_current_debug_data()?,
            });
            continue;
        }
        if token_kind == &TokenKind::Fn {
            parse_function(parser)?;
        }
    }
    parser.expect(&TokenKind::CloseCurly)?;

    Ok(Expression::Struct {
        public,
        name,
        functions,
        properties,

        debug_data: parser.get_current_debug_data()?,
    })
}
pub fn parse_array_initialization(parser: &mut Parser) -> Result<Expression> {
    info!("parse_array_initialization");
    parser.expect(&TokenKind::OpenCurly)?;
    let inside_type = parse_type(parser, &0)?;
    parser.expect(&TokenKind::Comma)?;

    let mut properties = Vec::new();
    let mut length = 0;
    while parser.current_token_kind()? != &TokenKind::EndOfFile
        && parser.current_token_kind()? != &TokenKind::CloseCurly
    {
        if parser.current_token()?.value == "len" {
            parser.advance()?;
            parser.expect(&TokenKind::Colon)?;
            length = parser.expect(&TokenKind::Number)?.value.parse::<u32>()?;
            parser.expect(&TokenKind::Comma)?;
            continue;
        }

        properties.push(parse_expr(parser, &0)?);
        parser.expect(&TokenKind::Comma)?;
    }

    parser.expect(&TokenKind::CloseCurly)?;

    if length == 0 {
        length = properties.len() as u32;
    }

    Ok(Expression::ArrayInitialization {
        length,
        properties,
        debug_data: parser.get_current_debug_data()?,
        inside_type,
    })
}
pub fn parse_class_instantiation(
    parser: &mut Parser,
    bp: &i8,
    left: Expression,
) -> Result<Expression> {
    let name = match left {
        Expression::Identifier(text, _) => text,
        _ => {
            panic!("left is not a identifier in parse_class_instantiation ")
        }
    };

    parser.expect(&TokenKind::OpenCurly)?;
    let mut properties = Vec::new();
    while parser.current_token_kind()? != &TokenKind::EndOfFile
        && parser.current_token_kind()? != &TokenKind::CloseCurly
    {
        properties.push(parse_expr(parser, &0)?);
    }

    parser.expect(&TokenKind::CloseCurly)?;
    Ok(Expression::ClassInstantiation {
        name,
        properties,

        debug_data: parser.get_current_debug_data()?,
    })
}
pub fn parse_variable_declaration(parser: &mut Parser) -> Result<Expression> {
    parser.expect(&TokenKind::Let)?;

    let mutable = parser.current_token_kind()? == &TokenKind::Mut;
    if mutable {
        parser.advance()?;
    }

    let name = (parser.expect(&TokenKind::Identifier)?.value).to_owned();
    let var_type = if parser.current_token_kind()? == &TokenKind::Colon {
        parser.expect(&TokenKind::Colon)?;
        Some(parse_type(parser, &0).with_context(|| {
        format!(
            "parsing type for variable declaration, errors most of the time show that type specification: doesn't  exist / is invalid {:?} ",
            parser.get_current_debug_data()
        )
    })?)
    } else {
        None
    };

    debug_expression(&format!(
        "variable_declaration_expression: type{:?} mut:{} name:{} next_token_kind:{:?}",
        var_type,
        mutable,
        name,
        parser.current_token_kind()?,
    ));
    Ok(Expression::VariableDeclaration {
        var_type,
        name,
        mutable,
        debug_data: parser.get_current_debug_data()?,
    })
}
pub fn parse_as(parser: &mut Parser, _: &i8, target: Expression) -> Result<Expression> {
    parser.expect(&TokenKind::As);
    let target_type = parse_type(parser, &0)?;
    Ok(Expression::As(
        Box::new(target),
        target_type,
        parser.get_current_debug_data()?,
    ))
}

pub fn parse_assignment(parser: &mut Parser, _: &i8, target: Expression) -> Result<Expression> {
    debug_expression(&format!(
        "assignment_expr: target: {:?} current kind: {:?} ",
        target,
        parser.current_token_kind()?,
    ));

    let operator = parser.current_token()?.clone();
    parser.advance()?;
    let value = parse_expr(parser, &0)?;
    Ok(Expression::Assignment {
        target: Box::new(target),
        operator,

        debug_data: parser.get_current_debug_data()?,
        value: Box::new(value),
    })
}

pub fn parse_binary_expr(parser: &mut Parser, bp: &i8, left: Expression) -> Result<Expression> {
    let operator_original = parser.advance()?;
    let operator = operator_original.clone();
    debug_expression(&format!(
        "parsed binary: bp:{} operator{:?} right_token_kind{:?}",
        bp,
        operator,
        parser.current_token_kind()
    ));

    let right = parse_expr(parser, bp)?;

    Ok(Expression::Binary {
        left: Box::new(left),
        operator,
        right: Box::new(right),

        debug_data: parser.get_current_debug_data()?,
    })
}
pub fn parse_member_expr(parser: &mut Parser, _: &i8, left: Expression) -> Result<Expression> {
    parser.expect(&TokenKind::Dot)?;

    let right = parse_expr(parser, &0)?;

    Ok(Expression::MemberExpr {
        left: Box::new(left),
        right: Box::new(right),
        debug_data: parser.get_current_debug_data()?,
    })
    .context("member expr")
}

pub fn parse_grouping(parser: &mut Parser) -> Result<Expression> {
    parser.advance()?;

    let expression_inside = parse_expr(parser, &0)?;
    parser.expect(&TokenKind::CloseParen)?;

    Ok(Expression::Grouping(
        Box::new(expression_inside),
        parser.get_current_debug_data()?,
    ))
    .context("grouping nod")
}
pub fn parse_reference(parser: &mut Parser) -> Result<Expression> {
    parser.expect(&TokenKind::Reference)?;
    Ok(Expression::Reference(
        Box::new(parse_expr(parser, &0)?),
        parser.get_current_debug_data()?,
    ))
}
pub fn parse_bool_nod(parser: &mut Parser) -> Result<Expression> {
    Ok(match parser.advance()?.kind {
        TokenKind::True => Expression::Boolean(true, parser.get_current_debug_data()?),
        TokenKind::False => Expression::Boolean(false, parser.get_current_debug_data()?),
        other => {
            bail!("parse_bool_nod -> other- '{other:?}'. this should never happen!");
        }
    })
}
pub fn parse_number_nod(parser: &mut Parser) -> Result<Expression> {
    let value = &parser.advance()?.value.clone();
    Ok(Expression::Number(
        parse_num(value).with_context(|| {
            format!(
                "string '{value}' was not a valid u32 number!, {:?}",
                parser.get_current_debug_data()
            )
        })?,
        parser.get_current_debug_data()?,
    ))
    .context("number nod")
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

pub fn parse_prefix_nod(parser: &mut Parser) -> Result<Expression> {
    let prefix = parser.advance()?.to_owned();
    let value = Box::new(parse_expr(parser, &0)?);

    Ok(Expression::Prefix {
        prefix,
        value,

        debug_data: parser.get_current_debug_data()?,
    })
    .context("prefix nod")
}

pub fn parse_identifier_nod(parser: &mut Parser) -> Result<Expression> {
    Ok(Expression::Identifier(
        parser.advance()?.value.to_string(),
        parser.get_current_debug_data()?,
    ))
    .context("identifier nod")
}
pub fn parse_keyword_nod(parser: &mut Parser) -> Result<Expression> {
    Ok(Expression::Keyword(parser.advance()?.kind)).context("keyword nod")
}
pub fn parse_string_nod(parser: &mut Parser) -> Result<Expression> {
    Ok(Expression::String(
        parser.advance()?.value.to_string(),
        parser.get_current_debug_data()?,
    ))
    .context("string nod")
}
