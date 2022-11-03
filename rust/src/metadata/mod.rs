use self::types::{Event, Metadata};

use crate::utils::playback_state::PlaybackState;

pub mod mpris;
pub mod types;

/// Initialize a platform specific metadata handler.
pub fn init<C>(callback:C, dbus_name:String, display_name:String)
where
    C: Fn(Event) + Send + 'static
{   
    #[cfg(all(unix, not(target_os = "macos"), not(target_os = "android")))]
    {
        let mut metadata = mpris::HANDLER.write().unwrap();
        *metadata = Some(mpris::Mpris::new(dbus_name, display_name, callback));
    }
}


pub fn set_metadata(metadata:Metadata)
{
    #[cfg(all(unix, not(target_os = "macos"), not(target_os = "android")))]
    {
        let mpris = mpris::HANDLER.read().unwrap();
        mpris.as_ref().unwrap().set_metadata(metadata);
    }
}


pub fn set_playback_state(state:PlaybackState)
{
    #[cfg(all(unix, not(target_os = "macos"), not(target_os = "android")))]
    {
        let mpris = mpris::HANDLER.read().unwrap();
        mpris.as_ref().unwrap().set_playback_state(state);
    }
}