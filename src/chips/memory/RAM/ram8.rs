use crate::chips::{b16::B16, bit::d_mux8, memory::B16Register};

use super::get_selectors;

pub struct RAM8 {
    modules: [B16Register; 8],
}
impl RAM8 {
    pub fn new() -> Self {
        Self {
            modules: std::array::from_fn(|_| B16Register::new()),
        }
    }

    pub const RAM_START_INDEX: u8 = 0 * 3;

    pub fn read(&self, addr: B16) -> B16 {
        let (sel_1, sel_2, sel_3) = get_selectors(addr, Self::RAM_START_INDEX);
        self.modules[0].read().mux8(
            self.modules[1].read(),
            self.modules[2].read(),
            self.modules[3].read(),
            self.modules[4].read(),
            self.modules[5].read(),
            self.modules[6].read(),
            self.modules[7].read(),
            sel_1,
            sel_2,
            sel_3,
        )
    }

    pub fn write(&self, data: B16, addr: B16, store: bool) {
        let (sel_1, sel_2, sel_3) = get_selectors(addr, Self::RAM_START_INDEX);
        let dmux = d_mux8(store, sel_1, sel_2, sel_3);

        for i in 0..8 {
            self.modules[i].write(data, dmux[i]);
        }
    }
}
