use std::{
    cmp::Ordering,
    fmt::Display,
    ops::{Add, BitAnd, BitOr, BitXor, Not, Shl, Shr},
};

use log::debug;

use super::{
    b8::B8,
    bit::{self, d_mux, mux, mux_3x3, mux_8},
};

#[derive(Clone, Copy, Debug)]
pub struct B32(pub i32);
impl BitOr for B32 {
    type Output = Self;

    #[cfg(not(feature = "realistic"))]
    fn bitor(self, rhs: Self) -> Self::Output {
        B32(self.0 | rhs.0)
    }

    #[cfg(feature = "realistic")]
    fn bitor(self, rhs: Self) -> Self::Output {
        B32::from_fn(|i| self.bit(i) | rhs.bit(i))
    }
}
impl From<i32> for B32 {
    fn from(value: i32) -> Self {
        B32(value)
    }
}
impl Display for B32 {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        self.0.fmt(f)
    }
}
impl Shl for B32 {
    type Output = Self;

    fn shl(self, rhs: Self) -> Self::Output {
        self.shift_bits(-rhs.0 as i8)
    }
}
impl Shr for B32 {
    type Output = Self;

    fn shr(self, rhs: Self) -> Self::Output {
        self.shift_bits(rhs.0 as i8)
    }
}
impl From<B32> for i32 {
    fn from(value: B32) -> Self {
        value.0
    }
}
impl AsRef<i32> for B32 {
    fn as_ref(&self) -> &i32 {
        &self.0
    }
}
impl Not for B32 {
    type Output = B32;

    #[inline(always)]
    fn not(self) -> Self::Output {
        // This is just too big. this makes no sense to make it by hand like with B8.
        (!self.0).into()
    }
}

impl PartialOrd for B32 {
    #[cfg(feature = "realistic")]
    fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
        let sub = *self - *other;

        let out = B32(Ordering::Less as i32).mux3x3(
            B32(Ordering::Equal as i32),
            B32(Ordering::Greater as i32),
            sub.negative(),
            sub.negative(),
            sub.negative(),
        );

        // conversion form i32 to enum
        return Some(match out.0 {
            -1 => Ordering::Less,
            0 => Ordering::Equal,
            1 => Ordering::Greater,
            _ => {
                panic!("wtf")
            }
        });
    }
    #[cfg(not(feature = "realistic"))]
    fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
        self.0.partial_cmp(&other.0)
    }
}
impl BitXor for B32 {
    type Output = B32;

    #[inline(always)]
    fn bitxor(self, rhs: Self) -> Self::Output {
        B32(self.0 ^ rhs.0)
    }
}

impl BitAnd for B32 {
    type Output = Self;

    #[inline(always)]
    #[cfg(not(feature = "realistic"))]
    fn bitand(self, rhs: Self) -> Self::Output {
        B32(self.0 & rhs.0)
    }

    #[inline(always)]
    #[cfg(feature = "realistic")]
    fn bitand(self, rhs: Self) -> Self::Output {
        Self::from_fn(|i| self.bit(i) & rhs.bit(i))
    }
}
impl PartialEq for B32 {
    #[inline(always)]
    #[cfg(feature = "realistic")]
    fn eq(&self, other: &Self) -> bool {
        let mut temp = true;
        for i in 0..16 {
            temp = temp & (self.bit(i) == other.bit(i));
        }
        temp
    }
    #[inline(always)]
    #[cfg(not(feature = "realistic"))]
    fn eq(&self, other: &Self) -> bool {
        return self.0 == other.0;
    }
}

impl B32 {
    #[inline(always)]
    pub fn xor_(self, b: bool) -> B32 {
        B32::from_fn(|i| self.bit(i) ^ b)
    }

