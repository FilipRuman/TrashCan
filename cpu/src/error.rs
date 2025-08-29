use log::error;

pub fn handle_error(err: anyhow::Error) {
    // all errors will land here.
    // this will just display them nicely.
    // you might ask why, this is overkill.
    // I agree, but I don't care
    error!("{err:?}");
    panic!()
}

use anyhow::{Context, Result as AnyhowResult};
