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

export 'types.dart' hide progressStateFromInner, metadataFromInner;
import 'types.dart' as types;
import 'types.dart' hide ProgressState, Metadata;

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import './ffi.dart' hide PlaybackState;

late final Player _player;

class SimpleAudio
{
    /// Non-null if the app is running on Android, iOS, or macOS.
    static final MethodChannel? _methodChannel =
        Platform.isAndroid || Platform.isIOS || Platform.isMacOS ? const MethodChannel("simple_audio")
        : null;

    // Maybe subscribe to this stream for native media notifications.
    /// A stream that returns a [PlaybackState] when the state of the player is changed.
    late Stream<PlaybackState> playbackStateStream = Player.playbackStateStream(bridge: api)
        // Map the int event to a dart enum.
        .map((event) => PlaybackState.values[event.index])
        .asBroadcastStream();

    /// A stream that returns a [ProgressState] when the progress of the player
    /// or duration of the file is changed.
    late Stream<types.ProgressState> progressStateStream = Player.progressStateStream(bridge: api)
        // Convert the inner ProgressState to the public ProgressState (public provides docs)
        .map((event) => types.progressStateFromInner(event))
        .asBroadcastStream();

    /// Returns `true` if the player is playing.
    Future<bool> get isPlaying => _player.isPlaying();
    Future<ProgressState> get _progress => _player.getProgress();

    /// The callback for when the [NotificationActions.skipPrev] action is called.
    void Function(SimpleAudio player)? onSkipPrevious;
    /// The callback for when the [NotificationActions.skipNext] action is called.
    void Function(SimpleAudio player)? onSkipNext;

    /// The callback for when an error occurs when trying to fetch
    /// more bytes for a network stream.
    void Function(SimpleAudio player)? onNetworkStreamError;
    /// The callback for when an error occurs during the decode loop.
    void Function(SimpleAudio player)? onDecodeError;

    /// Each callback has a reference to the instantiated `SimpleAudio` object
    /// if you need to access its members to implement the callbacks.
    /// 
    /// **[onSkipPrevious]** The callback for when the [NotificationActions.skipPrev] action is called.
    /// 
    /// **[onSkipNext]** The callback for when the [NotificationActions.skipNext] action is called.
    /// 
    /// **[onNetworkStreamError]** The callback for when an error occurs when trying to fetch
    /// more bytes for a network stream.
    /// 
    /// **[onDecodeError]** The callback for when an error occurs during the decode loop.
    SimpleAudio({
        this.onSkipPrevious,
        this.onSkipNext,
        this.onNetworkStreamError,
        this.onDecodeError
    })
    {
        Player.callbackStream(bridge: api).listen((event) {
            switch(event)
            {
                case Callback.NotificationActionSkipPrev:
                    onSkipPrevious?.call(this);
                    break;
                case Callback.NotificationActionSkipNext:
                    onSkipNext?.call(this);
                    break;
                case Callback.NetworkStreamError:
                    onNetworkStreamError?.call(this);
                    break;
                case Callback.DecodeError:
                    onDecodeError?.call(this);
                    break;
                // This isn't a callback for the user to handle.
                // Instead, it is used to communicate via MethodChannel
                // with Dart being the middleman.
                case Callback.PlaybackLooped:
                    _methodChannel?.invokeMethod("setPlaybackState", {
                        "state": PlaybackState.play.index,
                        "position": 0
                    });
                    break;
            }
        });
        
        _methodChannel?.setMethodCallHandler((call) async {
            switch(call.method)
            {
                case "play":
                    play();
                    break;
                case "pause":
                    pause();
                    break;
                case "stop":
                    stop();
                    break;
                case "next":
                    onSkipNext?.call(this);
                    break;
                case "previous":
                    onSkipPrevious?.call(this);
                    break;
                case "seekRelative":
                    int position = (await _progress).position;
                    int seekTo = call.arguments as bool ?
                        position + 10
                        : (position - 10).clamp(0, double.maxFinite).toInt();

                    seek(seekTo);
                    break;
                case "seek":
                    seek(call.arguments);
                    break;
                case "isPlaying":
                    return await isPlaying;
            }
        });
    }

