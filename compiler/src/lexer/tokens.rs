use log::info;

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum TokenKind {
    Tab,
    WhiteSpace,
    OpenBracket,
    CloseBracket,
    OpenCurly,
    CloseCurly,
    CloseParen,
    OpenParen,
    Inst,

    DotDot,
    Dot,
    Arrow,

    Equals,
    NotEquals,
    Assignment,
    Not,
    LessEquals,
    Less,
    GreaterEquals,
    Greater,
    Or,
    And,
    SemiColon,
    Colon,
    Question,
    Comma,
    PlusEquals,
    MinusEquals,

    PlusPlus,
    MinusMinus,

    False,
    True,
    Return,
    Plus,
    Minus,
    Star,
    Slash,
    Percent,

    EndOfFile,
    Number,
    NextLine,
    Reference,
    Comment,
    String,
    Identifier,

    Const,
    Fn,
    Enum,
    Struct,
    Pub,
    Mod,
    As,
    New,
    Import,
    For,
    In,
    If,
    Else,
    While,
    Let,

    Mut,
}
#[derive(Debug, Clone)]

pub struct Token {
    pub kind: TokenKind,
    pub value: String,
    pub line: usize,
}
impl Token {
    pub fn debug(&self, index: u32) {
        info!("{}.    {:?} {}", index, self.kind, self.value);
    }
}
