use std::ops::Mul;

use super::{b8::B8, b16::B16};

impl Mul for B16 {
    type Output = Self;

    fn mul(self, rhs: Self) -> Self::Output {
        let mut sum = Self(0);
        for i in 0..16 {
            let partial = Self(0).mux(rhs.shift_bits(i), self.bit(i as u8));

            sum += partial;
        }
        sum
    }
}

impl Mul for B8 {
    type Output = Self;

    fn mul(self, rhs: Self) -> Self::Output {
        let mut sum = Self(0);
        for i in 0..8 {
            let multiplied = Self(0).mux(rhs.shift_bits(i), rhs.bit(i as u8));

            sum += multiplied;
        }
        sum
    }
}
