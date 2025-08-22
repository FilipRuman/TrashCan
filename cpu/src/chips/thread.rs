pub mod instructions;
use std::{
    cell::OnceCell,
    sync::{
        OnceLock,
        atomic::{AtomicBool, AtomicU32},
    },
    time::Duration,
};

use crossbeam_queue::ArrayQueue;
use instructions::Instruction;
use log::{debug, info};

use crate::{
    MEMORY,
    chips::{
        b32::B32,
        memory::{Counter, RAM::ram256::RAM256},
    },
};

pub static CLOCK_MS: u64 = 1;

use std::convert::TryFrom;

#[repr(i32)]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Interrupt {
    Timer = 0,
    Keyboard = 1,
    Mouse = 2,
}
impl From<Interrupt> for i32 {
    fn from(val: Interrupt) -> Self {
        val as i32
    }
}

impl TryFrom<i32> for Interrupt {
    type Error = ();

    fn try_from(val: i32) -> Result<Self, Self::Error> {
        match val {
            1 => Ok(Interrupt::Timer),
            2 => Ok(Interrupt::Keyboard),
            3 => Ok(Interrupt::Mouse),
            _ => Err(()),
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
            let iterrupt_function_addr = memory.read(B32(interrupt_function_pointer as i32));

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
}
impl Thread {
    pub async fn run_loop(&self) {
        while !self.is_halting.load(std::sync::atomic::Ordering::Relaxed) {
            debug!("pc-address: {}", self.pc.read());
            let instruction = self.fetch_instruction();
            debug!("fetch_instruction: {:?}", instruction);
            self.run_instruction(instruction, true).await;
            self.pc.increment(true);
        }
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
        threads.push(create_thread());
    }
    THREADS.get_or_init(|| threads);
}
pub fn create_thread() -> Thread {
    Thread {
        interrupt_controller: InterruptController {
            interrupts_enabled: AtomicBool::new(false),
            interrupted: AtomicBool::new(false),
            interrupts: ArrayQueue::new(5),
            IDT: IDT {
                base_addr: AtomicU32::new(0),
            },
        },
        pc: (Counter::new()),
        registers: (RAM256::new()),
        is_halting: (AtomicBool::new(false)),
    }
}

pub static THREADS: OnceLock<Vec<Thread>> = OnceLock::new();
