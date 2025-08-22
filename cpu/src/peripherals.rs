pub mod serial;

use std::sync::OnceLock;

use lazy_static::lazy_static;
use log::error;
use serial::Serial;
use tokio::sync::Mutex;

use crate::chips::b32::B32;

lazy_static! {
    static ref SERIAL: Mutex<Serial> = Mutex::new(Serial { text: Vec::new() });
}

pub async fn call_peripheral(peripheral_index: B32, data: B32) {
    match peripheral_index.0 as u32 {
        0 => {
            SERIAL.lock().await.call_serial(data);
        }
        index => {
            error!("peripheral with index: {index} was not mapped!");
        }
    };
}
