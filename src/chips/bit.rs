use anyhow::*;

// I don't use them but just to show that I could implement them myself
#[inline(always)]
pub fn nand(a: bool, b: bool) -> bool {
    !(a & b)
}

#[inline(always)]
pub fn or(a: bool, b: bool) -> bool {
    nand(!a, !b)
}

#[inline(always)]
pub fn xor(a: bool, b: bool) -> bool {
    or(a, b) & nand(a, b)
}

#[inline(always)]
pub fn mux_4(a: bool, b: bool, c: bool, d: bool, sel_1: bool, sel_2: bool) -> bool {
    (a & sel_1) | (b & !sel_1) | (c & sel_2) | (d & !sel_2)
}

#[inline(always)]
// true right false left
pub fn mux(a: bool, b: bool, sel: bool) -> bool {
    (a & !sel) | (b & sel)
}

#[inline(always)]
pub fn d_mux_4(input: bool, sel_1: bool, sel_2: bool) -> (bool, bool, bool, bool) {
    (input & sel_1, input & !sel_1, input & sel_2, input & !sel_2)
}

#[inline(always)]
pub fn d_mux(input: bool, sel: bool) -> (bool, bool) {
    (input & sel, input & !sel)
}


#[inline(always)]
pub fn equals(b: bool, a: bool) -> bool {
    (a & b) | (!a & !b)
}
