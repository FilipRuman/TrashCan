use super::b32::B32;

#[derive(Clone, Copy, Debug)]
pub struct AluOut {
    pub val: B32,
    pub zero: bool,

    pub negative: bool,
}
pub fn alu(
    mut x: B32,
    mut y: B32,
    zero_x: bool,
    negate_x: bool,
    zero_y: bool,
    negate_y: bool,
    and_mux_plus: bool,
    negate_output: bool,
) -> AluOut {
    x = x.mux(0.into(), zero_x);
    x = x.mux(!x, negate_x);
    y = y.mux(0.into(), zero_y);
    y = y.mux(!y, negate_y);

    let mut out = (x + y).mux(x & y, and_mux_plus);
    out = out.mux(!out, negate_output);

    AluOut {
        val: out,
        negative: out.negative(),
        zero: out.zero(),
    }
}
