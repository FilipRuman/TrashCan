pub mod serial;

use std::sync::{OnceLock, atomic::AtomicU32};

use anyhow::{Result, anyhow};
use lazy_static::lazy_static;
use log::{error, info};
use serial::Serial;
use tokio::sync::Mutex;

use crate::{chips::b32::B32, fb};

lazy_static! {
    static ref SERIAL: Mutex<Serial> = Mutex::new(Serial { text: Vec::new() });
}
static LAST_GPU_COMMAND_PART: AtomicU32 = AtomicU32::new(u32::MAX);

pub async fn call_peripheral(peripheral_index: B32, data: B32) -> Result<()> {
    info!(
        "call_peripheral {peripheral_index},data {} bits {:032b}",
        data.0, data.0
    );

    match peripheral_index.0 as u32 {
        0 => {
            SERIAL.lock().await.call_serial(data);
            Ok(())
        }
        1 => {
            let last = LAST_GPU_COMMAND_PART.load(std::sync::atomic::Ordering::Relaxed);
            if last == u32::MAX {
                LAST_GPU_COMMAND_PART.store(data.0, std::sync::atomic::Ordering::Relaxed);
            } else {
                fb::push_new_command(fb::Command {
                    color: data.0,
                    pos: last,
                })
                .await?;

                LAST_GPU_COMMAND_PART.store(u32::MAX, std::sync::atomic::Ordering::Relaxed);
            }
            Ok(())
        }
        250 => {
            // dummy
            Ok(())
        }

        251 => {
            // dummy
            Ok(())
        }

        252 => {
            // dummy
            Ok(())
        }
        253 => {
            // dummy
            Ok(())
        }
        254 => {
            // dummy
            Ok(())
        }
        255 => {
            // dummy
            Ok(())
        }

        index => Err(anyhow!("peripheral with index: {index} was not mapped!")),
    }
}
