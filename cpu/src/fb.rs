use anyhow::{Context, Error, Result};
use log::info;
use pixels::{Pixels, SurfaceTexture};
use std::sync::OnceLock;
use winit::dpi::LogicalSize;
use winit::event::{Event, WindowEvent};
use winit::event_loop::{ControlFlow, EventLoop};
use winit::keyboard::KeyCode;
use winit::window::{self, Window, WindowBuilder, WindowId};
use winit_input_helper::WinitInputHelper;

use tokio::sync::mpsc::{self, UnboundedReceiver, UnboundedSender};

use crate::chips::thread::InterruptKind::Keyboard;
use crate::chips::thread::THREADS;

#[derive(Clone, Copy, Debug)]
pub struct Command {
    pub color: u32,
    pub pos: u32,
}

pub async fn push_new_command(command: Command) -> Result<()> {
    COMMAND_SENDER.get().context("")?.send(command)?;
    //info!("push command-  {command:?}");
    Ok(())
}

// could be more efficient by giving one copy to all threads, TODO
static COMMAND_SENDER: OnceLock<UnboundedSender<Command>> = OnceLock::new();
const WINDOW_WIDTH: u32 = 300;
const WINDOW_HEIGHT: u32 = 100;

pub(crate) fn run() -> Result<()> {
    let event_loop = EventLoop::new().unwrap();
    let mut input = WinitInputHelper::new();

    let keyboard_interrupt_thread = 0;
    let window = {
        let size = LogicalSize::new(WINDOW_WIDTH as f64, WINDOW_HEIGHT as f64);
        let scaled_size = LogicalSize::new(WINDOW_WIDTH as f64 * 3.0, WINDOW_HEIGHT as f64 * 3.0);
        WindowBuilder::new()
            .with_title("Trash can os")
            .with_inner_size(scaled_size)
            .with_min_inner_size(size)
            .build(&event_loop)
            .unwrap()
    };

    let mut pixels = {
        let window_size = window.inner_size();
        let surface_texture = SurfaceTexture::new(window_size.width, window_size.height, &window);
        Pixels::new(WINDOW_WIDTH, WINDOW_HEIGHT, surface_texture)?
    };

    let mut draw_state: Option<bool> = None;

    let (sender, mut receiver) = mpsc::unbounded_channel::<Command>();
    COMMAND_SENDER.get_or_init(|| sender);

    let res = event_loop.run(|event, elwt| {
        event_loop_function(event, elwt, &mut pixels, &mut input, &window, &mut receiver)
    });
    res.context("frame_buffer")
}

