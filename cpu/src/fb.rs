use std::{thread::sleep, time::Duration};

use anyhow::{Context, Ok, Result};
use crossbeam_queue::ArrayQueue;
use lazy_static::lazy_static;
use log::info;
use minifb::{KeyRepeat, Window};

use crate::chips::thread::{Interrupt, InterruptKind, THREADS};

fn from_u8_rgb(r: u8, g: u8, b: u8) -> u32 {
    let (r, g, b) = (r as u32, g as u32, b as u32);
    (r << 16) | (g << 8) | b
}

struct Command {
    color: u32,
    pos: u32,
}

pub fn push_new_command(command: Command) {
    COMMAND_QUE.push(command);
}

lazy_static! {
    static ref COMMAND_QUE: ArrayQueue<Command> = ArrayQueue::new(500);
}

pub async fn run_frame_buffer() -> Result<()> {
    let keyboard_interrupt_thread = 0;
    const WINDOW_WIDTH: usize = 1280;
    const WINDOW_HEIGHT: usize = 720;

    let mut buffer = vec![from_u8_rgb(255, 255, 0); WINDOW_WIDTH * WINDOW_HEIGHT];
    let mut window = Window::new(
        "TrashCan OS Frame Buffer.",
        WINDOW_WIDTH,
        WINDOW_HEIGHT,
        minifb::WindowOptions::default(),
    )
    .context("window init")?;

    loop {
        let command_option = COMMAND_QUE.pop();
        for key in window.get_keys_pressed(KeyRepeat::No) {
            let thread = &THREADS.get().unwrap()[keyboard_interrupt_thread];
            thread.interrupt(Interrupt {
                kind: InterruptKind::Keyboard,
                data: key as u32,
            });
        }
        if let Some(command) = command_option {
            buffer[command.pos as usize] = command.color;
        }

        window
            .update_with_buffer(&buffer, WINDOW_WIDTH, WINDOW_HEIGHT)
            .context("fb update")?;
    }

    Ok(())
}
