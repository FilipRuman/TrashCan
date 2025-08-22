use std::ops::{Add, AddAssign, Sub};

use anyhow::anyhow;
use log::{debug, error, info};

use super::{b8::B8, b32::B32};

pub struct SumBitOutput {
    pub sum: bool,
    pub carry: bool,
}

#[inline(always)]
pub fn sum_bit(a: bool, b: bool, carry: bool) -> SumBitOutput {
    SumBitOutput {
        sum: (a ^ b) ^ carry,
        carry: ((a ^ b) & carry) | (a & b),
    }
}

impl B8 {
    #[inline(always)]
    pub fn increment(self) -> B8 {
        self + B8(1)
    }
}
impl B32 {
    #[inline(always)]
    pub fn increment(self) -> B32 {
        self + B32(1)
    }
}

impl Add for B8 {
    type Output = B8;

    fn add(self, rhs: Self) -> Self::Output {
        let (sum, carry) = self.sum(rhs, false);
        // if carry {
        //     panic!("adding {} and {} overflowed the b8", self, rhs);
        // }
        sum
    }
}

impl AddAssign for B32 {
    fn add_assign(&mut self, rhs: Self) {
        *self = *self + rhs;
    }
}
impl AddAssign for B8 {
    fn add_assign(&mut self, rhs: Self) {
        *self = *self + rhs;
    }
}

impl Sub for B32 {
    type Output = B32;

    fn sub(self, rhs: Self) -> Self::Output {
        rhs.negate();
        let (sum, carry) = self.sum(rhs, false);

        sum
    }
}
impl Add for B32 {
    type Output = B32;

    fn add(self, rhs: Self) -> Self::Output {
        let (sum, carry) = self.sum(rhs, false);
        sum
    }
}

impl B8 {
    #[inline(always)]
    pub fn sum(self, b: B8, carry: bool) -> (B8, bool) {
        let mut carry = carry;
        let mut bits = [false; 8];
        for i in 0..8 {
            let output = sum_bit(self.bit(i), b.bit(i), carry);
            bits[i as usize] = output.sum;
            carry = output.carry;
        }
        (B8::from_bits(&bits), carry)
    }
}

impl B32 {
    #[inline(always)]
    #[cfg(feature = "fast")]
    pub fn sum(self, b: B32, carry: bool) -> (B32, bool) {
        (B32(self.0 + b.0 + carry as i32), false) //info carry only happens on overflows and then this will panic anyway
    }
    #[inline(always)]
    #[cfg(not(feature = "fast"))]
    pub fn sum(self, b: B32, carry: bool) -> (B32, bool) {
        let mut carry = carry;
        let mut bits = [false; 32];
        for i in 0..32 {
            let output = sum_bit(self.bit(i), b.bit(i), carry);
            bits[i as usize] = output.sum;
            carry = output.carry;
        }
        (B32::from_bits(&bits), carry)
    }
}