fn event_loop_function(
    event: Event<()>,
    elwt: &winit::event_loop::EventLoopWindowTarget<()>,
    pixels: &mut Pixels<'_>,
    input: &mut WinitInputHelper,
    window: &Window,
    recever: &mut UnboundedReceiver<Command>,
) {
    // The one and only event that winit_input_helper doesn't have for us...
    if let Event::WindowEvent { event, .. } = &event {
        match event {
            WindowEvent::RedrawRequested => {
                pixels.render().context("render").unwrap();
            }
            WindowEvent::KeyboardInput {
                device_id,
                event,
                is_synthetic,
            } => {
                if event.state.is_pressed() {
                    let keycode = match event.physical_key {
                        winit::keyboard::PhysicalKey::Code(key_code) => key_code,
                        winit::keyboard::PhysicalKey::Unidentified(native_key_code) => {
                            KeyCode::Undo
                        }
                    };
                    THREADS.get().unwrap()[0].interrupt(crate::chips::thread::Interrupt {
                        kind: Keyboard,
                        data: keycode_to_u32(&keycode),
                    });
                }
            }
            _ => {}
        }
    }

    // For everything else, for let winit_input_helper collect events to build its state.
    // It returns `true` when it is time to update our game state and request a redraw.
    if input.update(&event) {
        // Close events

        //if input.key_pressed(KeyCode::KeyP) {
        //    paused = !paused;
        //}
        //if input.key_pressed_os(KeyCode::Space) {
        //    // Space is frame-step, so ensure we're paused
        //    paused = true;
        //}
        //if input.key_pressed(KeyCode::KeyR) {
        //    life.randomize();
        //}
        // Handle mouse. This is a bit involved since support some simple
        // line drawing (mostly because it makes nice looking patterns).
        //
        //

        let frame = pixels.frame_mut();

        while let Ok(command) = recever.try_recv() {
            let color = command.color;
            let pos = command.pos as usize;

            frame[pos..pos + 4].copy_from_slice(&color.to_le_bytes()[0..4]);
        }

        // Resize the window
        if let Some(size) = input.window_resized() {
            pixels
                .resize_surface(size.width, size.height)
                .context("resize")
                .unwrap()
        }

        window.request_redraw();
    }
}
fn keycode_to_u32(keycode: &KeyCode) -> u32 {
    match keycode {
        // Number row (top)
        KeyCode::Digit1 => 0x02,
        KeyCode::Digit2 => 0x03,
        KeyCode::Digit3 => 0x04,
        KeyCode::Digit4 => 0x05,
        KeyCode::Digit5 => 0x06,
        KeyCode::Digit6 => 0x07,
        KeyCode::Digit7 => 0x08,
        KeyCode::Digit8 => 0x09,
        KeyCode::Digit9 => 0x0A,
        KeyCode::Digit0 => 0x0B,
        KeyCode::Minus => 0x0C,
        KeyCode::Equal => 0x0D,
        KeyCode::Backspace => 0x0E,

        // Top row (QWERTY)
        KeyCode::Tab => 0x0F,
        KeyCode::KeyQ => 0x10,
        KeyCode::KeyW => 0x11,
        KeyCode::KeyE => 0x12,
        KeyCode::KeyR => 0x13,
        KeyCode::KeyT => 0x14,
        KeyCode::KeyY => 0x15,
        KeyCode::KeyU => 0x16,
        KeyCode::KeyI => 0x17,
        KeyCode::KeyO => 0x18,
        KeyCode::KeyP => 0x19,
        KeyCode::BracketLeft => 0x1A,
        KeyCode::BracketRight => 0x1B,
        KeyCode::Enter => 0x1C,

        // Home row (ASDF)
        KeyCode::ControlLeft => 0x1D,
        KeyCode::KeyA => 0x1E,
        KeyCode::KeyS => 0x1F,
        KeyCode::KeyD => 0x20,
        KeyCode::KeyF => 0x21,
        KeyCode::KeyG => 0x22,
        KeyCode::KeyH => 0x23,
        KeyCode::KeyJ => 0x24,
        KeyCode::KeyK => 0x25,
        KeyCode::KeyL => 0x26,
        KeyCode::Semicolon => 0x27,
        KeyCode::Quote => 0x28,
        KeyCode::Backquote => 0x29,

        // Bottom row (ZXCV)
        KeyCode::ShiftLeft => 0x2A,
        KeyCode::Backslash => 0x2B,
        KeyCode::KeyZ => 0x2C,
        KeyCode::KeyX => 0x2D,
        KeyCode::KeyC => 0x2E,
        KeyCode::KeyV => 0x2F,
        KeyCode::KeyB => 0x30,
        KeyCode::KeyN => 0x31,
        KeyCode::KeyM => 0x32,
        KeyCode::Comma => 0x33,
        KeyCode::Period => 0x34,
        KeyCode::Slash => 0x35,
        KeyCode::ShiftRight => 0x36,

        // Bottom modifiers / space
        KeyCode::AltLeft => 0x38,
        KeyCode::Space => 0x39,
        KeyCode::CapsLock => 0x3A,

        // Function keys
        KeyCode::F1 => 0x3B,
        KeyCode::F2 => 0x3C,
        KeyCode::F3 => 0x3D,
        KeyCode::F4 => 0x3E,
        KeyCode::F5 => 0x3F,
        KeyCode::F6 => 0x40,
        KeyCode::F7 => 0x41,
        KeyCode::F8 => 0x42,
        KeyCode::F9 => 0x43,
        KeyCode::F10 => 0x44,

        // Some extras (optional)
        KeyCode::Escape => 0x01,
        KeyCode::ControlRight => 0x1D, // Extended in real PS/2 (0xE0 0x1D)
        KeyCode::AltRight => 0x38,     // Extended in real PS/2 (0xE0 0x38)

        // Unmapped / unhandled
        _ => 0x00,
    }
}
