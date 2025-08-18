use lazy_static::lazy_static;

use crate::chips::{b8::B8, b32::B32};

pub enum Instruction {
    Jmp(B8),
    Jmpc(B8, B8),
    Init(B8, B8),
    Intr(B8, B8),
    Idt(B8),
    Phrp(B8),
    Read(B8, B8),
    Write(B8, B8),
    Cp(B8, B8),
    Clr(B8),
    Set(B8),
    Pgt(B8),

    Add(B8, B8),
    Sub(B8, B8),
    Div(B8, B8),
    Mul(B8, B8),
    Mod(B8, B8),
    Neg(B8),
    Abs(B8),

    And(B8, B8),
    Or(B8, B8),
    Xor(B8, B8),
    Not(B8),
    Shr(B8, B8),
    Shl(B8, B8),

    Eq(B8, B8),
    Gte(B8, B8),
    Lte(B8, B8),
    Lt(B8, B8),
    Gt(B8, B8),

    Halt,
    Sleep(B8),
    Rng(B8, B8, u8),
    Syscall(B8, B8),

    Push(B8),
    Pop(B8),
    Call(B8),
    Ret,
}

impl From<Instruction> for B32 {
    fn from(value: Instruction) -> Self {
        // this could be faster if I have used Hashmap and precomputed all of the instructions
        match value {
            Instruction::Jmp(x) => B32::from_bits_vec(
                [
                    B8(0).bits().as_slice(), // command index
                    x.bits().as_slice(),
                    B8(0).bits().as_slice(), // fill
                    B8(0).bits().as_slice(), // fill
                ]
                .concat(),
            ),
            Instruction::Jmpc(_, _) => todo!(),
            Instruction::Init(_, _) => todo!(),
            Instruction::Intr(_, _) => todo!(),
            Instruction::Idt(_) => todo!(),
            Instruction::Phrp(_) => todo!(),
            Instruction::Read(_, _) => todo!(),
            Instruction::Write(_, _) => todo!(),
            Instruction::Cp(_, _) => todo!(),
            Instruction::Clr(_) => todo!(),
            Instruction::Set(_) => todo!(),
            Instruction::Pgt(_) => todo!(),
            Instruction::Add(_, _) => todo!(),
            Instruction::Sub(_, _) => todo!(),
            Instruction::Div(_, _) => todo!(),
            Instruction::Mul(_, _) => todo!(),
            Instruction::Mod(_, _) => todo!(),
            Instruction::Neg(_) => todo!(),
            Instruction::Abs(_) => todo!(),
            Instruction::And(_, _) => todo!(),
            Instruction::Or(_, _) => todo!(),
            Instruction::Xor(_, _) => todo!(),
            Instruction::Not(_) => todo!(),
            Instruction::Shr(_, _) => todo!(),
            Instruction::Shl(_, _) => todo!(),
            Instruction::Eq(_, _) => todo!(),
            Instruction::Gte(_, _) => todo!(),
            Instruction::Lte(_, _) => todo!(),
            Instruction::Lt(_, _) => todo!(),
            Instruction::Gt(_, _) => todo!(),
            Instruction::Halt => todo!(),
            Instruction::Sleep(_) => todo!(),
            Instruction::Rng(_, _, _) => todo!(),
            Instruction::Syscall(_, _) => todo!(),
            Instruction::Push(_) => todo!(),
            Instruction::Pop(_) => todo!(),
            Instruction::Call(_) => todo!(),
            Instruction::Ret => todo!(),
        }
    }
}

pub fn    Jmp(B8){

}

 pub fn Jmpc(B8, B8){
}
 pub fn   Init(B8, B8){}
 pub fn   Intr(B8, B8){}
 pub fn   Idt(B8){}
 pub fn   Phrp(B8){}
 pub fn   Read(B8, B8){}
 pub fn   Write(B8, B8){}
 pub fn   Cp(B8, B8){}
 pub fn   Clr(B8){}
 pub fn   Set(B8){}
 pub fn   Pgt(B8){}

 pub fn   Add(B8, B8){}
 pub fn   Sub(B8, B8){}
 pub fn   Div(B8, B8){}
 pub fn   Mul(B8, B8){}
 pub fn   Mod(B8, B8){}
 pub fn   Neg(B8){}
 pub fn   Abs(B8){}

 pub fn   And(B8, B8){}
 pub fn   Or(B8, B8){}
 pub fn   Xor(B8, B8){}
 pub fn   Not(B8){}
 pub fn   Shr(B8, B8){}
 pub fn   Shl(B8, B8){}

 pub fn   Eq(B8, B8){}
 pub fn   Gte(B8, B8){}
 pub fn   Lte(B8, B8){}
 pub fn   Lt(B8, B8){}
 pub fn   Gt(B8, B8){}

 pub fn   Halt(){}
 pub fn   Sleep(B8){}
 pub fn   Rng(B8, B8, B8){}
 pub fn   Syscall(B8, B8){}

 pub fn   Push(B8){}
 pub fn   Pop(B8){}
 pub fn   Call(B8){}
 pub fn   Ret(){}
