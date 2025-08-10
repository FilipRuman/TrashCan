use std::{
    fmt::Display,
    ops::{Add, BitAnd, BitXor, Not},
};

use log::debug;

use crate::OPTIMIZATIONS;

use super::bit::{d_mux, mux, mux_3x3, mux_8};

#[derive(Clone, Copy, Debug)]
pub struct B32(pub i32);
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
    fn bitand(self, rhs: Self) -> Self::Output {
        if OPTIMIZATIONS {
            return self & rhs;
        }
        Self::from_fn(|i| self.bit(i) & rhs.bit(i))
    }
}
impl PartialEq for B32 {
    fn eq(&self, other: &Self) -> bool {
        if OPTIMIZATIONS {
            return self.0 == other.0;
        }
        let mut temp = true;
        for i in 0..16 {
            temp = temp & (self.bit(i) == other.bit(i));
        }
        temp
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
    pub fn negate(mut self) {
        self.set_bit(31, !self.bit(7));
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
    pub fn mux_fn<A: Fn() -> B32, B: Fn() -> B32>(a: A, b: B, sel: bool) -> B32 {
        if OPTIMIZATIONS {
            if sel {
                return a();
            }
            return b();
        }

        a().mux(b(), sel)
    }

    #[inline(always)]
    pub fn mux3x3_fn<A: Fn() -> B32, B: Fn() -> B32, C: Fn() -> B32>(
        a: A,
        b: B,
        c: C,
        sel_1: bool,
        sel_2: bool,
        sel_3: bool,
    ) -> B32 {
        if OPTIMIZATIONS {
            return if sel_1 {
                a()
            } else if sel_2 {
                b()
            } else if sel_3 {
                c()
            } else {
                B32(0)
            };
        }

        B32::from_fn(|i| mux_3x3(a().bit(i), b().bit(i), c().bit(i), sel_1, sel_2, sel_3))
    }

    #[inline(always)]
    fn mux3x3(self, b: B32, c: B32, sel_1: bool, sel_2: bool, sel_3: bool) -> B32 {
        B32::from_fn(|i| mux_3x3(self.bit(i), b.bit(i), c.bit(i), sel_1, sel_2, sel_3))
    }
    #[inline(always)]

    /// Works like mux sle=true-> b instead of self
    /// true left false right
    pub fn mux8_fn_in<
        A: Fn(B32) -> B32,
        B: Fn(B32) -> B32,
        C: Fn(B32) -> B32,
        D: Fn(B32) -> B32,
        F: Fn(B32) -> B32,
        E: Fn(B32) -> B32,
        G: Fn(B32) -> B32,
        H: Fn(B32) -> B32,
    >(
        self,
        a: A,
        b: B,
        c: C,
        d: D,
        e: E,
        f: F,
        g: G,
        h: H,
        sel_1: bool,
        sel_2: bool,
        sel_3: bool,
    ) -> B32 {
        if OPTIMIZATIONS {
            return match (sel_1, sel_2, sel_3) {
                (true, true, true) => a(self),
                (true, true, false) => b(self),
                (true, false, true) => c(self),
                (true, false, false) => d(self),
                (false, true, true) => e(self),
                (false, true, false) => f(self),
                (false, false, true) => g(self),
                (false, false, false) => h(self),
            };
        }

        let aval = a(self);
        let bval = b(self);
        let cval = c(self);
        let dval = d(self);
        let eval = e(self);
        let fval = f(self);
        let gval = g(self);
        let hval = h(self);
        B32::from_fn(|i| {
            mux_8(
                aval.bit(i),
                bval.bit(i),
                cval.bit(i),
                dval.bit(i),
                eval.bit(i),
                fval.bit(i),
                gval.bit(i),
                hval.bit(i),
                sel_1,
                sel_2,
                sel_3,
            )
        })
    }

    /// Works like mux sle=true-> b instead of self
    /// true left false right
    pub fn mux8_fn<
        A: Fn() -> B32,
        B: Fn() -> B32,
        C: Fn() -> B32,
        D: Fn() -> B32,
        F: Fn() -> B32,
        E: Fn() -> B32,
        G: Fn() -> B32,
        H: Fn() -> B32,
    >(
        a: A,
        b: B,
        c: C,
        d: D,
        e: E,
        f: F,
        g: G,
        h: H,
        sel_1: bool,
        sel_2: bool,
        sel_3: bool,
    ) -> B32 {
        if OPTIMIZATIONS {
            return match (sel_1, sel_2, sel_3) {
                (true, true, true) => a(),
                (true, true, false) => b(),
                (true, false, true) => c(),
                (true, false, false) => d(),
                (false, true, true) => e(),
                (false, true, false) => f(),
                (false, false, true) => g(),
                (false, false, false) => {
                    debug!("0 MUX");
                    h()
                }
            };
        }

        let aval = a();
        let bval = b();
        let cval = c();
        let dval = d();
        let eval = e();
        let fval = f();
        let gval = g();
        let hval = h();
        B32::from_fn(|i| {
            mux_8(
                aval.bit(i),
                bval.bit(i),
                cval.bit(i),
                dval.bit(i),
                eval.bit(i),
                fval.bit(i),
                gval.bit(i),
                hval.bit(i),
                sel_1,
                sel_2,
                sel_3,
            )
        })
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
    pub fn d_mux8_fn<
        A: Fn(B32),
        B: Fn(B32),
        C: Fn(B32),
        D: Fn(B32),
        F: Fn(B32),
        E: Fn(B32),
        G: Fn(B32),
        H: Fn(B32),
    >(
        self,
        sel_1: bool,
        sel_2: bool,
        sel_3: bool,
        a: A,
        b: B,
        c: C,
        d: D,
        e: E,
        f: F,
        g: G,
        h: H,
    ) {
        if OPTIMIZATIONS {
            match (sel_1, sel_2, sel_3) {
                (true, true, true) => a(self),
                (true, true, false) => b(self),
                (true, false, true) => c(self),
                (true, false, false) => d(self),
                (false, true, true) => e(self),
                (false, true, false) => f(self),
                (false, false, true) => g(self),
                (false, false, false) => {
                    debug!("0 DMUX");
                    h(self)
                }
            };

            return;
        }
        // let mut out = [[false; 8]; 32];
        // for i in 0..32 {
        //     out[i] = d_mux8(self.bit(i as u8), sel_1, sel_2, sel_3)
        // }
        //
        // for i in 0..8 {
        //     functions[i](B32::from_fn(|y| out[y as usize][i]));
        // }
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

    // this is legal because I can replace it with just spamming set_bit
    #[inline(always)]
    pub fn from_bits(bits: &[bool; 32]) -> B32 {
        B32(bits
            .iter()
            .enumerate()
            .fold(0i32, |acc, (i, &bit)| acc | ((bit as i32) << i)))
    }
}
