use anyhow::Result;
use log::trace;

#[tokio::main]
pub async fn main() -> Result<()> {
    colog::init();
    trace!("init log");

    assembler::main();
    cpu::main().await?;
    Ok(())
}
