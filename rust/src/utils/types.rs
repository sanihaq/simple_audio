// This file is a part of simple_audio
// Copyright (c) 2022-2023 Erikas Taroza <erikastaroza@gmail.com>
//
// This program is free software: you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public License as
// published by the Free Software Foundation, either version 3 of
// the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of 
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License along with this program.
// If not, see <https://www.gnu.org/licenses/>.

pub enum PlaybackState
{
    Play = 0,
    Pause = 1,
    Done = 2
}

#[derive(Clone, Copy)]
pub struct ProgressState
{
    pub position: u64,
    pub duration: u64
}

pub enum Callback
{
    /// The media notification trigged the SkipPrev action.
    NotificationActionSkipPrev,
    /// The media notification trigged the SkipNext action.
    NotificationActionSkipNext,
    /// An error occurred when trying to fetch more bytes for
    /// a network stream.
    NetworkStreamError,
    /// An error occurred when decoding the file.
    DecodeError,
    /// The player is in the looping mode and the playback 
    /// just looped to the beginning.
    PlaybackLooped
}