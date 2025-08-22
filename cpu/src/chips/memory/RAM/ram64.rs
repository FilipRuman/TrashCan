use crate::chips::b32::B32;

use super::{get_selectors, ram8::RAM8};

pub struct RAM64 {
    modules: [RAM8; 8],
}
impl RAM64 {
    pub fn new() -> Self {
        Self {
            modules: std::array::from_fn(|_| RAM8::new()),
        }
    }

    pub const RAM_START_INDEX: u8 = 1 * 3;

    pub fn read(&self, addr: B32) -> B32 {
        let (sel_1, sel_2, sel_3) = get_selectors(addr, Self::RAM_START_INDEX);

        let out = B32::mux8_fn(
            &self.modules,
            |module| module.read(addr),
            sel_1,
            sel_2,
            sel_3,
        );

        out
    }
    pub fn write(&self, data: B32, addr: B32, store: bool) {
        let (sel_1, sel_2, sel_3) = get_selectors(addr, Self::RAM_START_INDEX);

        data.d_mux8_fn(
            &self.modules,
            |module, data| module.write(data, addr, store),
            sel_1,
            sel_2,
            sel_3,
        );
    }
}
