use log::{debug, info};

use crate::chips::{b32::B32, memory::B32Register};

use super::get_selectors;

pub struct RAM8 {
    modules: [B32Register; 8],
}
impl RAM8 {
    pub fn new() -> Self {
        Self {
            modules: std::array::from_fn(|_| B32Register::new()),
        }
    }

    pub const RAM_START_INDEX: u8 = 0;

    pub fn read(&self, addr: B32) -> B32 {
        let (sel_1, sel_2, sel_3) = get_selectors(addr, Self::RAM_START_INDEX);

        let out = B32::mux8_fn(&self.modules, |module| module.read(), sel_1, sel_2, sel_3);

        out
    }
    pub fn write(&self, data: B32, addr: B32, store: bool) {
        let (sel_1, sel_2, sel_3) = get_selectors(addr, Self::RAM_START_INDEX);

        data.d_mux8_fn(
            &self.modules,
            |module, data| module.write(data, store),
            sel_1,
            sel_2,
            sel_3,
        );
    }
}
