use std::{
    sync::atomic::{AtomicBool, AtomicU32},
    time::Duration,
};

use crossbeam_queue::ArrayQueue;

use crate::{
    MEMORY,
    chips::{b32::B32, memory::Counter},
    instructions::Instruction,
};

pub static CLOCK_MS: u64 = 1;

pub enum Interrupt {
    Timer,
    Keyboard,
    Mouse,
}

pub struct IDT {
    pub base_addr: AtomicU32,
}

pub struct Thread {
    interrupted: AtomicBool,
    IDT: IDT,
    interrupts: ArrayQueue<Interrupt>,
    pub pc: Counter,




}

impl Thread {
    pub fn interrupt(interrupt: Interrupt) {}
    pub fn GetInterruptInstruction(&self) -> B32 {
        let interrupt =self.interrupts.pop().expect("there was not a interrupt in the interrupts array que even tho `interrupted` bool was true");
        let interrupt_function_pointer = self
            .IDT
            .base_addr
            .load(std::sync::atomic::Ordering::Relaxed)
            + interrupt as u32;
        let memory = MEMORY
            .get()
            .expect("gui loop run before init function or memory was not yet initialized");
        let iterrupt_function_addr = memory.read(B32(interrupt_function_pointer as i32));

        Instruction::Jmp()
    }
}

// pub  static

pub async fn clock_cycle(thread: &Thread) {
    let memory = MEMORY
        .get()
        .expect("gui loop run before init function or memory was not yet initialized");
    loop {
        tokio::time::sleep(Duration::from_millis(1)).await;
        thread
            .interrupted
            .store(true, std::sync::atomic::Ordering::Relaxed);
        thread.interrupts.push(Interrupt::Timer);
    }
}
pub fn spawn_thread() {}
