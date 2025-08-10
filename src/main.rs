#![allow(warnings)]
use std::{
    sync::{OnceLock, atomic::AtomicBool},
    time::{Duration, Instant},
};

use chips::{
    b8::B8,
    b32::B32,
    bit::{mux_8, nand},
    memory::RAM::{ram8::RAM8, ram32k::RAM32k, ram256k::RAM256k, ram512::RAM512},
};

mod chips;
mod error;
pub mod gui;
use anyhow::{Context, Result};
use gui::MyApp;
use log::*;
use tokio::task;
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
    app.variables.add("out", B32(22))?;
    app.variables.add("addr", B32(0))?;
    // app.variables.add("in", B32(22))?;
    // app.variables.add("set", false)?;

    // app.variables.add("data", 55)?;
    // app.variables.add("out", 55)?;
    //
    // app.variables.add("a", 55)?;
    // app.variables.add("b", 55)?;
    // app.variables.add("out", 55)?;
    // app.variables.add("zero", false)?;
    // app.variables.add("carry", false)?;
    // app.variables.add("negative", false)?;

    info!("init memory");
    let start = Instant::now();
    MEMORY_TEST.get_or_init(|| Box::new(RAM256k::new()));
    let elapsed = start.elapsed();
    info!("initialized memory: {:?}", elapsed);

    tokio::task::spawn(clock_cycle());

    Ok(())
}

// INFO: this makes my code behave less like connected logic gates but makes use of language, more optimal
// operations
pub const OPTIMIZATIONS: bool = true;
pub static MEMORY_TEST: OnceLock<Box<RAM256k>> = OnceLock::new();
pub static CLOCK_MS: u64 = 1;

pub async fn clock_cycle() {
    loop {
        let memory = MEMORY_TEST
            .get()
            .expect("gui loop run before init function or memory was not yet initialized");

        let start_w1 = Instant::now();
        memory.write(B32(32), B32(0), true);
        let elapsed_w1 = start_w1.elapsed();
        info!("write 1 memory: {:?}", elapsed_w1);

        let start_r1 = Instant::now();
        memory.read(B32(0));
        let elapsed_r1 = start_r1.elapsed();
        info!("read 1 memory: {:?} {:?}", elapsed_r1, memory.read(B32(0)));

        let start_w = Instant::now();

        async_write().await;

        tokio::time::sleep(Duration::from_millis(CLOCK_MS)).await;

        tokio::time::sleep(Duration::from_millis(CLOCK_MS)).await;
        let elapsed_w = start_w.elapsed();
        info!("write memory: {:?}", elapsed_w);

        let start_r = Instant::now();
        for i in 0..256000 {
            let b16 = B32(i);
            assert_eq!(memory.read(b16), b16);
        }
        let elapsed_w = start_w.elapsed();
        info!("read memory: {:?}", elapsed_w);

        tokio::time::sleep(Duration::from_secs(800000000000000000)).await;
    }
}

pub fn gui_loop(app: &mut MyApp) -> Result<()> {
    let memory = MEMORY_TEST
        .get()
        .expect("gui loop run before init function or memory was not yet initialized");
    let out = memory.read(app.variables.read("addr")?);
    app.variables.write("out", out)?;
    Ok(())
}

pub async fn async_write() {
    let memory = MEMORY_TEST
        .get()
        .expect("gui loop run before init function or memory was not yet initialized");

    let chunk_size = 500; // how many addresses each task handles

    let mut handles = Vec::new();

    for start in (0..512) {
        let mem_clone = memory;

        let handle = task::spawn(async move {
            for i in start * chunk_size..start * chunk_size + chunk_size {
                let b16 = B32(i as i32);
                mem_clone.write(b16, b16, true);
            }
        });

        handles.push(handle);
    }

    // Wait for all tasks
    for h in handles {
        h.await.unwrap();
    }
}
