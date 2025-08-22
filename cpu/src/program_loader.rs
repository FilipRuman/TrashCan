use crate::{
    MEMORY,
    chips::{b8::B8, b32::B32, memory},
};

use anyhow::Result;
pub async fn load_program_into_memory_from_file(path: &str, load_base_addr: B32) -> Result<()> {
    let memory = MEMORY
        .get()
        .expect("you need to initialize memory before loading programs into it!");

    let file_contents_u8 = tokio::fs::read(path).await?;

    // iterate thru all 32 byte segments
    for i in 0..file_contents_u8.len() / 4 {
        let b32_data = B32::from_bytes([
            B8(file_contents_u8[i] as i8),
            B8(file_contents_u8[i + 1] as i8),
            B8(file_contents_u8[i + 2] as i8),
            B8(file_contents_u8[i + 3] as i8),
        ]);

        memory.write(b32_data, B32(i as i32) + load_base_addr, true);
    }

    Ok(())
}
