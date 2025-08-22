pub mod bitwise;

pub(crate) mod comparison;
pub mod cpu_management;
pub mod math;
pub mod memory_manipulation;
pub mod special;
pub(crate) mod stack;

use lazy_static::lazy_static;
use log::{error, info};

use crate::chips::{
    b8::{self, B8},
    b32::B32,
};

use super::Thread;
#[repr(i32)]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Instruction {
    Jmp(B8),
    Jmpc(B8, B8),
    Init(B8, B8),
    Intr(B8, B8),
    Idt(B8),
    Phrp(B8, B8),
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

    Eq(B8, B8, B8),
    Gte(B8, B8, B8),
    Lte(B8, B8, B8),
    Lt(B8, B8, B8),
    Gt(B8, B8, B8),

    Halt(),
    Sleep(B8),
    Rng(B8, B8, B8),
    Syscall(B8, B8),

    Push(B8),
    Pop(B8),
    Call(B8),
    Ret(),
}

impl From<Instruction> for B8 {
    fn from(value: Instruction) -> Self {
        match value {
            Instruction::Jmp(_) => B8(0),
            Instruction::Jmpc(_, _) => B8(1),
            Instruction::Init(_, _) => B8(2),
            Instruction::Intr(_, _) => B8(3),
            Instruction::Idt(_) => B8(4),
            Instruction::Phrp(_, _) => B8(5),
            Instruction::Read(_, _) => B8(6),
            Instruction::Write(_, _) => B8(7),
            Instruction::Cp(_, _) => B8(8),
            Instruction::Clr(_) => B8(9),
            Instruction::Set(_) => B8(10),
            Instruction::Pgt(_) => B8(11),

            Instruction::Add(_, _) => B8(12),
            Instruction::Sub(_, _) => B8(13),
            Instruction::Div(_, _) => B8(14),
            Instruction::Mul(_, _) => B8(15),
            Instruction::Mod(_, _) => B8(16),
            Instruction::Neg(_) => B8(17),
            Instruction::Abs(_) => B8(18),

            Instruction::And(_, _) => B8(19),
            Instruction::Or(_, _) => B8(20),
            Instruction::Xor(_, _) => B8(21),
            Instruction::Not(_) => B8(22),
            Instruction::Shr(_, _) => B8(23),
            Instruction::Shl(_, _) => B8(24),

            Instruction::Eq(_, _, _) => B8(25),
            Instruction::Gte(_, _, _) => B8(26),
            Instruction::Lte(_, _, _) => B8(27),
            Instruction::Lt(_, _, _) => B8(28),
            Instruction::Gt(_, _, _) => B8(29),

            Instruction::Halt() => B8(30),
            Instruction::Sleep(_) => B8(31),
            Instruction::Rng(_, _, _) => B8(32),
            Instruction::Syscall(_, _) => B8(33),

            Instruction::Push(_) => B8(34),
            Instruction::Pop(_) => B8(35),
            Instruction::Call(_) => B8(36),
            Instruction::Ret() => B8(37),
        }
    }
}

