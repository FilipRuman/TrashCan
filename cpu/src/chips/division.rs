use std::ops::{Div, Rem};

use super::b32::B32;
// TODO: IMPLEMENT: with own units when implemented u64 + use registers
//
/// Unsigned 32-bit division using the restoring (shift-subtract) algorithm.
/// Returns None for division-by-zero, otherwise Some((quotient, remainder)).

pub fn div_mod_restoring(dividend: i32, divisor: i32) -> (i32, i32) {
    if divisor == 0 {
        panic!("tried dividing by 0!");
    }

    // rem holds 64 bits: upper 32 are the running remainder, lower 32 hold (and shift in) dividend bits.
    let mut reminder: i64 = dividend as i64;
    let mut quotient: i32 = 0;

    // Do 32 iterations: on each iteration shift left by 1, then try subtracting divisor from upper 32 bits.
    for _ in 0..32 {
        reminder <<= 1; // shift left; the next dividend bit (from lower half) moves into upper half
        let upper = (reminder >> 32) as i32;

        if upper >= divisor {
            // subtract divisor from upper half and set the LSB of quotient to 1
            let new_upper = upper - divisor;
            // place new_upper back into the upper 32 bits of rem, keep lower 32 bits as-is
            reminder = ((new_upper as i64) << 32) | (reminder & 0xFFFF_FFFF);
            quotient = (quotient << 1) | 1;
        } else {
            // cannot subtract -> quotient bit = 0
            quotient <<= 1;
        }
    }

    let remainder = (reminder >> 32) as i32;
    (quotient, remainder)
}

impl Div for B32 {
    type Output = Self;

    fn div(self, rhs: Self) -> Self::Output {
        let result = div_mod_restoring(self.0, rhs.0);
        B32(result.0)
    }
}
impl Rem for B32 {
    type Output = Self;

    fn rem(self, rhs: Self) -> Self::Output {
        let result = div_mod_restoring(self.0, rhs.0);
        B32(result.1)
    }
}
