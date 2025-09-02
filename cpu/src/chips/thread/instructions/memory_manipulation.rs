use crate::{
    MEMORY,
    chips::{b8::B8, b32::B32, thread::Thread},
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
        let data_addr = self.pc.read() + B32(1);
        self.pc.increment(run);
        self.registers
            .write(MEMORY.get().unwrap().read(data_addr), register, run);
    }
    pub fn Pgt(&self, address_register: B8, run: bool) {
        todo!();
    }
}
