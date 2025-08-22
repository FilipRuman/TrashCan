use crate::{
    B8,
    chips::{b32::B32, thread::Thread},
};
impl Thread {
    pub fn Eq(&self, a_register: B8, b_register: B8, out_register: B8, run: bool) {
        self.registers.write(
            B32((self.registers.read(a_register) == self.registers.read(b_register)) as i32),
            out_register,
            run,
        );
    }
    pub fn Gte(&self, a_register: B8, b_register: B8, out_register: B8, run: bool) {
        self.registers.write(
            B32((self.registers.read(a_register) >= self.registers.read(b_register)) as i32),
            out_register,
            run,
        );
    }
    pub fn Lte(&self, a_register: B8, b_register: B8, out_register: B8, run: bool) {
        self.registers.write(
            B32((self.registers.read(a_register) <= self.registers.read(b_register)) as i32),
            out_register,
            run,
        );
    }
    pub fn Lt(&self, a_register: B8, b_register: B8, out_register: B8, run: bool) {
        self.registers.write(
            B32((self.registers.read(a_register) < self.registers.read(b_register)) as i32),
            out_register,
            run,
        );
    }
    pub fn Gt(&self, a_register: B8, b_register: B8, out_register: B8, run: bool) {
        self.registers.write(
            B32((self.registers.read(a_register) > self.registers.read(b_register)) as i32),
            out_register,
            run,
        );
    }
}