    #[inline(always)]
    pub fn xor_bit(self, b: bool) -> B32 {
        B32::from_fn(|i| self.bit(i) ^ b)
    }
    #[inline(always)]
    pub fn zero(self) -> bool {
        self.0 == 0
    }
    #[inline(always)]
    pub fn negative(self) -> bool {
        self.bit(31)
    }
    #[inline(always)]
    pub fn negate(self) -> B32 {
        let mut out = self.clone();
        out.set_bit(31, !self.bit(7));
        out
    }
    pub fn abs(self) -> B32 {
        let mut out = self.clone();
        out.set_bit(31, false);
        out
    }

    // WARN: they use operation that I have not implemented.
    // I use them for efficiency, and ease of use. I could make this struct to be just 8 bytes
    // together this would use 8 time the memory + be pain in the ass for converting this between
    // normal units for debugging.
    // + in the future if I need this to be more efficient I can easily convert all operations
    // for native, more efficient versions
    #[inline(always)]
    pub fn bit(self, i: u8) -> bool {
        debug_assert!(i < 32);
        (self.0 >> i) & 1 != 0
    }
    // reads one of bytes in range 0..4

    #[inline(always)]
    pub fn byte(self, index: usize) -> B8 {
        debug_assert!(
            index < 4,
            "getting byte at higher index than it is possible in b32 (has 4 bytes, so index < 4)"
        );
        B8(((self.0 >> (index * 8)) & 0xFF) as i8)
    }

    #[inline(always)]
    pub fn set_bit(&mut self, i: u8, value: bool) {
        debug_assert!(i < 32);
        if value {
            self.0 |= 1 << i;
        } else {
            self.0 &= !(1 << i);
        }
    }

    #[inline(always)]
    /// Works like mux sle=true-> b instead of self
    /// true left false right
    pub fn mux(self, b: B32, sel: bool) -> B32 {
        B32::from_fn(|i| mux(self.bit(i), b.bit(i), sel))
    }
    #[inline(always)]
    #[cfg(not(feature = "realistic"))]

    pub fn mux_fn<A: Fn() -> B32, B: Fn() -> B32>(a: A, b: B, sel: bool) -> B32 {
        if sel {
            return a();
        }
        b()
    }

    #[inline(always)]
    #[cfg(feature = "realistic")]

    pub fn mux_fn<A: Fn() -> B32, B: Fn() -> B32>(a: A, b: B, sel: bool) -> B32 {
        a().mux(b(), sel)
    }

    #[cfg(not(feature = "realistic"))]
    #[inline(always)]
    pub fn mux3x3_fn<A: Fn() -> B32, B: Fn() -> B32, C: Fn() -> B32>(
        a: A,
        b: B,
        c: C,
        sel_1: bool,
        sel_2: bool,
        sel_3: bool,
    ) -> B32 {
        if sel_1 {
            a()
        } else if sel_2 {
            b()
        } else if sel_3 {
            c()
        } else {
            B32(0)
        }
    }

    #[cfg(feature = "realistic")]
    #[inline(always)]
    pub fn mux3x3_fn<A: Fn() -> B32, B: Fn() -> B32, C: Fn() -> B32>(
        a: A,
        b: B,
        c: C,
        sel_1: bool,
        sel_2: bool,
        sel_3: bool,
    ) -> B32 {
        B32::from_fn(|i| mux_3x3(a().bit(i), b().bit(i), c().bit(i), sel_1, sel_2, sel_3))
    }

    #[inline(always)]
    fn mux3x3(self, b: B32, c: B32, sel_1: bool, sel_2: bool, sel_3: bool) -> B32 {
        B32::from_fn(|i| mux_3x3(self.bit(i), b.bit(i), c.bit(i), sel_1, sel_2, sel_3))
    }
    #[inline(always)]
    #[cfg(feature = "realistic")]
    pub fn mux8_fn_in<T, F: Fn(Self, &T) -> B32>(
        self,
        values: &[T; 8],
        func: F,
        sel_1: bool,
        sel_2: bool,
        sel_3: bool,
    ) -> B32 {
        todo!()
    }