    /// Initialize [SimpleAudio]. This should only be done once in the `main` method.
    /// 
    /// **[showMediaNotification]** Whether or not to show the media notification when playing
    /// audio.
    /// 
    /// **[shouldNormalizeVolume]** Whether or not to normalize the volume
    /// of the playback. You can also change this by calling [normalizeVolume]
    /// when you desire. The normalization uses the `EbuR128` standard and
    /// it normalizes to `-15 LUFS`.
    /// 
    /// **[dbusName]** The bus name of the MPRIS metadata handler.
    /// The format is in reverse-DNS style.
    /// The name has to follow these requirements: https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names
    /// 
    /// If the D-Bus name is `com.erikas.SimpleAudio`, then `com.erikas` is your domain
    /// and `SimpleAudio` is your app name.
    /// 
    /// MPRIS is a D-Bus interface for controlling media players. See: https://wiki.archlinux.org/title/MPRIS
    /// 
    /// **[actions]** A list of actions that the media notification will use.
    /// If [showMediaNotification] is false, this value does not matter. Otherwise, you will
    /// need to include [NotificationActions.playPause] in the list.
    /// 
    /// **[androidNotificationIconPath]** A path that points to the icon the Android media
    /// notification will use. This icon should be stored in `./android/app/src/main/res/mipmap-xxx`.
    /// You will want to create images that are sized accordingly to the pixel density.
    /// The icon should also be monochrome so that it renders properly. To ensure that this
    /// icon is bundled properly, see https://developer.android.com/studio/build/shrink-code#keep-resources
    /// 
    /// To create an icon, see: https://developer.android.com/studio/write/image-asset-studio#create-adaptive
    /// 
    /// **[androidCompactPlaybackActions]** A list of numbers that represent the buttons
    /// to show in the compact media notification. The indicies match with the ones
    /// in [actions].
    /// 
    /// For example, to use the middle 3:
    /// 
    /// androidPlaybackActions = [Rewind, SkipPrev, PlayPause, SkipNext, FastForward]
    /// 
    /// androidCompactPlaybackActions = [1, 2, 3]
    /// 
    /// **[applePreferSkipButtons]** For the macOS and iOS media notifications. If set to true,
    /// the notification will show [NotificationActions.skipPrev] and [NotificationActions.skipNext]
    /// instead of [NotificationActions.rewind] and [NotificationActions.fastForward]
    /// when all 4 values are provided in [actions].
    static Future<void> init({
        bool showMediaNotification = true,
        bool shouldNormalizeVolume = false,
        String dbusName = "com.erikas.SimpleAudio",
        List<NotificationActions> actions = NotificationActions.values,
        String androidNotificationIconPath = "mipmap/ic_launcher",
        List<int> androidCompactPlaybackActions = const [1, 2, 3],
        bool applePreferSkipButtons = true
    }) async
    {
        // You must include this action.
        if(showMediaNotification) assert(actions.contains(NotificationActions.playPause));

        _player = await Player.newPlayer(
            bridge: api,
            actions: showMediaNotification ?
                Int32List.fromList(actions.map((e) => e.index).toList())
                : Int32List(0),
            dbusName: dbusName,
            hwnd: Platform.isWindows ? getHWND() : null
        );

        _player.normalizeVolume(shouldNormalize: shouldNormalizeVolume);

        if(Platform.isAndroid)
        {
            _methodChannel?.invokeMethod("init", {
                "showMediaNotification": showMediaNotification,
                "actions": actions.map((e) => e.index).toList(),
                "compactActions": androidCompactPlaybackActions,
                "icon": androidNotificationIconPath
            });
        }
        else if(Platform.isIOS || Platform.isMacOS)
        {
            _methodChannel?.invokeMethod("init", {
                "showMediaNotification": showMediaNotification,
                "actions": actions.map((e) => e.index).toList(),
                "preferSkipButtons": applePreferSkipButtons
            });
        }
    }

    /// Open a new file for playback.
    /// 
    /// **[path]**: The path of the file. For example, `https://my-domain.com/file.mp3`
    /// or `/path/to/file.mp3`.
    /// 
    /// **[autoplay]** Whether or not to immediately start playing the file when opened.
    Future<void> open(String path, {bool autoplay = true}) async
    {
        await _player.open(path: path, autoplay: autoplay);

        if(autoplay)
        {
            _methodChannel?.invokeMethod("setPlaybackState", {
                "state": PlaybackState.play.index,
                "position": 0
            });
        }
    }

