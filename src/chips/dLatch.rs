use std::sync::atomic::AtomicBool;

use super::{b8::B8, b16::B16};

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
        self.last_val.load(std::sync::atomic::Ordering::Relaxed)
    }
    fn store(&self, data: bool) {
        self.last_val
            .store(data, std::sync::atomic::Ordering::Relaxed);
    }
}

pub struct B16Memory {
    bit_memory: [DLatch; 16],
}
impl B16Memory {
    pub fn new() -> Self {
        Self {
            bit_memory: [
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
            ],
        }
    }

    pub fn read(&self) -> B16 {
        B16::from_fn(|i| self.bit_memory[i as usize].read())
    }

    pub fn store(&self, data: B16) {
        for (i, memory) in self.bit_memory.iter().enumerate() {
            memory.store(data.bit(i as u8));
        }
    }
}

pub struct B8Memory {
    bit_memory: [DLatch; 8],
}
impl B8Memory {
    pub fn new() -> Self {
        B8Memory {
            bit_memory: [
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
                DLatch::new(),
            ],
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
