use std::{
    fmt::Display,
    ops::{Add, BitAnd, BitXor, Not},
};

use super::bit::{d_mux, d_mux8, mux, mux_3x3, mux_8};

#[derive(Clone, Copy, Debug)]
pub struct B16(pub i16);
impl From<i16> for B16 {
    fn from(value: i16) -> Self {
        B16(value)
    }
}
impl Display for B16 {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        self.0.fmt(f)
    }
}
impl From<B16> for i16 {
    fn from(value: B16) -> Self {
        value.0
    }
}
impl AsRef<i16> for B16 {
    fn as_ref(&self) -> &i16 {
        &self.0
    }
}
impl Not for B16 {
    type Output = B16;

    #[inline(always)]
    fn not(self) -> Self::Output {
        // This is just too big. this makes no sense to make it by hand like with B8.
        (!self.0).into()
    }
}

impl BitXor for B16 {
    type Output = B16;

    #[inline(always)]
    fn bitxor(self, rhs: Self) -> Self::Output {
        B16(self.0 ^ rhs.0)
    }
}
impl BitAnd for B16 {
    type Output = Self;

    #[inline(always)]
    fn bitand(self, rhs: Self) -> Self::Output {
        Self::from_fn(|i| self.bit(i) & rhs.bit(i))
    }
}
impl PartialEq for B16 {
    fn eq(&self, other: &Self) -> bool {
        let mut temp = true;
        for i in 0..16 {
            temp = temp & (self.bit(i) == other.bit(i));
        }
        temp
    }
}

impl B16 {
    #[inline(always)]
    pub fn xor_(self, b: bool) -> B16 {
        B16::from_fn(|i| self.bit(i) ^ b)
    }

    #[inline(always)]
    pub fn xor_bit(self, b: bool) -> B16 {
        B16::from_fn(|i| self.bit(i) ^ b)
    }
    #[inline(always)]
    pub fn zero(self) -> bool {
        self.0 == 0
    }
    #[inline(always)]
    pub fn negative(self) -> bool {
        self.bit(15)
    }
    #[inline(always)]
    pub fn negate(mut self) {
        self.set_bit(15, !self.bit(7));
    }

    // WARN: they use operation that I have not implemented.
    // I use them for efficiency, and ease of use. I could make this struct to be just 8 bytes
    // together this would use 8 time the memory + be pain in the ass for converting this between
    // normal units for debugging.
    // + in the future if I need this to be more efficient I can easily convert all operations
    // for native, more efficient versions
    #[inline(always)]
    pub fn bit(self, i: u8) -> bool {
        debug_assert!(i < 16);
        (self.0 >> i) & 1 != 0
    }
    #[inline(always)]
    pub fn set_bit(&mut self, i: u8, value: bool) {
        debug_assert!(i < 16);
        if value {
            self.0 |= 1 << i;
        } else {
            self.0 &= !(1 << i);
        }
    }

    #[inline(always)]
    /// Works like mux sle=true-> b instead of self
    /// true left false right
    pub fn mux(self, b: B16, sel: bool) -> B16 {
        B16::from_fn(|i| mux(self.bit(i), b.bit(i), sel))
    }

    #[inline(always)]
    pub fn mux3x3(self, b: B16, c: B16, sel_1: bool, sel_2: bool, sel_3: bool) -> B16 {
        B16::from_fn(|i| mux_3x3(self.bit(i), b.bit(i), c.bit(i), sel_1, sel_2, sel_3))
    }
    #[inline(always)]
    /// Works like mux sle=true-> b instead of self
    /// true left false right
    /// This could be much more efficient by using function calls and not calling ones that are not
    /// needed
    pub fn mux8(
        self,
        b: B16,
        c: B16,
        d: B16,
        e: B16,
        f: B16,
        g: B16,
        h: B16,
        sel_1: bool,
        sel_2: bool,
        sel_3: bool,
    ) -> B16 {
        B16::from_fn(|i| {
            mux_8(
                self.bit(i),
                b.bit(i),
                c.bit(i),
                d.bit(i),
                e.bit(i),
                f.bit(i),
                g.bit(i),
                h.bit(i),
                sel_1,
                sel_2,
                sel_3,
            )
        })
    }
    #[inline(always)]
    pub fn d_mux8(self, sel_1: bool, sel_2: bool, sel_3: bool) -> [B16; 8] {
        let mut out = [[false; 8]; 16];
        for i in 0..16 {
            out[i] = d_mux8(self.bit(i as u8), sel_1, sel_2, sel_3)
        }

        [
            B16::from_fn(|i| out[i as usize][0]),
            B16::from_fn(|i| out[i as usize][1]),
            B16::from_fn(|i| out[i as usize][2]),
            B16::from_fn(|i| out[i as usize][3]),
            B16::from_fn(|i| out[i as usize][4]),
            B16::from_fn(|i| out[i as usize][5]),
            B16::from_fn(|i| out[i as usize][6]),
            B16::from_fn(|i| out[i as usize][7]),
        ]
    }

    #[inline(always)]
    pub fn d_mux(self, sel: bool) -> (B16, B16) {
        // this is not the fastest way to do it, but this simplifies code a lot and d_mux is fast as
        // heck anyway
        (
            B16::from_fn(|i| d_mux(self.bit(i), sel).0),
            B16::from_fn(|i| d_mux(self.bit(i), sel).1),
        )
    }
    #[inline(always)]
    // this is the same as moving cables forward and cutting ones that are not needed
    pub fn shift_bits(self, shift: i8) -> B16 {
        let mut bits = [false; 16];
        for i in 0..16 - shift.max(0) {
            bits[(i + shift) as usize] = self.bit(i as u8);
        }

        B16::from_bits(&bits)
    }

    // this function Is just a representation of creating a copy of circuits from that function * 7
    // and wiring them into one B8 line
    // so It is totally legal
    // btw. It's so good!
    #[inline(always)]
    pub fn from_fn<F: Fn(u8) -> bool>(func: F) -> B16 {
        let mut bits = [true; 16];
        for i in 0..16 {
            bits[i] = func(i as u8);
        }
        B16::from_bits(&bits)
    }

    // this is legal because I can replace it with just spamming set_bit
    #[inline(always)]
    pub fn from_bits(bits: &[bool; 16]) -> B16 {
        B16(bits
            .iter()
            .enumerate()
            .fold(0i16, |acc, (i, &bit)| acc | ((bit as i16) << i)))
    }
}
