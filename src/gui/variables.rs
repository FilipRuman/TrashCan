use anyhow::{Result, anyhow};
use log::*;
use std::{any::type_name, i8, ops::Deref, str};

use eframe::egui::{
    self, TextEdit,
    ahash::{HashMap, HashMapExt},
};

use crate::chips::{b8::B8, b32::B32};

use super::MyApp;

pub struct B32Variable {
    byte: i32,
    dec: String,
    bin: String,
}
impl B32Variable {
    /// updated bin and dec representations of this value
    pub fn set_byte_and_update(&mut self, val: i32) {
        self.byte = val;
        self.dec = val.to_string();
        self.bin = format!("{:08b}", val);
    }
}
pub struct B8Variable {
    byte: i8,
    dec: String,
    bin: String,
}
impl B8Variable {
    /// updated bin and dec representations of this value
    pub fn set_byte_and_update(&mut self, val: i8) {
        self.byte = val;
        self.dec = val.to_string();
        self.bin = format!("{:08b}", val);
    }
}

/// access to this doesn't have to be fast because it is only for testing!
pub struct VariableStore {
    pub bools: HashMap<String, bool>,
    pub b8: HashMap<String, B8Variable>, // byte, decimal text, binary text
    pub b32: HashMap<String, B32Variable>, // byte, decimal text, binary text
}

impl MyApp {
    pub(crate) fn setup_ui_for_variables(&mut self, ui: &mut egui::Ui) {
        for (name, val) in self.variables.bools.iter_mut() {
            ui.checkbox(val, name);
        }

        for (name, variable) in self.variables.b32.iter_mut() {
            let dec = &mut variable.dec;
            let bin = &mut variable.bin;
            let byte = &mut variable.byte;
            ui.horizontal(|ui| {
                let response_dec = ui.add(TextEdit::singleline(dec));
                if response_dec.changed() {
                    *byte = match i32::from_str_radix(dec as &str, 10) {
                        Ok(v) => {
                            *bin = format!("{:032b}", v);
                            v
                        }
                        Err(_) => {
                            warn!(
                                "value written into decimal input was not in correct format {bin}"
                            );

                            *byte
                        }
                    };
                }
                let response_bin = ui.add(TextEdit::singleline(bin));
                if response_bin.changed() {
                    *byte = match i32::from_str_radix(bin as &str, 2) {
                        Ok(v) => {
                            *dec = v.to_string();
                            v
                        }
                        Err(_) => {
                            warn!(
                                "value written into binary input was not in correct format {bin}"
                            );
                            *byte
                        }
                    };
                }

                ui.label(name);
            });
        }
        for (name, variable) in self.variables.b8.iter_mut() {
            let dec = &mut variable.dec;
            let bin = &mut variable.bin;
            let byte = &mut variable.byte;
            ui.horizontal(|ui| {
                let response_dec = ui.add(TextEdit::singleline(dec));
                if response_dec.changed() {
                    *byte = match i8::from_str_radix(dec as &str, 10) {
                        Ok(v) => {
                            *bin = format!("{:08b}", v);
                            v
                        }
                        Err(_) => {
                            warn!(
                                "value written into decimal input was not in correct format {bin}"
                            );

                            *byte
                        }
                    };
                }
                let response_bin = ui.add(TextEdit::singleline(bin));
                if response_bin.changed() {
                    *byte = match i8::from_str_radix(bin as &str, 2) {
                        Ok(v) => {
                            *dec = v.to_string();
                            v
                        }
                        Err(_) => {
                            warn!(
                                "value written into binary input was not in correct format {bin}"
                            );
                            *byte
                        }
                    };
                }

                ui.label(name);
            });
        }
    }
}
impl VariableStore {
    pub fn new() -> Self {
        VariableStore {
            bools: HashMap::new(),
            b8: HashMap::new(),

            b32: HashMap::new(),
        }
    }
}

