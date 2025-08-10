pub mod RAM;

use std::sync::atomic::{AtomicBool, AtomicI16, AtomicI32, AtomicU16};

use log::info;

use super::{
    b8::B8,
    b32::B32,
    bit::{mux, mux_3x3, mux_4, mux_8},
};
//
// //INFO: My main target is to simulate whole system so I don't have to cut complexity and
// // simulating realistic, recursive xor dlatch would be too expensive.
// pub struct DLatch {
//     pub last_val: AtomicBool,
// }
// impl DLatch {
//     pub fn new() -> Self {
//         DLatch {
//             last_val: AtomicBool::new(false),
//         }
//     }
//     fn read(&self) -> bool {
//         self.last_val.load(ORDERING)
//     }
//     fn store(&self, data: bool) {
//         self.last_val.store(data, ORDERING);
//     }
// }
const ORDERING: std::sync::atomic::Ordering = std::sync::atomic::Ordering::SeqCst;

pub struct B32Register {
    bit_memory: AtomicI32,
}
impl B32Register {
    pub fn new() -> Self {
        Self {
            bit_memory: AtomicI32::new(0),
        }
    }

    pub fn read(&self) -> B32 {
        B32(self.bit_memory.load(ORDERING))
    }

    pub fn write(&self, data: B32, store: bool) {
        // had to do it because it wasn't working when multithreaded D:
        // + it's faster :D
        if (store) {
            self.bit_memory.store(data.0, ORDERING);
        }

        // let to_store = B32(self.bit_memory.load(ORDERING)).mux(data, store).into();
        // self.bit_memory.store(to_store, ORDERING);
    }
}

pub struct Counter {
    register: B32Register,
}
impl Counter {
    pub fn new() -> Self {
        Self {
            register: B32Register::new(),
        }
    }
    /// set_reset: bool -> true: set false:reset
    pub fn write(&self, set: bool, reset: bool, increment: bool, data: B32, store: bool) {
        let input = B32::mux3x3_fn(
            || data,
            || B32(0),
            || self.read().increment(),
            set,
            reset,
            increment,
        );

        self.register.write(input, store);
    }

    pub fn read(&self) -> B32 {
        self.register.read()
    }
}
