use anyhow::Result;
use log::info;
use std::{
    sync::{self, atomic::Ordering::Relaxed},
    time::Duration,
};
use tokio::time::sleep;

use crate::{
    B8,
    chips::thread::{CURRENT_ADDR_REGISTER, ORDERING, THREADS, Thread, clock_cycle},
    peripherals::call_peripheral,
};

impl Thread {
    pub fn Halt(&self, run: bool) {
        self.is_halting.store(true, Relaxed);
    }
    pub async fn Sleep(&self, length_register: B8, run: bool) {
        sleep(Duration::from_millis(
            self.registers.read(length_register).0 as u64,
        ))
        .await;
    }
    pub fn Jmp(&self, register_jump_target: B8, run: bool) {
        // store addr
        self.registers.write(
            self.registers.read(register_jump_target),
            CURRENT_ADDR_REGISTER,
            run,
        );
    }

    pub fn Jmpc(&self, register_condition: B8, register_jump_target: B8, run: bool) {
        let condition = self.registers.read(register_condition).bit(0);

        // store addr
        self.registers.write(
            self.registers.read(register_jump_target),
            CURRENT_ADDR_REGISTER,
            run & condition,
        );
    }
    pub fn Init(
        &self,
        register_thread_index: B8,
        start_address_register: B8,
        run: bool,
    ) -> Result<()> {
        let thread_index = self.registers.read(register_thread_index);
        let start_address = self.registers.read(start_address_register);
        let thread = &THREADS.get().unwrap()[thread_index.0 as usize];

        thread
            .registers
            .write(start_address, CURRENT_ADDR_REGISTER, run);
        thread.is_halting.store(false, Relaxed);

        Ok(())
    }

    pub fn Intr(&self, thread_index_register: B8, interrupt_type_index_register: B8, run: bool) {
        let thread_index = self.registers.read(thread_index_register);
        let interrupt_type = self.registers.read(interrupt_type_index_register);
        THREADS.get().expect("THREADS were not initialized")[thread_index.0 as usize].interrupt(
            crate::chips::thread::Interrupt {
                kind: interrupt_type.0.try_into().unwrap(),
                data: 0,
            },
        );
    }
    const ORDERING: sync::atomic::Ordering = Relaxed;
    pub fn Iret(&self, address_register: B8, run: bool) {
        self.Jmp(address_register, run);
        self.interrupt_controller.end_interrupt();
    }
    pub fn Idt(&self, address_register: B8, run: bool) {
        let base_addr = self.registers.read(address_register);
        self.interrupt_controller
            .IDT
            .base_addr
            .store(base_addr.0 as u32, ORDERING);
        self.interrupt_controller
            .interrupts_enabled
            .store(true, ORDERING);

        true;
    }
    pub async fn Phrp(&self, index_register: B8, data_register: B8, run: bool) -> Result<()> {
        let peripheral_index = self.registers.read(index_register);
        let data = self.registers.read(data_register);
        call_peripheral(peripheral_index, data).await?;
        Ok(())
    }
}
