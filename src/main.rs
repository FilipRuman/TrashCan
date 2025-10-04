use std::{thread::sleep, time::Duration};

use anyhow::{Context, Result};
use log::{error, trace};

const ASM_FILE_ADDR: &str = "./programs/compiled/trash_can_os.asm";
const BIN_FILE_ADDR: &str = "./programs/compiled/trash_can_os.bin";

const MAIN_CODE_FILE: &str = "trash_can_os.tip";
const INPUT_CODE_FILES_BASE_ADDRESS: &str = "./programs/code/";
#[tokio::main]
pub async fn main() -> Result<()> {
    colog::init();
    trace!("init log");

    if let Err(err) = compiler::compile(
        MAIN_CODE_FILE,
        ASM_FILE_ADDR,
        INPUT_CODE_FILES_BASE_ADDRESS.to_string(),
    )
    .await
    .context("compiler encountered error:")
    {
        handle_error(err);
    }

    if let Err(err) = assembler::assemble_file(ASM_FILE_ADDR, BIN_FILE_ADDR, 0)
        .await
        .context("assembler encountered error:")
    {
        handle_error(err);
    }

    cpu::main(BIN_FILE_ADDR).await?;
    loop {
        sleep(Duration::from_secs(100000));
    }
}

pub fn handle_error(err: anyhow::Error) {
    // all errors will land here.
    // this will just display them nicely.
    // you might ask why, this is overkill.
    // I agree, but I don't care
    error!("{err:?}");
    panic!()
}
