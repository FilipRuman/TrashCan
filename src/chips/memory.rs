pub mod RAM;

use std::sync::atomic::{AtomicBool, AtomicI16, AtomicU16};

use super::{
    b8::B8,
    b16::B16,
    bit::{d_mux8, mux, mux_3x3, mux_4, mux_8},
};

//INFO: My main target is to simulate whole system so I don't have to cut complexity and
// simulating realistic, recursive xor dlatch would be too expensive.
pub struct DLatch {
    pub last_val: AtomicBool,
}
impl DLatch {
    pub fn new() -> Self {
        DLatch {
            last_val: AtomicBool::new(false),
        }
    }
    fn read(&self) -> bool {
        self.last_val.load(ORDERING)
    }
    fn store(&self, data: bool) {
        self.last_val.store(data, ORDERING);
    }
}
const ORDERING: std::sync::atomic::Ordering = std::sync::atomic::Ordering::SeqCst;

pub struct B16Register {
    bit_memory: AtomicI16,
}
impl B16Register {
    pub fn new() -> Self {
        Self {
            bit_memory: AtomicI16::new(0),
        }
    }

    pub fn read(&self) -> B16 {
        B16(self.bit_memory.load(ORDERING))
    }

    pub fn write(&self, data: B16, store: bool) {
        // had to do it because it wasn't working when multithreaded D:
        // + it's faster :D
        if (store) {
            self.bit_memory.store(data.0, ORDERING);
        }

        // let to_store = B16(self.bit_memory.load(ORDERING)).mux(data, store).into();
        // self.bit_memory.store(to_store, ORDERING);
    }
}

pub struct B8Register {
    bit_memory: [DLatch; 8],
}
impl B8Register {
    pub fn new() -> Self {
        B8Register {
            bit_memory: std::array::from_fn(|_| DLatch::new()),
        }
    }

    pub fn read(&self) -> B8 {
        B8::from_fn(|i| self.bit_memory[i as usize].read())
    }

    pub fn store(&self, data: B8) {
        for (i, memory) in self.bit_memory.iter().enumerate() {
            memory.store(data.bit(i as u8));
        }
    }
}

pub struct Counter {
    register: B16Register,
}
impl Counter {
    pub fn new() -> Self {
        Self {
            register: B16Register::new(),
        }
    }
    /// set_reset: bool -> true: set false:reset
    pub fn write(&self, set: bool, reset: bool, increment: bool, data: B16, store: bool) {
        let input = data.mux3x3(B16(0), self.read().increment(), set, reset, increment);

        self.register.write(input, store);
    }

    pub fn read(&self) -> B16 {
        self.register.read()
    }
}
