use std::{thread::sleep, time::Duration};

use anyhow::{Context, Ok, Result};
use log::{error, trace};

const OS_ASM_FILE_ADDR: &str = "./programs/os/compiled/trash_can_os.asm";
const OS_BIN_FILE_ADDR: &str = "./programs/os/compiled/trash_can_os.bin";
const OS_MAIN_CODE_FILE: &str = "trash_can_os.tip";
const OS_INPUT_CODE_FILES_BASE_ADDRESS: &str = "./programs/os/code/";

const COMMAND_LINE_ASM_FILE_ADDR: &str = "./programs/command_line/compiled/command_line.asm";
const COMMAND_LINE_BIN_FILE_ADDR: &str = "./programs/command_line/compiled/command_line.bin";
const COMMAND_LINE_MAIN_CODE_FILE: &str = "command_line.tip";
const COMMAND_LINE_INPUT_CODE_FILES_BASE_ADDRESS: &str = "./programs/command_line/code/";

#[tokio::main]
pub async fn main() -> Result<()> {
    colog::init();
    trace!("init log");

    compile_and_assemble_file(
        OS_MAIN_CODE_FILE,
        OS_ASM_FILE_ADDR,
        OS_BIN_FILE_ADDR,
        OS_INPUT_CODE_FILES_BASE_ADDRESS,
    )
    .await?;
    compile_and_assemble_file(
        COMMAND_LINE_MAIN_CODE_FILE,
        COMMAND_LINE_ASM_FILE_ADDR,
        COMMAND_LINE_BIN_FILE_ADDR,
        COMMAND_LINE_INPUT_CODE_FILES_BASE_ADDRESS,
    )
    .await?;

    cpu::main(OS_BIN_FILE_ADDR, COMMAND_LINE_BIN_FILE_ADDR).await?;

    loop {
        sleep(Duration::from_secs(100000));
    }
}

/// the base address is used so you don't have to specify full address of file to include in
/// code.
pub async fn compile_and_assemble_file(
    code_file: &str,
    asm_file: &str,
    bin_file: &str,
    base_addr: &str,
) -> Result<()> {
    if let Err(err) = compiler::compile(code_file, asm_file, base_addr.to_string())
        .await
        .context("compiler encountered error:")
    {
        handle_error(err);
    }

    if let Err(err) = assembler::assemble_file(asm_file, bin_file)
        .await
        .context("assembler encountered error:")
    {
        handle_error(err);
    }
    Ok(())
}

pub fn handle_error(err: anyhow::Error) {
    // all errors will land here.
    // this will just display them nicely.
    // you might ask why, this is overkill.
    // I agree, but I don't care
    error!("{err:?}");
    panic!()
}