    /// Plays the opened file. If the player was paused,
    /// this resumes it.
    Future<void> play() async
    {
        _methodChannel?.invokeMethod("setPlaybackState", {
            "state": PlaybackState.play.index,
            "position": (await _progress).position
        });

        return await _player.play();
    }

    /// Pauses playback of the opened file.
    Future<void> pause() async
    {
        _methodChannel?.invokeMethod("setPlaybackState", {
            "state": PlaybackState.pause.index,
            "position": (await _progress).position
        });

        return await _player.pause();
    }

    /// Stops playback of the opened file. Another file will have
    /// to be opened to start playback.
    Future<void> stop() async
    {
        _methodChannel?.invokeMethod("setPlaybackState", {
            "state": -1,
            "position": 0
        });

        return await _player.stop();
    }

    /// Set the player in a looping mode where
    /// the opened file will be replayed when it is done.
    Future<void> loopPlayback(bool shouldLoop) async
    {
        return await _player.loopPlayback(shouldLoop: shouldLoop);
    }

    /// Set the volume of the playback.
    /// 
    /// **[volume]** The volume from `0.0` to `1.0`.
    Future<void> setVolume(double volume) async
    {
        return await _player.setVolume(volume: volume);
    }

    /// Seek to a certain spot in the file and play from there.
    /// 
    /// **[seconds]** The position, in seconds, to seek to.
    Future<void> seek(int seconds) async
    {
        _methodChannel?.invokeMethod("setPlaybackState", {
            "state": (await isPlaying ? PlaybackState.play : PlaybackState.pause).index,
            "position": seconds
        });

        return await _player.seek(seconds: seconds);
    }

    /// Set the metadata of the OS's media controller.
    /// 
    /// **[metadata]** The metadata information to display.
    Future<void> setMetadata(types.Metadata metadata) async
    {
        if(metadata.artUri != null || metadata.artBytes != null)
        {
            // Only one type of art can be provided.
            assert(
                (metadata.artUri != null && metadata.artBytes == null)
                || (metadata.artUri == null && metadata.artBytes != null)
            );
        }

        // MPRIS cant't take an image as bytes.
        // Convert to a temp file and pass URI instead.
        if(Platform.isLinux && metadata.artBytes != null)
        {
            String tempPath = "${(await getApplicationSupportDirectory()).path}/simple_audio";

            // Clear the temporary directory.
            Directory dir = Directory(tempPath);
            if(await dir.exists()) await dir.delete(recursive: true);

            String path = "$tempPath/${metadata.artBytes.hashCode}.jpg";

            File image = File(path);
            if(!await image.exists()) await image.create(recursive: true);
            await image.writeAsBytes(metadata.artBytes!);

            Metadata m = Metadata(
                title: metadata.title,
                artist: metadata.artist,
                album: metadata.album,
                artUri: "file://$path"
            );

            _player.setMetadata(metadata: m);
            return;
        }

        if(Platform.isLinux || Platform.isWindows)
        {
            Metadata m = Metadata(
                title: metadata.title,
                artist: metadata.artist,
                album: metadata.album,
                artUri: metadata.artUri,
                artBytes: metadata.artBytes
            );

            _player.setMetadata(metadata: m);
        }
        // The method channel is only available for Android, iOS, macOS.
        else if(_methodChannel != null)
        {
            // Prevent users from awaiting this method
            // and blocking their program infintely
            Future<void> _() async
            {
                // Wait for a valid duration.
                ProgressState progress = await _progress;
                while(progress.duration == 0)
                {
                    progress = await _progress;
                    continue;
                }

                await _methodChannel?.invokeMethod("setMetadata", {
                    "title": metadata.title,
                    "artist": metadata.artist,
                    "album": metadata.album,
                    "artUri": metadata.artUri,
                    "artBytes": metadata.artBytes,
                    "duration": progress.duration
                });
            }
            _();
        }
    }

    /// Whether or not to normalize the volume
    /// of the playback. The normalization uses the `EbuR128` standard and
    /// it normalizes to `-15 LUFS`.
    Future<void> normalizeVolume(bool shouldNormalize) async
    {
        return await _player.normalizeVolume(shouldNormalize: shouldNormalize);
    }
}