pub trait Variable: Sized {
    /// inserts new data to HashMap containing specified variable type
    /// Err if key(name) already exists in that HashMap
    fn add(self, store: &mut VariableStore, name: &str) -> Result<()>;
    /// writes data to key in HashMap containing specified variable type
    /// Err if key(name) doesn't exists in that HashMap
    fn write(self, store: &mut VariableStore, name: &str) -> Result<()>;
    /// reads data from key in HashMap containing specified variable type
    /// Err if key(name) doesn't exists in that HashMap
    fn read(store: &VariableStore, name: &str) -> Result<Self>;
}
impl Variable for B32 {
    fn add(self, store: &mut VariableStore, name: &str) -> Result<()> {
        let hash_map = &mut store.b32;
        if hash_map.contains_key(name) {
            return Err(anyhow!(
                "variable with name: {} was already present {} hashmap",
                name,
                type_name::<Self>(),
            ));
        }
        hash_map.insert(
            name.to_string(),
            B32Variable {
                byte: self.into(),
                dec: self.to_string(),
                bin: format!("{:08b}", self.as_ref()),
            },
        );
        Ok(())
    }
    fn write(self, store: &mut VariableStore, name: &str) -> Result<()> {
        let hash_map = &mut store.b32;
        match hash_map.get_mut(name) {
            Some(input) => {
                input.set_byte_and_update(self.into());
                Ok(())
            }
            None => Err(anyhow!(
                "variable with name: {} was not found in {} hashmap",
                name,
                type_name::<Self>(),
            )),
        }
    }

    fn read(store: &VariableStore, name: &str) -> Result<Self> {
        let hash_map = &store.b32;
        match hash_map.get(name) {
            Some(val) => Ok(val.byte.into()),
            None => Err(anyhow!(
                "variable with name: {} was not found in {} hashmap",
                name,
                type_name::<Self>(),
            )),
        }
    }
}
impl Variable for B8 {
    fn add(self, store: &mut VariableStore, name: &str) -> Result<()> {
        let hash_map = &mut store.b8;
        if hash_map.contains_key(name) {
            return Err(anyhow!(
                "variable with name: {} was already present {} hashmap",
                name,
                type_name::<Self>(),
            ));
        }
        hash_map.insert(
            name.to_string(),
            B8Variable {
                byte: self.into(),
                dec: self.to_string(),
                bin: format!("{:08b}", self.as_ref()),
            },
        );
        Ok(())
    }
    fn write(self, store: &mut VariableStore, name: &str) -> Result<()> {
        let hash_map = &mut store.b8;
        match hash_map.get_mut(name) {
            Some(input) => {
                input.set_byte_and_update(self.into());
                Ok(())
            }
            None => Err(anyhow!(
                "variable with name: {} was not found in {} hashmap",
                name,
                type_name::<Self>(),
            )),
        }
    }

    fn read(store: &VariableStore, name: &str) -> Result<Self> {
        let hash_map = &store.b8;
        match hash_map.get(name) {
            Some(val) => Ok(val.byte.into()),
            None => Err(anyhow!(
                "variable with name: {} was not found in {} hashmap",
                name,
                type_name::<Self>(),
            )),
        }
    }
}
impl Variable for bool {
    fn add(self, store: &mut VariableStore, name: &str) -> Result<()> {
        let hash_map = &mut store.bools;
        if hash_map.contains_key(name) {
            return Err(anyhow!(
                "variable with name: {} was already present {} hashmap",
                name,
                type_name::<Self>(),
            ));
        }

        hash_map.insert(name.to_string(), self);
        Ok(())
    }
    fn write(self, store: &mut VariableStore, name: &str) -> Result<()> {
        let hash_map = &mut store.bools;
        match hash_map.get_mut(name) {
            Some(input) => Ok(*input = self),
            None => Err(anyhow!(
                "variable with name: {} was not found in {} hashmap",
                name,
                type_name::<Self>(),
            )),
        }
    }

    fn read(store: &VariableStore, name: &str) -> Result<Self> {
        let hash_map = &store.bools;
        match hash_map.get(name) {
            Some(val) => Ok(*val),
            None => Err(anyhow!(
                "variable with name: {} was not found in {} hashmap",
                name,
                type_name::<Self>(),
            )),
        }
    }
}

impl VariableStore {
    pub fn write<T: Variable>(&mut self, name: &str, val: T) -> Result<()> {
        val.write(self, name)
    }

    pub fn read<T: Variable>(&self, name: &str) -> Result<T> {
        T::read(self, name)
    }

    pub fn add<T: Variable>(&mut self, name: &str, val: T) -> Result<()> {
        val.add(self, name)
    }
}
