use crate::chips::{b16::B16, bit::d_mux8};

use super::{get_selectors, ram64::RAM64};

pub struct RAM512 {
    modules: [RAM64; 8],
}
impl RAM512 {
    pub fn new() -> Self {
        Self {
            modules: std::array::from_fn(|_| RAM64::new()),
        }
    }

    pub const RAM_START_INDEX: u8 = 2 * 3;

    pub fn read(&self, addr: B16) -> B16 {
        let (sel_1, sel_2, sel_3) = get_selectors(addr, Self::RAM_START_INDEX);
        self.modules[0].read(addr).mux8(
            self.modules[1].read(addr),
            self.modules[2].read(addr),
            self.modules[3].read(addr),
            self.modules[4].read(addr),
            self.modules[5].read(addr),
            self.modules[6].read(addr),
            self.modules[7].read(addr),
            sel_1,
            sel_2,
            sel_3,
        )
    }

    pub fn write(&self, data: B16, addr: B16, store: bool) {
        let (sel_1, sel_2, sel_3) = get_selectors(addr, Self::RAM_START_INDEX);
        let dmux = d_mux8(store, sel_1, sel_2, sel_3);

        for i in 0..8 {
            self.modules[i].write(data, addr, dmux[i]);
        }
    }
}
