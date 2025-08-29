use anyhow::{Context, Result};
use log::{error, trace};

#[tokio::main]
pub async fn main() -> Result<()> {
    colog::init();
    trace!("init log");

    if let Err(err) = compiler::compile("./programs/test.tl", "./programs/test.asm")
        .await
        .context("compiler encountered error:")
    {
        handle_error(err);
    }

    if let Err(err) = assembler::assemble_file("./programs/test.asm", "./programs/test.bin", 0)
        .await
        .context("assembler encountered error:")
    {
        handle_error(err);
    }

    cpu::main().await?;
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