impl From<B32> for Instruction {
    fn from(value: B32) -> Self {
        match value.byte(0).0 {
            0 => Self::Jmp(value.byte(1)),
            1 => Self::Jmpc(value.byte(1), value.byte(2)),
            2 => Self::Init(value.byte(1), value.byte(2)),
            3 => Self::Intr(value.byte(1), value.byte(2)),
            4 => Self::Idt(value.byte(1)),
            5 => Self::Phrp(value.byte(1), value.byte(2)),
            6 => Self::Read(value.byte(1), value.byte(2)),
            7 => Self::Write(value.byte(1), value.byte(2)),
            8 => Self::Cp(value.byte(1), value.byte(2)),
            9 => Self::Clr(value.byte(1)),
            10 => Self::Set(value.byte(1)),
            11 => Self::Pgt(value.byte(1)),
            12 => Self::Add(value.byte(1), value.byte(2)),
            13 => Self::Sub(value.byte(1), value.byte(2)),
            14 => Self::Div(value.byte(1), value.byte(2)),
            15 => Self::Mul(value.byte(1), value.byte(2)),
            16 => Self::Mod(value.byte(1), value.byte(2)),
            17 => Self::Neg(value.byte(1)),
            18 => Self::Abs(value.byte(1)),
            19 => Self::And(value.byte(1), value.byte(2)),
            20 => Self::Or(value.byte(1), value.byte(2)),
            21 => Self::Xor(value.byte(1), value.byte(2)),
            22 => Self::Not(value.byte(1)),
            23 => Self::Shr(value.byte(1), value.byte(2)),
            24 => Self::Shl(value.byte(1), value.byte(2)),
            25 => Self::Eq(value.byte(1), value.byte(2), value.byte(3)),
            26 => Self::Gte(value.byte(1), value.byte(2), value.byte(3)),
            27 => Self::Lte(value.byte(1), value.byte(2), value.byte(3)),
            28 => Self::Lt(value.byte(1), value.byte(2), value.byte(3)),
            29 => Self::Gt(value.byte(1), value.byte(2), value.byte(3)),
            30 => Self::Halt(),
            31 => Self::Sleep(value.byte(1)),
            32 => Self::Rng(value.byte(1), value.byte(2), value.byte(3)),
            33 => Self::Syscall(value.byte(1), value.byte(2)),
            34 => Self::Push(value.byte(1)),
            35 => Self::Pop(value.byte(1)),
            36 => Self::Call(value.byte(1)),
            37 => Self::Ret(),
            index => {
                panic!("conversion form B32 to instruction with index: {index} is not supported")
            }
        }
    }
}
impl From<Instruction> for B32 {
    fn from(value: Instruction) -> Self {
        // this could be faster if I have used Hashmap and precomputed all of the instructions

        match value {
            Instruction::Jmp(register_jump_target) => {
                B32::from_bytes([
                    value.into(), // command index
                    register_jump_target,
                    B8(0), // fill
                    B8(0), // fill
                ])
            }
            Instruction::Jmpc(register_jump_target, register_condition) => {
                B32::from_bytes([
                    value.into(), // command index
                    register_jump_target,
                    register_condition,
                    B8(0), // fill
                ])
            }
            Instruction::Init(register_thread_index, register_jump_target) => {
                B32::from_bytes([
                    value.into(), // command index
                    register_thread_index,
                    register_jump_target,
                    B8(0), // fill
                ])
            }
            Instruction::Intr(thread_index_register, interrupt_type_index_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    thread_index_register,
                    interrupt_type_index_register,
                    B8(0), // fill
                ])
            }
            Instruction::Idt(address_register) => B32::from_bytes([
                value.into(), // command index
                address_register,
                B8(0), // fill
                B8(0), // fill
            ]),
            Instruction::Phrp(index_register, data_register) => B32::from_bytes([
                value.into(), // command index
                index_register,
                data_register,
                B8(0), // fill
            ]),
            Instruction::Read(source_address_register, destination_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    source_address_register,
                    destination_register,
                    B8(0), // fill
                ])
            }
            Instruction::Write(destination_address_register, source_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    destination_address_register,
                    source_register,
                    B8(0), // fill
                ])
            }
            Instruction::Cp(source_register, destination_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    source_register,
                    destination_register,
                    B8(0), // fill
                ])
            }
            Instruction::Clr(register) => {
                B32::from_bytes([
                    value.into(), // command index
                    register,
                    B8(0), // fill
                    B8(0), // fill
                ])
            }
            Instruction::Set(register) => {
                let test: B8 = value.into();
                B32::from_bytes([
                    value.into(), // command index
                    register,
                    B8(0), // fill
                    B8(0), // fill
                ])
            }
            Instruction::Pgt(address_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    address_register,
                    B8(0), // fill
                    B8(0), // fill
                ])
            }
            Instruction::Add(a_register, b_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    a_register,
                    b_register,
                    B8(0), // fill
                ])
            }
            Instruction::Sub(a_register, b_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    a_register,
                    b_register,
                    B8(0), // fill
                ])
            }
            Instruction::Div(a_register, b_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    a_register,
                    b_register,
                    B8(0), // fill
                ])
            }
            Instruction::Mul(a_register, b_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    a_register,
                    b_register,
                    B8(0), // fill
                ])
            }
            Instruction::Mod(a_register, b_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    a_register,
                    b_register,
                    B8(0), // fill
                ])
            }
            Instruction::Neg(register) => {
                B32::from_bytes([
                    value.into(), // command index
                    register,
                    B8(0), // fill
                    B8(0), // fill
                ])
            }
            Instruction::Abs(register) => {
                B32::from_bytes([
                    value.into(), // command index
                    register,
                    B8(0), // fill
                    B8(0), // fill
                ])
            }
            Instruction::And(a_register, b_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    a_register,
                    b_register,
                    B8(0), // fill
                ])
            }
            Instruction::Or(a_register, b_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    a_register,
                    b_register,
                    B8(0), // fill
                ])
            }
            Instruction::Xor(a_register, b_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    a_register,
                    b_register,
                    B8(0), // fill
                ])
            }
            Instruction::Not(register) => {
                B32::from_bytes([
                    value.into(), // command index
                    register,
                    B8(0), // fill
                    B8(0), // fill
                ])
            }
            Instruction::Shr(a_register, b_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    a_register,
                    b_register,
                    B8(0), // fill
                ])
            }
            Instruction::Shl(a_register, b_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    a_register,
                    b_register,
                    B8(0), // fill
                ])
            }
            Instruction::Eq(a_register, b_register, out_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    a_register,
                    b_register,
                    out_register,
                ])
            }
            Instruction::Gte(a_register, b_register, out_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    a_register,
                    b_register,
                    out_register,
                ])
            }
            Instruction::Lte(a_register, b_register, out_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    a_register,
                    b_register,
                    out_register,
                ])
            }
            Instruction::Lt(a_register, b_register, out_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    a_register,
                    b_register,
                    out_register,
                ])
            }
            Instruction::Gt(a_register, b_register, out_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    a_register,
                    b_register,
                    out_register,
                ])
            }
            Instruction::Halt() => {
                B32::from_bytes([
                    value.into(), // command index
                    B8(0),        // fill
                    B8(0),        // fill
                    B8(0),        // fill
                ])
            }
            Instruction::Sleep(length_register) => B32::from_bytes([
                value.into(), // command index
                length_register,
                B8(0), // fill
                B8(0), // fill
            ]),
            Instruction::Rng(out_register, min_register, max_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    out_register,
                    min_register,
                    max_register,
                ])
            }
            Instruction::Syscall(system_call_index_register, argument_block_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    system_call_index_register,
                    argument_block_register,
                    B8(0), // fill
                ])
            }
            Instruction::Push(contents_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    contents_register,
                    B8(0), // fill
                    B8(0), // fill
                ])
            }
            Instruction::Pop(output_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    output_register,
                    B8(0), // fill
                    B8(0), // fill
                ])
            }
            Instruction::Call(address_register) => {
                B32::from_bytes([
                    value.into(), // command index
                    address_register,
                    B8(0), // fill
                    B8(0), // fill
                ])
            }
            Instruction::Ret() => B32::from_bytes([
                value.into(), // command index
                B8(0),        // fill
                B8(0),        // fill
                B8(0),        // fill
            ]),
        }
    }
}