    #[cfg(not(feature = "realistic"))]
    pub fn mux8_fn_in<T, F: Fn(Self, &T) -> B32>(
        self,
        values: &[T; 8],
        func: F,
        sel_1: bool,
        sel_2: bool,
        sel_3: bool,
    ) -> B32 {
        let idx = ((sel_1 as usize) << 7) | ((sel_2 as usize) << 6) | ((sel_3 as usize) << 5);

        func(self, &values[idx])
    }

    #[cfg(not(feature = "realistic"))]
    pub fn mux256_fn<T, F: Fn(&T) -> B32>(values: &Vec<T>, func: F, sel: B8) -> B32 {
        let idx = ((sel.bit(0) as usize) << 7)
            | ((sel.bit(1) as usize) << 6)
            | ((sel.bit(2) as usize) << 5)
            | ((sel.bit(3) as usize) << 4)
            | ((sel.bit(4) as usize) << 3)
            | ((sel.bit(5) as usize) << 2)
            | ((sel.bit(6) as usize) << 1)
            | (sel.bit(7) as usize);

        func(&values[idx])
    }

    #[cfg(feature = "realistic")]
    pub fn mux256_fn<T, F: Fn(&T) -> B32>(values: &Vec<T>, func: F, sel: B8) -> B32 {
        todo!()
    }

    #[inline(always)]
    #[cfg(feature = "realistic")]
    pub fn mux8_fn<T, F: Fn(&T) -> B32>(
        values: &[T; 8],
        func: F,
        sel_1: bool,
        sel_2: bool,
        sel_3: bool,
    ) -> B32 {
        todo!()
    }

    #[inline(always)]
    #[cfg(not(feature = "realistic"))]
    pub fn mux8_fn<T, F: Fn(&T) -> B32>(
        values: &[T; 8],
        func: F,
        sel_1: bool,
        sel_2: bool,
        sel_3: bool,
    ) -> B32 {
        let idx = ((sel_1 as usize) << 2) | ((sel_2 as usize) << 1) | (sel_3 as usize);

        func(&values[idx])
    }
    pub fn mux8_fn_vec<T, F: Fn(&T) -> B32>(
        values: &Vec<T>,
        func: F,
        sel_1: bool,
        sel_2: bool,
        sel_3: bool,
    ) -> B32 {
        let idx = ((sel_1 as usize) << 2) | ((sel_2 as usize) << 1) | (sel_3 as usize);

        func(&values[idx])
    }

