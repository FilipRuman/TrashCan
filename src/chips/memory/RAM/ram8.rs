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

        let out = B32::mux8_fn(
            || self.modules[0].read(),
            || self.modules[1].read(),
            || self.modules[2].read(),
            || self.modules[3].read(),
            || self.modules[4].read(),
            || self.modules[5].read(),
            || self.modules[6].read(),
            || self.modules[7].read(),
            sel_1,
            sel_2,
            sel_3,
        );

        // info!(" read out: {out} {:?} {sel_1} {sel_2} {sel_3}", addr);
        out
    }
    pub fn write(&self, data: B32, addr: B32, store: bool) {
        let (sel_1, sel_2, sel_3) = get_selectors(addr, Self::RAM_START_INDEX);
        // info!("write: {sel_1} {sel_2} {sel_3}");

        data.d_mux8_fn(
            sel_1,
            sel_2,
            sel_3,
            |data| self.modules[0].write(data, store),
            |data| self.modules[1].write(data, store),
            |data| self.modules[2].write(data, store),
            |data| self.modules[3].write(data, store),
            |data| self.modules[4].write(data, store),
            |data| self.modules[5].write(data, store),
            |data| self.modules[6].write(data, store),
            |data| self.modules[7].write(data, store),
        );
    }
}
