use std::ops::{Add, AddAssign};

use anyhow::anyhow;
use log::{debug, error, info};

use super::{b8::B8, b16::B16};

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
impl B16 {
    #[inline(always)]
    pub fn increment(self) -> B16 {
        self + B16(1)
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

impl AddAssign for B8 {
    fn add_assign(&mut self, rhs: Self) {
        *self = *self + rhs;
    }
}

impl AddAssign for B16 {
    fn add_assign(&mut self, rhs: Self) {
        *self = *self + rhs;
    }
}
impl Add for B16 {
    type Output = B16;

    fn add(self, rhs: Self) -> Self::Output {
        let (sum, carry) = self.sum(rhs, false);
        // if carry {
        //     error!("adding {} and {} overflowed the b16", self, rhs);
        // }
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

impl B16 {
    #[inline(always)]
    pub fn sum(self, b: B16, carry: bool) -> (B16, bool) {
        let mut carry = carry;
        let mut bits = [false; 16];
        for i in 0..16 {
            let output = sum_bit(self.bit(i), b.bit(i), carry);
            bits[i as usize] = output.sum;
            carry = output.carry;
        }
        (B16::from_bits(&bits), carry)
    }
}