impl Thread {
    pub async fn run_instruction(&self, instruction: Instruction, run: bool) {
        match instruction {
            Instruction::Jmp(register_jump_target) => self.Jmp(register_jump_target, run),
            Instruction::Jmpc(register_jump_target, register_condition) => {
                self.Jmpc(register_jump_target, register_condition, run)
            }
            Instruction::Init(start_address_register, register_thread_index) => {
                self.Init(start_address_register, register_thread_index, run)
            }
            Instruction::Intr(thread_index_register, interrupt_type_index_register) => {
                self.Intr(thread_index_register, interrupt_type_index_register, run)
            }
            Instruction::Idt(address_register) => self.Idt(address_register, run),
            Instruction::Phrp(index_register, data_register) => {
                self.Phrp(index_register, data_register, run).await
            }
            Instruction::Read(source_address_register, destination_register) => {
                self.Read(source_address_register, destination_register, run)
            }
            Instruction::Write(destination_address_register, source_register) => {
                self.Write(destination_address_register, source_register, run)
            }
            Instruction::Cp(source_register, destination_register) => {
                self.Cp(source_register, destination_register, run)
            }
            Instruction::Clr(register) => self.Clr(register, run),
            Instruction::Set(register) => self.Set(register, run),
            Instruction::Pgt(address_register) => self.Pgt(address_register, run),
            Instruction::Add(a_register, b_register) => self.Add(a_register, b_register, run),
            Instruction::Sub(a_register, b_register) => self.Sub(a_register, b_register, run),
            Instruction::Div(a_register, b_register) => self.Div(a_register, b_register, run),
            Instruction::Mul(a_register, b_register) => self.Mul(a_register, b_register, run),
            Instruction::Mod(a_register, b_register) => self.Mod(a_register, b_register, run),
            Instruction::Neg(register) => self.Neg(register, run),
            Instruction::Abs(register) => self.Abs(register, run),
            Instruction::And(a_register, b_register) => self.And(a_register, b_register, run),
            Instruction::Or(a_register, b_register) => self.Or(a_register, b_register, run),
            Instruction::Xor(a_register, b_register) => self.Xor(a_register, b_register, run),
            Instruction::Not(register) => self.Not(register, run),
            Instruction::Shr(a_register, b_register) => self.Shr(a_register, b_register, run),
            Instruction::Shl(a_register, b_register) => self.Shl(a_register, b_register, run),
            Instruction::Eq(a_register, b_register, out_register) => {
                self.Eq(a_register, b_register, out_register, run)
            }
            Instruction::Gte(a_register, b_register, out_register) => {
                self.Eq(a_register, b_register, out_register, run)
            }
            Instruction::Lte(a_register, b_register, out_register) => {
                self.Eq(a_register, b_register, out_register, run)
            }
            Instruction::Lt(a_register, b_register, out_register) => {
                self.Eq(a_register, b_register, out_register, run)
            }
            Instruction::Gt(a_register, b_register, out_register) => {
                self.Eq(a_register, b_register, out_register, run)
            }
            Instruction::Halt() => self.Halt(run),
            Instruction::Sleep(length_register) => self.Sleep(length_register, run).await,
            Instruction::Rng(out_register, min_register, max_register) => {
                self.Rng(out_register, min_register, max_register, run)
            }
            Instruction::Syscall(system_call_index_register, argument_block_register) => {
                self.Syscall(system_call_index_register, argument_block_register, run)
            }
            Instruction::Push(contents_register) => self.Push(contents_register, run),
            Instruction::Pop(output_register) => self.Pop(output_register, run),
            Instruction::Call(address_register) => self.Call(address_register, run),
            Instruction::Ret() => self.Ret(run),
        }
    }
}
