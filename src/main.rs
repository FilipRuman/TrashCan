use std::{
    sync::{OnceLock, atomic::AtomicBool},
    time::Duration,
};

use chips::{b8::B8, b16::B16, bit::nand, dLatch::B8Memory};

mod chips;
mod error;
pub mod gui;
use anyhow::{Context, Result};
use gui::MyApp;
use log::*;
#[tokio::main]
async fn main() -> Result<()> {
    colog::init();

    trace!("init log");

    if let Err(err) = gui::init_app_gui() {
        error::handle_error(err);
    };

    Ok(())
}
pub fn init(app: &mut MyApp) -> Result<()> {
    app.variables.add("x", B16(22))?;
    app.variables.add("y", B16(22))?;

    app.variables.add("out", B16(22))?;
    // app.variables.add("data", 55)?;
    // app.variables.add("out", 55)?;
    //
    // app.variables.add("a", 55)?;
    // app.variables.add("b", 55)?;
    // app.variables.add("out", 55)?;
    // app.variables.add("zero", false)?;
    // app.variables.add("carry", false)?;
    // app.variables.add("negative", false)?;

    MEMORY_TEST.get_or_init(B8Memory::new);
    tokio::task::spawn(clock_cycle());

    Ok(())
}

pub static MEMORY_TEST: OnceLock<B8Memory> = OnceLock::new();

pub static CLOCK_MS: u64 = 1;

pub async fn clock_cycle() {
    loop {
        tokio::time::sleep(Duration::from_millis(CLOCK_MS)).await;
    }
}

pub fn gui_loop(app: &mut MyApp) -> Result<()> {
    // let out = alu(
    // false,
    // );

    let memory = MEMORY_TEST
        .get()
        .expect("gui loop run before init function or memory was not yet initialized");

    // memory.run(
    //     app.variables.read("store").ctx()?,
    //     app.variables.read::<i8>("data").ctx()?.into(),
    // );
    // //

    app.variables.write(
        "out",
        app.variables.read::<B16>("x")? * app.variables.read("y")?,
    )?;

    // let out = alu(
    //     app.variables.read("x")?,
    //     app.variables.read("y")?,
    //     app.variables.read("zero_x")?,
    //     app.variables.read("negate_x")?,
    //     app.variables.read("zero_y")?,
    //     app.variables.read("negate_y")?,
    //     app.variables.read("plus_mux_and")?,
    //     app.variables.read("negate_output")?,
    // );
    //
    //
    // app.variables.write("out_val", out.val)?;
    // app.variables.write("out_zero", out.zero)?;
    // app.variables.write("out_negative", out.negative)?;
    //
    Ok(())
}
