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
    thread::{self, clock_cycle, instructions::Instruction},
};

pub mod chips;
mod error;
pub mod gui;
pub(crate) mod peripherals;
pub mod program_loader;

use anyhow::{Context, Ok, Result};
use clap::Parser;
use gui::MyApp;
use log::*;
use tokio::task;

pub const SHOW_INSTRUCTION_FETCHING_DEBUG: bool = false;
#[derive(clap::Parser)]
struct Args {
    /// Number of threads to use
    #[arg(short, long, default_value_t = 4)]
    threads: usize,
}

pub async fn main() -> Result<()> {
    if let Err(err) = init().await.context("encountered error while running CPU:") {
        error::handle_error(err);
    }

    if let Err(err) = gui::init_app_gui()
        .await
        .context("encountered error while running GUI:")
    {
        error::handle_error(err);
    };

    Ok(())
}

pub async fn init() -> Result<()> {
    let args = Args::parse();

    info!("init memory");
    let start = Instant::now();
    MEMORY.get_or_init(|| Box::new(RAM256k::new()));
    let elapsed = start.elapsed();
    info!("initialized memory: {:?}", elapsed);

    let start_addr = B32(0);
    load_memory_from_file("./programs/test.bin", start_addr).await?;

    thread::spawn_threads(args.threads);

    let thread = &thread::THREADS.get().unwrap()[0];

    tokio::spawn(clock_cycle(thread));
    tokio::spawn(thread.run_loop());
    Ok(())
}
pub async fn load_memory_from_file(path: &str, memory_load_base_addr: B32) -> Result<()> {
    let buf = tokio::fs::read(path).await.with_context(|| {
        format!("encountered error while opening a file to load it's contents to a memory: {path}")
    })?;

    // Make sure size is multiple of 4
    assert!(buf.len() % 4 == 0);

    for (i, chunk) in buf.chunks_exact(4).enumerate() {
        let b32 = B32(u32::from_le_bytes(chunk.try_into().unwrap()));

        MEMORY
            .get()
            .unwrap()
            .write(b32, B32(i as u32) + memory_load_base_addr, true);
    }

    info!("loaded file: '{path}' into memory!");

    Ok(())
}
pub fn test_load_memory(data: Vec<B32>) {
    for (addr, data) in data.iter().enumerate() {
        MEMORY.get().unwrap().write(*data, B32(addr as u32), true);
    }
}

pub static MEMORY: OnceLock<Box<RAM256k>> = OnceLock::new();

pub fn gui_loop(app: &mut MyApp) -> Result<()> {
    // let memory = MEMORY
    //     .get()
    //     .expect("gui loop run before init function or memory was not yet initialized");
    // let out = memory.read(app.variables.read("addr")?);
    // app.variables.write("out", out)?;
    Ok(())
}
