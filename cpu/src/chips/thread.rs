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

use crate::{
    MEMORY,
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
pub enum Interrupt {
    Timer = 0,
    Keyboard = 1,
    Mouse = 2,
}
impl From<Interrupt> for u32 {
    fn from(val: Interrupt) -> Self {
        val as u32
    }
}

impl TryFrom<u32> for Interrupt {
    type Error = anyhow::Error;

    fn try_from(val: u32) -> Result<Self, Self::Error> {
        match val {
            1 => Ok(Interrupt::Timer),
            2 => Ok(Interrupt::Keyboard),
            3 => Ok(Interrupt::Mouse),
            _ => Err(anyhow!("{val} was not a valid interrupt type index!")),
        }
    }
}

pub struct IDT {
    pub base_addr: AtomicU32,
}

pub struct InterruptController {
    pub interrupts_enabled: AtomicBool,
    pub interrupted: AtomicBool,
    pub interrupts: ArrayQueue<Interrupt>,
    pub IDT: IDT,
}
const ORDERING: std::sync::atomic::Ordering = std::sync::atomic::Ordering::Relaxed;
impl InterruptController {
    pub fn interrupt(&self, interrupt: Interrupt) {
        self.interrupted.store(true, ORDERING);
        self.interrupts.push(interrupt);
    }

    pub fn get_interrupt_instruction(&self) -> Option<Instruction> {
        if self.interrupts_enabled.load(ORDERING) && self.interrupted.load(ORDERING) {
            let interrupt =self.interrupts.pop().expect("there was not a interrupt in the interrupts array que even tho `interrupted` bool was true");
            let interrupt_function_pointer = self.IDT.base_addr.load(ORDERING) + interrupt as u32;
            let memory = MEMORY
                .get()
                .expect("gui loop run before init function or memory was not yet initialized");
            let iterrupt_function_addr = memory.read(B32(interrupt_function_pointer as u32));

            todo!();
            return Some(Instruction::Call(todo!()));
        }
        None
    }
}
pub struct Thread {
    pub interrupt_controller: InterruptController,
    pub pc: Counter,
    registers: RAM256,
    is_halting: AtomicBool,
    stack_base_addr: B32,
}
impl Thread {
    pub async fn run_loop(&self) -> Result<()> {
        while !self.is_halting.load(std::sync::atomic::Ordering::Relaxed) {
            info!("pc-address: {}", self.pc.read());
            let instruction = self.fetch_instruction();
            info!("fetch_instruction: {:?}", instruction);
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
        match self.interrupt_controller.get_interrupt_instruction() {
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
    loop {
        tokio::time::sleep(Duration::from_millis(1)).await;
        thread
            .interrupt_controller
            .interrupted
            .store(true, ORDERING);
        thread
            .interrupt_controller
            .interrupts
            .push(Interrupt::Timer);
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
            interrupted: AtomicBool::new(false),
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
