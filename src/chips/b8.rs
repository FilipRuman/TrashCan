use std::{
    fmt::Display,
    iter::from_fn,
    ops::{BitAnd, BitXor, Not},
};

use super::bit::{d_mux, mux};

#[derive(Clone, Copy, Debug)]
pub struct B8(pub i8);
impl From<i8> for B8 {
    fn from(value: i8) -> Self {
        B8(value)
    }
}
impl Display for B8 {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        self.0.fmt(f)
    }
}

impl From<B8> for i8 {
    fn from(value: B8) -> Self {
        value.0
    }
}
impl AsRef<i8> for B8 {
    fn as_ref(&self) -> &i8 {
        &self.0
    }
}
impl Not for B8 {
    type Output = B8;

    #[inline(always)]
    fn not(self) -> Self::Output {
        B8::from_fn(|i| !self.bit(7))
    }
}

impl BitXor for B8 {
    type Output = B8;

    #[inline(always)]
    fn bitxor(self, rhs: Self) -> Self::Output {
        B8::from_fn(|i| self.bit(i) ^ rhs.bit(i))
    }
}
impl BitAnd for B8 {
    type Output = Self;

    #[inline(always)]
    fn bitand(self, rhs: Self) -> Self::Output {
        Self::from_fn(|i| self.bit(i) & rhs.bit(i))
    }
}
impl PartialEq for B8 {
    fn eq(&self, other: &Self) -> bool {
        let mut temp = true;
        for i in 0..8 {
            temp = temp & (self.bit(i) == other.bit(i));
        }
        temp
    }
}
impl B8 {
    #[inline(always)]
    pub fn xor_bit(self, b: bool) -> B8 {
        B8::from_fn(|i| self.bit(i) ^ b)
    }
    #[inline(always)]
    pub fn zero(self) -> bool {
        !self.bit(0)
            & !self.bit(1)
            & !self.bit(2)
            & !self.bit(3)
            & !self.bit(4)
            & !self.bit(5)
            & !self.bit(6)
            & !self.bit(7)
    }
    #[inline(always)]
    pub fn negative(self) -> bool {
        self.bit(7)
    }
    #[inline(always)]
    pub fn negate(mut self) {
        self.set_bit(7, !self.bit(7));
    }
    #[inline(always)]
    /// Works like mux sle=true-> b instead of self
    /// true right false left
    pub fn mux(self, b: B8, sel: bool) -> B8 {
        B8::from_fn(|i| mux(self.bit(i), b.bit(i), sel))
    }

    #[inline(always)]
    pub fn d_mux(self, sel: bool) -> (B8, B8) {
        // this is not the fastest way to do it, but this simplifies code a lot and d_mux is fast as
        // heck anyway
        (
            B8::from_fn(|i| d_mux(self.bit(i), sel).0),
            B8::from_fn(|i| d_mux(self.bit(i), sel).1),
        )
    }

    // WARN: they use operation that I have not implemented.
    // I use them for efficiency, and ease of use. I could make this struct to be just 8 bytes
    // together this would use 8 time the memory + be pain in the ass for converting this between
    // normal units for debugging.
    // + in the future if I need this to be more efficient I can easily convert all operations
    // for native, more efficient versions
    #[inline(always)]
    pub fn bit(self, i: u8) -> bool {
        debug_assert!(i < 8);
        (self.0 >> i) & 1 != 0
    }
    #[inline(always)]
    pub fn set_bit(&mut self, i: u8, value: bool) {
        debug_assert!(i < 8);
        if value {
            self.0 |= 1 << i;
        } else {
            self.0 &= !(1 << i);
        }
    }

    // this function Is just a representation of creating a copy of circuits from that function * 7
    // and wiring them into one B8 line
    // so It is totally legal
    // btw. It's so good!
    #[inline(always)]
    pub fn from_fn<F: Fn(u8) -> bool>(func: F) -> B8 {
        let mut bits = [true; 8];
        for i in 0..8 {
            bits[i] = func(i as u8);
        }
        B8::from_bits(&bits)
    }
    #[inline(always)]
    // this is the same as moving cables forward and cutting ones that are not needed
    pub fn shift_bits(self, shift: i8) -> B8 {
        let mut bits = [false; 8];
        for i in 0..8 - shift.abs() {
            bits[i as usize] = self.bit((i + shift) as u8);
        }

        B8::from_bits(&bits)
    }

    // this is legal because I can replace it with just spamming set_bit
    #[inline(always)]
    pub fn from_bits(bits: &[bool; 8]) -> B8 {
        B8(bits
            .iter()
            .enumerate()
            .fold(0i8, |acc, (i, &bit)| acc | ((bit as i8) << i)))
    }
}
