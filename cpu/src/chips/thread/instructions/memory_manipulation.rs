use log::info;

use crate::{
    MEMORY,
    chips::{
        b8::B8,
        b32::B32,
        thread::{CURRENT_ADDR_REGISTER, Thread},
    },
};
impl Thread {
    pub fn Read(&self, destination_register: B8, source_address_register: B8, run: bool) {
        let data = MEMORY
            .get()
            .unwrap()
            .read(self.registers.read(source_address_register));

        self.registers.write(data, destination_register, run);
    }
    pub fn Write(&self, destination_address_register: B8, source_register: B8, run: bool) {
        MEMORY.get().unwrap().write(
            self.registers.read(source_register),
            self.registers.read(destination_address_register),
            run,
        );
    }
    pub fn Cp(&self, destination_register: B8, source_register: B8, run: bool) {
        self.registers.write(
            self.registers.read(source_register),
            destination_register,
            run,
        );
    }
    pub fn Clr(&self, register: B8, run: bool) {
        self.registers.write(B32(0), register, run);
    }
    pub fn Set(&self, register: B8, run: bool) {
        let data_addr = self.registers.read(CURRENT_ADDR_REGISTER) + B32(1);
        self.registers.increment(CURRENT_ADDR_REGISTER);
        self.registers
            .write(MEMORY.get().unwrap().read(data_addr), register, run);
    }
    // sets offset by value of LOAD_BASE_REGISTER
    pub fn RJmpc(&self, condition_register: B8, register: B8, run: bool) {
        let current_addr = self.registers.read(CURRENT_ADDR_REGISTER);
        self.Add(register, CURRENT_ADDR_REGISTER, run);

        let condition = self.registers.read(condition_register).bit(0);

        // store addr
        self.registers.write(
            self.registers.read(register),
            CURRENT_ADDR_REGISTER,
            run & condition,
        );
    }
    // sets offset by value of LOAD_BASE_REGISTER
    pub fn RJmp(&self, register: B8, run: bool) {
        let current_addr = self.registers.read(CURRENT_ADDR_REGISTER);
        self.Add(register, CURRENT_ADDR_REGISTER, run);
        self.Jmp(register, run);
    }
    pub fn Pgt(&self, address_register: B8, run: bool) {
        todo!();
    }
}
