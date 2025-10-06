pub mod RAM;

use std::{
    fs::write,
    sync::atomic::{AtomicBool, AtomicI16, AtomicI32, AtomicU16, AtomicU32},
};

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
    bit_memory: AtomicU32,
}
impl Clone for B32Register {
    fn clone(&self) -> Self {
        Self {
            bit_memory: AtomicU32::new(self.bit_memory.load(ORDERING)),
        }
    }
}
impl B32Register {
    pub fn new() -> Self {
        Self {
            bit_memory: AtomicU32::new(0),
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
