pub mod instructions;
use anyhow::{Context, Ok, Result, anyhow};
use crossbeam_queue::ArrayQueue;
use instructions::Instruction;
use log::{debug, info};
use std::{
    cell::OnceCell,
    sync::{
        OnceLock,
        atomic::{AtomicBool, AtomicU32},
    },
    time::Duration,
};
use tokio::time::sleep;

use crate::{
    MEMORY, SHOW_INSTRUCTION_FETCHING_DEBUG,
    chips::{
        b32::B32,
        memory::{Counter, RAM::ram256::RAM256},
    },
    error::handle_error,
};

pub static CLOCK_MS: u64 = 1;

use std::convert::TryFrom;

use super::b8::B8;

#[repr(u32)]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum InterruptKind {
    //Syscall is not handled like interrupt, but addr for it's function is placed inside the same
    //table
    Syscall = 0,
    Timer = 1,
    Keyboard = 2,
    Mouse = 3,
}
impl From<InterruptKind> for u32 {
    fn from(val: InterruptKind) -> Self {
        val as u32
    }
}

#[derive(Debug)]
pub struct Interrupt {
    pub kind: InterruptKind,
    pub data: u32,
}
impl TryFrom<u32> for InterruptKind {
    type Error = anyhow::Error;

    fn try_from(val: u32) -> Result<Self, Self::Error> {
        match val {
            1 => Ok(InterruptKind::Timer),
            2 => Ok(InterruptKind::Keyboard),
            3 => Ok(InterruptKind::Mouse),
            _ => Err(anyhow!("{val} was not a valid interrupt type index!")),
        }
    }
}

pub struct IDT {
    pub base_addr: AtomicU32,
}

pub struct InterruptController {
    pub interrupts_enabled: AtomicBool,
    pub interrupts: ArrayQueue<Interrupt>,
    pub IDT: IDT,
}
const ORDERING: std::sync::atomic::Ordering = std::sync::atomic::Ordering::Relaxed;
impl InterruptController {
    pub fn get_interrupt_instruction(&self, thread: &Thread) -> Option<Instruction> {
        if let Some(interrupt) = self.interrupts.pop()
            && self.interrupts_enabled.load(ORDERING)
        {
            self.interrupts_enabled.store(false, ORDERING);

            let interrupt_function_pointer =
                self.IDT.base_addr.load(ORDERING) + interrupt.kind as u32;
            let memory = MEMORY.get().expect("memory was not yet initialized");
            let interrupt_function_addr = memory.read(B32(interrupt_function_pointer as u32));
            // -1 because jmp instruction advances instruction addr by 1
            let current_addr = thread.pc.read() - B32(1);

            let stack_head = thread.registers.read(STACK_HEAD_REGISTER);
            thread
                .registers
                .write(stack_head + B32(0), CPU_REGISTER_2, true);
            thread
                .registers
                .write(B32(interrupt.data), CPU_REGISTER_1, true);
            thread.Write(CPU_REGISTER_2, CPU_REGISTER_1, true);

            thread
                .registers
                .write(stack_head + B32(2), CPU_REGISTER_2, true);
            thread.registers.write(current_addr, CPU_REGISTER_1, true);
            thread.Write(CPU_REGISTER_2, CPU_REGISTER_1, true);

            thread
                .registers
                .write(stack_head + B32(2), STACK_HEAD_REGISTER, true);

            thread
                .registers
                .write(interrupt_function_addr, CPU_REGISTER_1, true);
            return Some(Instruction::Jmp(CPU_REGISTER_1));
        }
        None
    }

    fn end_interrupt(&self) {
        self.interrupts_enabled.store(true, ORDERING);
    }
}
pub const STACK_HEAD_REGISTER: B8 = B8(254);
pub const STACK_FRAME_REGISTER: B8 = B8(255);
pub const CPU_REGISTER_1: B8 = B8(253);
pub const CPU_REGISTER_2: B8 = B8(252);
pub struct Thread {
    pub interrupt_controller: InterruptController,
    pub pc: Counter,
    registers: RAM256,
    is_halting: AtomicBool,
    stack_base_addr: B32,
}
impl Thread {
    pub fn interrupt(&self, interrupt: Interrupt) {
        self.interrupt_controller.interrupts.push(interrupt);
        self.is_halting.store(false, ORDERING);
    }
    pub async fn run_loop(&self) -> Result<()> {
        loop {
            if self.is_halting.load(std::sync::atomic::Ordering::Relaxed) {
                sleep(Duration::from_millis(1));
                continue;
            }

            let instruction = self.fetch_instruction();
            if SHOW_INSTRUCTION_FETCHING_DEBUG {
                info!("pc-address: {}", self.pc.read());
                info!("fetch_instruction: {:?}", instruction);
            }
            if let Err(err) = self
                .run_instruction(instruction, true)
                .await
                .context("encountered error while running instruction on thread")
            {
                handle_error(err);
            }
            self.pc.increment(true);
        }
        Ok(())
    }

    fn fetch_instruction(&self) -> Instruction {
        // could use mux because i can convert instruction into B32 but this is simpler
        match self.interrupt_controller.get_interrupt_instruction(self) {
            Some(interrupt_instruction) => interrupt_instruction,
            None => self.read_instruction_form_current_pc_memory(),
        }
    }
    fn read_instruction_form_current_pc_memory(&self) -> Instruction {
        let addr = self.pc.read();
        let data = MEMORY.get().unwrap().read(addr);

        data.into()
    }
}

pub async fn clock_cycle(thread: &Thread) {
    let memory = MEMORY
        .get()
        .expect("gui loop run before init function or memory was not yet initialized");
    let mut not_very_accurate_time_sec: u32 = 0;
    loop {
        tokio::time::sleep(Duration::from_secs(1)).await;
        not_very_accurate_time_sec = 1;
        if thread
            .interrupt_controller
            .interrupts_enabled
            .load(ORDERING)
        {
            thread.interrupt(Interrupt {
                kind: InterruptKind::Timer,
                data: 0,
            });
        }
    }
}
pub fn spawn_threads(thread_count: usize) {
    let mut threads = Vec::with_capacity(thread_count);
    for i in 0..thread_count {
        threads.push(create_thread(B32((30000 + 5000 * i) as u32)));
    }
    THREADS.get_or_init(|| threads);
}
pub fn create_thread(stack_base_addr: B32) -> Thread {
    let registers = RAM256::new();
    registers.write(stack_base_addr, B8(255), true);
    registers.write(stack_base_addr, B8(254), true);
    Thread {
        interrupt_controller: InterruptController {
            interrupts_enabled: AtomicBool::new(false),
            interrupts: ArrayQueue::new(5),
            IDT: IDT {
                base_addr: AtomicU32::new(0),
            },
        },
        stack_base_addr,
        pc: (Counter::new()),
        registers,
        is_halting: (AtomicBool::new(false)),
    }
}

pub static THREADS: OnceLock<Vec<Thread>> = OnceLock::new();
