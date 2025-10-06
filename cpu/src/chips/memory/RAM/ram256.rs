use log::{debug, info};

use crate::chips::{b8::B8, b32::B32, memory::B32Register};

use super::get_selectors;

pub struct RAM256 {
    modules: Vec<B32Register>,
}
impl RAM256 {
    pub fn new() -> Self {
        Self {
            modules: vec![B32Register::new(); 256],
        }
    }

    pub const RAM_START_INDEX: u8 = 0;

    pub fn read(&self, addr: B8) -> B32 {
        let out = B32::mux256_fn(&self.modules, |register| register.read(), addr);
        out
    }
    pub fn increment(&self, addr: B8) {
        let out = B32::mux256_fn(&self.modules, |register| register.read(), addr);
        self.write(out + B32(1), addr, true);
    }
    pub fn write(&self, data: B32, addr: B8, store: bool) {
        data.d_mux256_fn(
            &self.modules,
            |register, data| register.write(data, store),
            addr,
        );
    }
}
