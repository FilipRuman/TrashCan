use log::info;

use crate::{
    MEMORY,
    chips::{b8::B8, b32::B32},
};
pub struct Serial {
    pub text: Vec<u8>,
}
/// writes 4 bytes of data into serial
impl Serial {
    pub fn call_serial(&mut self, data: B32) {
        for i in 0..4 {
            let value = data.byte(i);
            if value == B8(b'\n' as u8) {
                self.write_serial();
                continue;
            }
            self.text.push(value.0 as u8);
        }
    }
    fn write_serial(&mut self) {
        let string = String::from_utf8(self.text.clone()).expect(&format!(
            "text: {:?} send thru serial was not a valid utf-8!",
            self.text
        ));
        self.text.clear();
        info!("SERIAL: {string}");
    }
}
