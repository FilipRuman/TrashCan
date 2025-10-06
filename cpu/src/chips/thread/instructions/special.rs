use log::info;

use crate::{
    B8, MEMORY,
    chips::{
        b32::B32,
        thread::{
            CPU_REGISTER_1, CPU_REGISTER_2, CURRENT_ADDR_REGISTER, Interrupt, InterruptKind,
            STACK_HEAD_REGISTER, Thread,
        },
    },
};

const ORDERING: std::sync::atomic::Ordering = std::sync::atomic::Ordering::Relaxed;
impl Thread {
    pub fn Rng(&self, out_register: B8, min_register: B8, max_register: B8, run: bool) {
        todo!();
    }
    pub fn Syscall(
        &self,
        system_call_index_register: B8,
        argument_block_register: B8,
        output_data_addr_register: B8,
        run: bool,
    ) {
        let interrupt_function_pointer =
            self.interrupt_controller.IDT.base_addr.load(ORDERING) + InterruptKind::Syscall as u32;
        let memory = MEMORY.get().expect("memory was not yet initialized");
        let interrupt_function_addr = memory.read(B32(interrupt_function_pointer as u32));
        let current_addr = self.registers.read(CURRENT_ADDR_REGISTER);

        let stack_head = self.registers.read(STACK_HEAD_REGISTER);
        self.registers
            .write(stack_head + B32(4), STACK_HEAD_REGISTER, true);
        let new_stack_head = stack_head.0 + 4;

        // load data for handler function

        // jump back addr
        self.registers
            .write(B32(new_stack_head), CPU_REGISTER_2, true);
        self.registers.write(current_addr, CPU_REGISTER_1, true);
        self.Write(CPU_REGISTER_2, CPU_REGISTER_1, true);
        self.registers
            .write(B32(new_stack_head - 2), CPU_REGISTER_2, true);
        let system_call_index_data = self.registers.read(system_call_index_register);
        self.registers
            .write(system_call_index_data, CPU_REGISTER_1, true);
        self.Write(CPU_REGISTER_2, CPU_REGISTER_1, true);

        self.registers
            .write(B32(new_stack_head - 3), CPU_REGISTER_2, true);
        let argument_block_data = self.registers.read(argument_block_register);
        self.registers
            .write(argument_block_data, CPU_REGISTER_1, true);
        self.Write(CPU_REGISTER_2, CPU_REGISTER_1, true);

        self.registers
            .write(B32(new_stack_head - 4), CPU_REGISTER_2, true);
        let output_data_addr_data = self.registers.read(output_data_addr_register);
        self.registers
            .write(output_data_addr_data, CPU_REGISTER_1, true);
        self.Write(CPU_REGISTER_2, CPU_REGISTER_1, true);

        //Jump to syscall handler function
        self.registers
            .write(interrupt_function_addr, CPU_REGISTER_1, true);
        self.Jmp(CPU_REGISTER_1, true);
        info!("SYSCALL instruction!");
    }
}
