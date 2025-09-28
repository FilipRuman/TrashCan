use eframe::emath::interpolation_factor;
use log::info;

use crate::{B8, chips::thread::Thread};
impl Thread {
    pub fn Add(&self, a_register: B8, b_register: B8, run: bool) {
        self.registers.write(
            self.registers.read(a_register) + self.registers.read(b_register),
            a_register,
            run,
        );
    }
    pub fn Sub(&self, a_register: B8, b_register: B8, run: bool) {
        self.registers.write(
            self.registers.read(a_register) - self.registers.read(b_register),
            a_register,
            run,
        );
    }
    pub fn Div(&self, a_register: B8, b_register: B8, run: bool) {
        self.registers.write(
            self.registers.read(a_register) / self.registers.read(b_register),
            a_register,
            run,
        );
    }
    pub fn Mul(&self, a_register: B8, b_register: B8, run: bool) {
        info!(
            "Mul - a: {} b: {} out: {}",
            self.registers.read(a_register),
            self.registers.read(b_register),
            self.registers.read(a_register) * self.registers.read(b_register)
        );
        self.registers.write(
            self.registers.read(a_register) * self.registers.read(b_register),
            a_register,
            run,
        );
    }
    pub fn Mod(&self, a_register: B8, b_register: B8, run: bool) {
        self.registers.write(
            self.registers.read(a_register) % self.registers.read(b_register),
            a_register,
            run,
        );
    }
    pub fn Neg(&self, register: B8, run: bool) {
        let read = self.registers.read(register);
        read.negate();
        self.registers.write(read, register, run);
    }

    pub fn Abs(&self, register: B8, run: bool) {
        self.registers
            .write(self.registers.read(register).abs(), register, run);
    }
}
