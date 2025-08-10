use crate::chips::b32::B32;

pub mod ram256k;
pub mod ram32k;
pub mod ram4k;
pub mod ram512;
pub mod ram64;
pub mod ram8;

pub fn get_selectors(addr: B32, start_index: u8) -> (bool, bool, bool) {
    let sel_1 = addr.bit(start_index);
    let sel_2 = addr.bit(start_index + 1);
    let sel_3 = addr.bit(start_index + 2);
    (sel_1, sel_2, sel_3)
}
