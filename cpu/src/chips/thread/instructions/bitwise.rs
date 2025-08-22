use crate::{B8, chips::thread::Thread};
impl Thread {
    pub fn And(&self, a_register: B8, b_register: B8, run: bool) {
        self.registers.write(
            self.registers.read(a_register) & self.registers.read(b_register),
            a_register,
            run,
        );
    }
    pub fn Or(&self, a_register: B8, b_register: B8, run: bool) {
        self.registers.write(
            self.registers.read(a_register) | self.registers.read(b_register),
            a_register,
            run,
        );
    }
    pub fn Xor(&self, a_register: B8, b_register: B8, run: bool) {
        self.registers.write(
            self.registers.read(a_register) ^ self.registers.read(b_register),
            a_register,
            run,
        );
    }
    pub fn Not(&self, register: B8, run: bool) {
        self.registers
            .write(!self.registers.read(register), register, run);
    }
    pub fn Shr(&self, a_register: B8, b_register: B8, run: bool) {
        self.registers.write(
            self.registers.read(a_register) >> self.registers.read(b_register),
            a_register,
            run,
        );
    }
    pub fn Shl(&self, a_register: B8, b_register: B8, run: bool) {
        self.registers.write(
            self.registers.read(a_register) << self.registers.read(b_register),
            a_register,
            run,
        );
    }
}