    /// Works like mux sle=true-> b instead of self
    /// true left false right
    /// This could be much more efficient by using function calls and not calling ones that are not
    /// needed
    fn mux8(
        self,
        b: B32,
        c: B32,
        d: B32,
        e: B32,
        f: B32,
        g: B32,
        h: B32,
        sel_1: bool,
        sel_2: bool,
        sel_3: bool,
    ) -> B32 {
        B32::from_fn(|i| {
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
    #[cfg(feature = "realistic")]
    pub fn d_mux256_fn<T, F: Fn(&T, B32)>(self, values: &Vec<T>, func: F, sel: B8) {
        let idx = ((sel.bit(0) as usize) << 7)
            | ((sel.bit(1) as usize) << 6)
            | ((sel.bit(2) as usize) << 5)
            | ((sel.bit(3) as usize) << 4)
            | ((sel.bit(4) as usize) << 3)
            | ((sel.bit(5) as usize) << 2)
            | ((sel.bit(6) as usize) << 1)
            | (sel.bit(7) as usize);

        todo!()
    }

    #[inline(always)]
    #[cfg(not(feature = "realistic"))]
    pub fn d_mux256_fn<T, F: Fn(&T, B32)>(self, values: &Vec<T>, func: F, sel: B8) {
        let idx = ((sel.bit(0) as usize) << 7)
            | ((sel.bit(1) as usize) << 6)
            | ((sel.bit(2) as usize) << 5)
            | ((sel.bit(3) as usize) << 4)
            | ((sel.bit(4) as usize) << 3)
            | ((sel.bit(5) as usize) << 2)
            | ((sel.bit(6) as usize) << 1)
            | (sel.bit(7) as usize);

        func(&values[idx], self)
    }
    #[inline(always)]
    #[cfg(not(feature = "realistic"))]
    pub fn d_mux8_fn<T, F: Fn(&T, B32)>(
        self,
        values: &[T; 8],
        func: F,
        sel_1: bool,
        sel_2: bool,
        sel_3: bool,
    ) {
        let idx = ((sel_1 as usize) << 2) | ((sel_2 as usize) << 1) | (sel_3 as usize);

        func(&values[idx], self)
    }
    pub fn d_mux8_fn_vec<T, F: Fn(&T, B32)>(
        self,
        values: &Vec<T>,
        func: F,
        sel_1: bool,
        sel_2: bool,
        sel_3: bool,
    ) {
        let idx = ((sel_1 as usize) << 2) | ((sel_2 as usize) << 1) | (sel_3 as usize);

        func(&values[idx], self)
    }

    #[inline(always)]
    #[cfg(feature = "realistic")]
    pub fn d_mux8_fn<T, F: Fn(&T, B32)>(
        self,
        values: &[T; 8],
        func: F,
        sel_1: bool,
        sel_2: bool,
        sel_3: bool,
    ) {
        todo!()
    }

    #[inline(always)]
    fn d_mux(self, sel: bool) -> (B32, B32) {
        // this is not the fastest way to do it, but this simplifies code a lot and d_mux is fast as
        // heck anyway
        (
            B32::from_fn(|i| d_mux(self.bit(i), sel).0),
            B32::from_fn(|i| d_mux(self.bit(i), sel).1),
        )
    }
    #[inline(always)]
    // this is the same as moving cables forward and cutting ones that are not needed
    pub fn shift_bits(self, shift: i8) -> B32 {
        let mut bits = [false; 32];
        for i in 0..32 - shift.max(0) {
            bits[(i + shift) as usize] = self.bit(i as u8);
        }

        B32::from_bits(&bits)
    }

    // this function Is just a representation of creating a copy of circuits from that function * 7
    // and wiring them into one B8 line
    // so It is totally legal
    // btw. It's so good!
    #[inline(always)]
    pub fn from_fn<F: Fn(u8) -> bool>(func: F) -> B32 {
        let mut bits = [true; 32];
        for i in 0..32 {
            bits[i] = func(i as u8);
        }
        B32::from_bits(&bits)
    }
    #[inline(always)]
    pub fn bits(self) -> [bool; 8] {
        let value: u8 = 42;

        let mut bits = [false; 8];
        for i in 0..8 {
            bits[7 - i] = ((self >> B32(i as i32)) & B32(1)).0 == 1; // MSB at index 0
        }
        bits
    }

    // this is legal because I can replace it with just spamming set_bit
    #[inline(always)]
    pub fn from_bits_vec(bits: Vec<bool>) -> B32 {
        B32(bits
            .iter()
            .enumerate()
            .fold(0i32, |acc, (i, &bit)| acc | ((bit as i32) << i)))
    }
    #[inline(always)]
    pub fn from_bits(bits: &[bool; 32]) -> B32 {
        B32(bits
            .iter()
            .enumerate()
            .fold(0i32, |acc, (i, &bit)| acc | ((bit as i32) << i)))
    }

    pub fn from_bytes(bytes: [B8; 4]) -> B32 {
        let mut a = bytes[0].bits();
        a.reverse();
        let mut b = bytes[1].bits();
        b.reverse();
        let mut c = bytes[2].bits();
        c.reverse();
        let mut d = bytes[3].bits();
        d.reverse();

        B32::from_bits_vec([a, b, c, d].concat())
    }
}
