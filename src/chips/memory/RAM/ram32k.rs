use crate::chips::b32::B32;

use super::{get_selectors, ram4k::RAM4k, ram512::RAM512};

pub struct RAM32k {
    modules: Vec<RAM4k>,
}
impl RAM32k {
    pub fn new() -> Self {
        Self {
            modules: vec![
                RAM4k::new(),
                RAM4k::new(),
                RAM4k::new(),
                RAM4k::new(),
                RAM4k::new(),
                RAM4k::new(),
                RAM4k::new(),
                RAM4k::new(),
            ],
        }
    }

    pub const RAM_START_INDEX: u8 = 4 * 3;

    pub fn read(&self, addr: B32) -> B32 {
        let (sel_1, sel_2, sel_3) = get_selectors(addr, Self::RAM_START_INDEX);
        B32::mux8_fn(
            || self.modules[0].read(addr),
            || self.modules[1].read(addr),
            || self.modules[2].read(addr),
            || self.modules[3].read(addr),
            || self.modules[4].read(addr),
            || self.modules[5].read(addr),
            || self.modules[6].read(addr),
            || self.modules[7].read(addr),
            sel_1,
            sel_2,
            sel_3,
        )
    }
    pub fn write(&self, data: B32, addr: B32, store: bool) {
        let (sel_1, sel_2, sel_3) = get_selectors(addr, Self::RAM_START_INDEX);
        data.d_mux8_fn(
            sel_1,
            sel_2,
            sel_3,
            |data| self.modules[0].write(data, addr, store),
            |data| self.modules[1].write(data, addr, store),
            |data| self.modules[2].write(data, addr, store),
            |data| self.modules[3].write(data, addr, store),
            |data| self.modules[4].write(data, addr, store),
            |data| self.modules[5].write(data, addr, store),
            |data| self.modules[6].write(data, addr, store),
            |data| self.modules[7].write(data, addr, store),
        );
    }
}
