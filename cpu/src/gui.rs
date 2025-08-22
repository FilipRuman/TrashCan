pub mod variables;
use std::{cell::OnceCell, sync::OnceLock};

use anyhow::{Result, format_err};
use lazy_static::lazy_static;
use log::*;

pub fn init_app_gui() -> Result<()> {
    let options = eframe::NativeOptions {
        viewport: egui::ViewportBuilder::default().with_inner_size([320.0, 240.0]),
        ..Default::default()
    };
    let mut app = MyApp {
        variables: VariableStore::new(),
    };
    crate::init(&mut app)?;

    eframe::run_native(
        "My egui App",
        options,
        Box::new(|cc| Ok(Box::<MyApp>::new(app))),
    )
    .map_err(|err| format_err!("{}", err))?;

    Ok(())
}

use eframe::{App, Frame, egui};
use variables::VariableStore;

pub struct MyApp {
    pub variables: variables::VariableStore,
}

impl App for MyApp {
    fn update(&mut self, ctx: &egui::Context, _frame: &mut Frame) {
        egui::Window::new("Control Panel")
            .min_width(400.0)
            .show(ctx, |ui| {
                self.setup_ui_for_variables(ui);
            });
        if let Err(err) = crate::gui_loop(self) {
            crate::error::handle_error(err);
        }
    }
}
