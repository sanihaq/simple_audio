// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.65.0.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty

import "bridge_definitions.dart";
import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

import 'dart:ffi' as ffi;

class SimpleAudioImpl implements SimpleAudio {
  final SimpleAudioPlatform _platform;
  factory SimpleAudioImpl(ExternalLibrary dylib) =>
      SimpleAudioImpl.raw(SimpleAudioPlatform(dylib));

  /// Only valid on web/WASM platforms.
  factory SimpleAudioImpl.wasm(FutureOr<WasmModule> module) =>
      SimpleAudioImpl(module as ExternalLibrary);
  SimpleAudioImpl.raw(this._platform);
  Future<Player> newStaticMethodPlayer(
      {required Int32List actions,
      required String dbusName,
      int? hwnd,
      dynamic hint}) {
    var arg0 = _platform.api2wire_int_32_list(actions);
    var arg1 = _platform.api2wire_String(dbusName);
    var arg2 = _platform.api2wire_opt_box_autoadd_i64(hwnd);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner
          .wire_new__static_method__Player(port_, arg0, arg1, arg2),
      parseSuccessData: (d) => _wire2api_player(d),
      constMeta: kNewStaticMethodPlayerConstMeta,
      argValues: [actions, dbusName, hwnd],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kNewStaticMethodPlayerConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "new__static_method__Player",
        argNames: ["actions", "dbusName", "hwnd"],
      );

  Stream<PlaybackState> playbackStateStreamStaticMethodPlayer({dynamic hint}) {
    return _platform.executeStream(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner
          .wire_playback_state_stream__static_method__Player(port_),
      parseSuccessData: _wire2api_playback_state,
      constMeta: kPlaybackStateStreamStaticMethodPlayerConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta
      get kPlaybackStateStreamStaticMethodPlayerConstMeta =>
          const FlutterRustBridgeTaskConstMeta(
            debugName: "playback_state_stream__static_method__Player",
            argNames: [],
          );

  Stream<ProgressState> progressStateStreamStaticMethodPlayer({dynamic hint}) {
    return _platform.executeStream(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner
          .wire_progress_state_stream__static_method__Player(port_),
      parseSuccessData: _wire2api_progress_state,
      constMeta: kProgressStateStreamStaticMethodPlayerConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta
      get kProgressStateStreamStaticMethodPlayerConstMeta =>
          const FlutterRustBridgeTaskConstMeta(
            debugName: "progress_state_stream__static_method__Player",
            argNames: [],
          );

  Stream<Callback> callbackStreamStaticMethodPlayer({dynamic hint}) {
    return _platform.executeStream(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_callback_stream__static_method__Player(port_),
      parseSuccessData: _wire2api_callback,
      constMeta: kCallbackStreamStaticMethodPlayerConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta
      get kCallbackStreamStaticMethodPlayerConstMeta =>
          const FlutterRustBridgeTaskConstMeta(
            debugName: "callback_stream__static_method__Player",
            argNames: [],
          );

  Future<bool> isPlayingMethodPlayer({required Player that, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_player(that);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_is_playing__method__Player(port_, arg0),
      parseSuccessData: _wire2api_bool,
      constMeta: kIsPlayingMethodPlayerConstMeta,
      argValues: [that],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kIsPlayingMethodPlayerConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "is_playing__method__Player",
        argNames: ["that"],
      );

  Future<ProgressState> getProgressMethodPlayer(
      {required Player that, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_player(that);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_get_progress__method__Player(port_, arg0),
      parseSuccessData: _wire2api_progress_state,
      constMeta: kGetProgressMethodPlayerConstMeta,
      argValues: [that],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kGetProgressMethodPlayerConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "get_progress__method__Player",
        argNames: ["that"],
      );

  Future<void> openMethodPlayer(
      {required Player that,
      required String path,
      required bool autoplay,
      dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_player(that);
    var arg1 = _platform.api2wire_String(path);
    var arg2 = autoplay;
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_open__method__Player(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_unit,
      constMeta: kOpenMethodPlayerConstMeta,
      argValues: [that, path, autoplay],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kOpenMethodPlayerConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "open__method__Player",
        argNames: ["that", "path", "autoplay"],
      );

  Future<void> playMethodPlayer({required Player that, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_player(that);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_play__method__Player(port_, arg0),
      parseSuccessData: _wire2api_unit,
      constMeta: kPlayMethodPlayerConstMeta,
      argValues: [that],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kPlayMethodPlayerConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "play__method__Player",
        argNames: ["that"],
      );

  Future<void> pauseMethodPlayer({required Player that, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_player(that);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_pause__method__Player(port_, arg0),
      parseSuccessData: _wire2api_unit,
      constMeta: kPauseMethodPlayerConstMeta,
      argValues: [that],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kPauseMethodPlayerConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "pause__method__Player",
        argNames: ["that"],
      );

  Future<void> stopMethodPlayer({required Player that, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_player(that);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_stop__method__Player(port_, arg0),
      parseSuccessData: _wire2api_unit,
      constMeta: kStopMethodPlayerConstMeta,
      argValues: [that],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kStopMethodPlayerConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "stop__method__Player",
        argNames: ["that"],
      );

  Future<void> loopPlaybackMethodPlayer(
      {required Player that, required bool shouldLoop, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_player(that);
    var arg1 = shouldLoop;
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_loop_playback__method__Player(port_, arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kLoopPlaybackMethodPlayerConstMeta,
      argValues: [that, shouldLoop],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kLoopPlaybackMethodPlayerConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "loop_playback__method__Player",
        argNames: ["that", "shouldLoop"],
      );

  Future<void> setVolumeMethodPlayer(
      {required Player that, required double volume, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_player(that);
    var arg1 = api2wire_f32(volume);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_set_volume__method__Player(port_, arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kSetVolumeMethodPlayerConstMeta,
      argValues: [that, volume],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kSetVolumeMethodPlayerConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "set_volume__method__Player",
        argNames: ["that", "volume"],
      );

  Future<void> seekMethodPlayer(
      {required Player that, required int seconds, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_player(that);
    var arg1 = _platform.api2wire_u64(seconds);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_seek__method__Player(port_, arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kSeekMethodPlayerConstMeta,
      argValues: [that, seconds],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kSeekMethodPlayerConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "seek__method__Player",
        argNames: ["that", "seconds"],
      );

  Future<void> setMetadataMethodPlayer(
      {required Player that, required Metadata metadata, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_player(that);
    var arg1 = _platform.api2wire_box_autoadd_metadata(metadata);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_set_metadata__method__Player(port_, arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kSetMetadataMethodPlayerConstMeta,
      argValues: [that, metadata],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kSetMetadataMethodPlayerConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "set_metadata__method__Player",
        argNames: ["that", "metadata"],
      );

  Future<void> normalizeVolumeMethodPlayer(
      {required Player that, required bool shouldNormalize, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_player(that);
    var arg1 = shouldNormalize;
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner
          .wire_normalize_volume__method__Player(port_, arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kNormalizeVolumeMethodPlayerConstMeta,
      argValues: [that, shouldNormalize],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kNormalizeVolumeMethodPlayerConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "normalize_volume__method__Player",
        argNames: ["that", "shouldNormalize"],
      );

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  bool _wire2api_bool(dynamic raw) {
    return raw as bool;
  }

  Callback _wire2api_callback(dynamic raw) {
    return Callback.values[raw];
  }

  int _wire2api_i32(dynamic raw) {
    return raw as int;
  }

  PlaybackState _wire2api_playback_state(dynamic raw) {
    return PlaybackState.values[raw];
  }

  Player _wire2api_player(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 0)
      throw Exception('unexpected arr length: expect 0 but see ${arr.length}');
    return Player(
      bridge: this,
    );
  }

  ProgressState _wire2api_progress_state(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return ProgressState(
      position: _wire2api_u64(arr[0]),
      duration: _wire2api_u64(arr[1]),
    );
  }

  int _wire2api_u64(dynamic raw) {
    return castInt(raw);
  }

  void _wire2api_unit(dynamic raw) {
    return;
  }
}

// Section: api2wire

@protected
bool api2wire_bool(bool raw) {
  return raw;
}

@protected
double api2wire_f32(double raw) {
  return raw;
}

@protected
int api2wire_i32(int raw) {
  return raw;
}

@protected
int api2wire_u8(int raw) {
  return raw;
}

// Section: finalizer

class SimpleAudioPlatform extends FlutterRustBridgeBase<SimpleAudioWire> {
  SimpleAudioPlatform(ffi.DynamicLibrary dylib) : super(SimpleAudioWire(dylib));

// Section: api2wire

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_String(String raw) {
    return api2wire_uint_8_list(utf8.encoder.convert(raw));
  }

  @protected
  ffi.Pointer<ffi.Int64> api2wire_box_autoadd_i64(int raw) {
    return inner.new_box_autoadd_i64_0(api2wire_i64(raw));
  }

  @protected
  ffi.Pointer<wire_Metadata> api2wire_box_autoadd_metadata(Metadata raw) {
    final ptr = inner.new_box_autoadd_metadata_0();
    _api_fill_to_wire_metadata(raw, ptr.ref);
    return ptr;
  }

  @protected
  ffi.Pointer<wire_Player> api2wire_box_autoadd_player(Player raw) {
    final ptr = inner.new_box_autoadd_player_0();
    return ptr;
  }

  @protected
  int api2wire_i64(int raw) {
    return raw;
  }

  @protected
  ffi.Pointer<wire_int_32_list> api2wire_int_32_list(Int32List raw) {
    final ans = inner.new_int_32_list_0(raw.length);
    ans.ref.ptr.asTypedList(raw.length).setAll(0, raw);
    return ans;
  }

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_opt_String(String? raw) {
    return raw == null ? ffi.nullptr : api2wire_String(raw);
  }

  @protected
  ffi.Pointer<ffi.Int64> api2wire_opt_box_autoadd_i64(int? raw) {
    return raw == null ? ffi.nullptr : api2wire_box_autoadd_i64(raw);
  }

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_opt_uint_8_list(Uint8List? raw) {
    return raw == null ? ffi.nullptr : api2wire_uint_8_list(raw);
  }

  @protected
  int api2wire_u64(int raw) {
    return raw;
  }

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_uint_8_list(Uint8List raw) {
    final ans = inner.new_uint_8_list_0(raw.length);
    ans.ref.ptr.asTypedList(raw.length).setAll(0, raw);
    return ans;
  }
// Section: finalizer

// Section: api_fill_to_wire

  void _api_fill_to_wire_box_autoadd_metadata(
      Metadata apiObj, ffi.Pointer<wire_Metadata> wireObj) {
    _api_fill_to_wire_metadata(apiObj, wireObj.ref);
  }

  void _api_fill_to_wire_metadata(Metadata apiObj, wire_Metadata wireObj) {
    wireObj.title = api2wire_opt_String(apiObj.title);
    wireObj.artist = api2wire_opt_String(apiObj.artist);
    wireObj.album = api2wire_opt_String(apiObj.album);
    wireObj.art_uri = api2wire_opt_String(apiObj.artUri);
    wireObj.art_bytes = api2wire_opt_uint_8_list(apiObj.artBytes);
  }

  void _api_fill_to_wire_player(Player apiObj, wire_Player wireObj) {}
}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.

/// generated by flutter_rust_bridge
class SimpleAudioWire implements FlutterRustBridgeWireBase {
  @internal
  late final dartApi = DartApiDl(init_frb_dart_api_dl);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  SimpleAudioWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  SimpleAudioWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void store_dart_post_cobject(
    DartPostCObjectFnType ptr,
  ) {
    return _store_dart_post_cobject(
      ptr,
    );
  }

  late final _store_dart_post_cobjectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(DartPostCObjectFnType)>>(
          'store_dart_post_cobject');
  late final _store_dart_post_cobject = _store_dart_post_cobjectPtr
      .asFunction<void Function(DartPostCObjectFnType)>();

  Object get_dart_object(
    int ptr,
  ) {
    return _get_dart_object(
      ptr,
    );
  }

  late final _get_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Handle Function(uintptr_t)>>(
          'get_dart_object');
  late final _get_dart_object =
      _get_dart_objectPtr.asFunction<Object Function(int)>();

  void drop_dart_object(
    int ptr,
  ) {
    return _drop_dart_object(
      ptr,
    );
  }

  late final _drop_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(uintptr_t)>>(
          'drop_dart_object');
  late final _drop_dart_object =
      _drop_dart_objectPtr.asFunction<void Function(int)>();

  int new_dart_opaque(
    Object handle,
  ) {
    return _new_dart_opaque(
      handle,
    );
  }

  late final _new_dart_opaquePtr =
      _lookup<ffi.NativeFunction<uintptr_t Function(ffi.Handle)>>(
          'new_dart_opaque');
  late final _new_dart_opaque =
      _new_dart_opaquePtr.asFunction<int Function(Object)>();

  int init_frb_dart_api_dl(
    ffi.Pointer<ffi.Void> obj,
  ) {
    return _init_frb_dart_api_dl(
      obj,
    );
  }

  late final _init_frb_dart_api_dlPtr =
      _lookup<ffi.NativeFunction<ffi.IntPtr Function(ffi.Pointer<ffi.Void>)>>(
          'init_frb_dart_api_dl');
  late final _init_frb_dart_api_dl = _init_frb_dart_api_dlPtr
      .asFunction<int Function(ffi.Pointer<ffi.Void>)>();

  void wire_new__static_method__Player(
    int port_,
    ffi.Pointer<wire_int_32_list> actions,
    ffi.Pointer<wire_uint_8_list> dbus_name,
    ffi.Pointer<ffi.Int64> hwnd,
  ) {
    return _wire_new__static_method__Player(
      port_,
      actions,
      dbus_name,
      hwnd,
    );
  }

  late final _wire_new__static_method__PlayerPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64,
              ffi.Pointer<wire_int_32_list>,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<ffi.Int64>)>>('wire_new__static_method__Player');
  late final _wire_new__static_method__Player =
      _wire_new__static_method__PlayerPtr.asFunction<
          void Function(int, ffi.Pointer<wire_int_32_list>,
              ffi.Pointer<wire_uint_8_list>, ffi.Pointer<ffi.Int64>)>();

  void wire_playback_state_stream__static_method__Player(
    int port_,
  ) {
    return _wire_playback_state_stream__static_method__Player(
      port_,
    );
  }

  late final _wire_playback_state_stream__static_method__PlayerPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_playback_state_stream__static_method__Player');
  late final _wire_playback_state_stream__static_method__Player =
      _wire_playback_state_stream__static_method__PlayerPtr
          .asFunction<void Function(int)>();

  void wire_progress_state_stream__static_method__Player(
    int port_,
  ) {
    return _wire_progress_state_stream__static_method__Player(
      port_,
    );
  }

  late final _wire_progress_state_stream__static_method__PlayerPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_progress_state_stream__static_method__Player');
  late final _wire_progress_state_stream__static_method__Player =
      _wire_progress_state_stream__static_method__PlayerPtr
          .asFunction<void Function(int)>();

  void wire_callback_stream__static_method__Player(
    int port_,
  ) {
    return _wire_callback_stream__static_method__Player(
      port_,
    );
  }

  late final _wire_callback_stream__static_method__PlayerPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_callback_stream__static_method__Player');
  late final _wire_callback_stream__static_method__Player =
      _wire_callback_stream__static_method__PlayerPtr
          .asFunction<void Function(int)>();

  void wire_is_playing__method__Player(
    int port_,
    ffi.Pointer<wire_Player> that,
  ) {
    return _wire_is_playing__method__Player(
      port_,
      that,
    );
  }

  late final _wire_is_playing__method__PlayerPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64,
              ffi.Pointer<wire_Player>)>>('wire_is_playing__method__Player');
  late final _wire_is_playing__method__Player =
      _wire_is_playing__method__PlayerPtr
          .asFunction<void Function(int, ffi.Pointer<wire_Player>)>();

  void wire_get_progress__method__Player(
    int port_,
    ffi.Pointer<wire_Player> that,
  ) {
    return _wire_get_progress__method__Player(
      port_,
      that,
    );
  }

  late final _wire_get_progress__method__PlayerPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64,
              ffi.Pointer<wire_Player>)>>('wire_get_progress__method__Player');
  late final _wire_get_progress__method__Player =
      _wire_get_progress__method__PlayerPtr
          .asFunction<void Function(int, ffi.Pointer<wire_Player>)>();

  void wire_open__method__Player(
    int port_,
    ffi.Pointer<wire_Player> that,
    ffi.Pointer<wire_uint_8_list> path,
    bool autoplay,
  ) {
    return _wire_open__method__Player(
      port_,
      that,
      path,
      autoplay,
    );
  }

  late final _wire_open__method__PlayerPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64,
              ffi.Pointer<wire_Player>,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Bool)>>('wire_open__method__Player');
  late final _wire_open__method__Player =
      _wire_open__method__PlayerPtr.asFunction<
          void Function(int, ffi.Pointer<wire_Player>,
              ffi.Pointer<wire_uint_8_list>, bool)>();

  void wire_play__method__Player(
    int port_,
    ffi.Pointer<wire_Player> that,
  ) {
    return _wire_play__method__Player(
      port_,
      that,
    );
  }

  late final _wire_play__method__PlayerPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64,
              ffi.Pointer<wire_Player>)>>('wire_play__method__Player');
  late final _wire_play__method__Player = _wire_play__method__PlayerPtr
      .asFunction<void Function(int, ffi.Pointer<wire_Player>)>();

  void wire_pause__method__Player(
    int port_,
    ffi.Pointer<wire_Player> that,
  ) {
    return _wire_pause__method__Player(
      port_,
      that,
    );
  }

  late final _wire_pause__method__PlayerPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64,
              ffi.Pointer<wire_Player>)>>('wire_pause__method__Player');
  late final _wire_pause__method__Player = _wire_pause__method__PlayerPtr
      .asFunction<void Function(int, ffi.Pointer<wire_Player>)>();

  void wire_stop__method__Player(
    int port_,
    ffi.Pointer<wire_Player> that,
  ) {
    return _wire_stop__method__Player(
      port_,
      that,
    );
  }

  late final _wire_stop__method__PlayerPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64,
              ffi.Pointer<wire_Player>)>>('wire_stop__method__Player');
  late final _wire_stop__method__Player = _wire_stop__method__PlayerPtr
      .asFunction<void Function(int, ffi.Pointer<wire_Player>)>();

  void wire_loop_playback__method__Player(
    int port_,
    ffi.Pointer<wire_Player> that,
    bool should_loop,
  ) {
    return _wire_loop_playback__method__Player(
      port_,
      that,
      should_loop,
    );
  }

  late final _wire_loop_playback__method__PlayerPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Pointer<wire_Player>,
              ffi.Bool)>>('wire_loop_playback__method__Player');
  late final _wire_loop_playback__method__Player =
      _wire_loop_playback__method__PlayerPtr
          .asFunction<void Function(int, ffi.Pointer<wire_Player>, bool)>();

  void wire_set_volume__method__Player(
    int port_,
    ffi.Pointer<wire_Player> that,
    double volume,
  ) {
    return _wire_set_volume__method__Player(
      port_,
      that,
      volume,
    );
  }

  late final _wire_set_volume__method__PlayerPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Pointer<wire_Player>,
              ffi.Float)>>('wire_set_volume__method__Player');
  late final _wire_set_volume__method__Player =
      _wire_set_volume__method__PlayerPtr
          .asFunction<void Function(int, ffi.Pointer<wire_Player>, double)>();

  void wire_seek__method__Player(
    int port_,
    ffi.Pointer<wire_Player> that,
    int seconds,
  ) {
    return _wire_seek__method__Player(
      port_,
      that,
      seconds,
    );
  }

  late final _wire_seek__method__PlayerPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Pointer<wire_Player>,
              ffi.Uint64)>>('wire_seek__method__Player');
  late final _wire_seek__method__Player = _wire_seek__method__PlayerPtr
      .asFunction<void Function(int, ffi.Pointer<wire_Player>, int)>();

  void wire_set_metadata__method__Player(
    int port_,
    ffi.Pointer<wire_Player> that,
    ffi.Pointer<wire_Metadata> metadata,
  ) {
    return _wire_set_metadata__method__Player(
      port_,
      that,
      metadata,
    );
  }

  late final _wire_set_metadata__method__PlayerPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(ffi.Int64, ffi.Pointer<wire_Player>,
                  ffi.Pointer<wire_Metadata>)>>(
      'wire_set_metadata__method__Player');
  late final _wire_set_metadata__method__Player =
      _wire_set_metadata__method__PlayerPtr.asFunction<
          void Function(
              int, ffi.Pointer<wire_Player>, ffi.Pointer<wire_Metadata>)>();

  void wire_normalize_volume__method__Player(
    int port_,
    ffi.Pointer<wire_Player> that,
    bool should_normalize,
  ) {
    return _wire_normalize_volume__method__Player(
      port_,
      that,
      should_normalize,
    );
  }

  late final _wire_normalize_volume__method__PlayerPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Pointer<wire_Player>,
              ffi.Bool)>>('wire_normalize_volume__method__Player');
  late final _wire_normalize_volume__method__Player =
      _wire_normalize_volume__method__PlayerPtr
          .asFunction<void Function(int, ffi.Pointer<wire_Player>, bool)>();

  ffi.Pointer<ffi.Int64> new_box_autoadd_i64_0(
    int value,
  ) {
    return _new_box_autoadd_i64_0(
      value,
    );
  }

  late final _new_box_autoadd_i64_0Ptr =
      _lookup<ffi.NativeFunction<ffi.Pointer<ffi.Int64> Function(ffi.Int64)>>(
          'new_box_autoadd_i64_0');
  late final _new_box_autoadd_i64_0 = _new_box_autoadd_i64_0Ptr
      .asFunction<ffi.Pointer<ffi.Int64> Function(int)>();

  ffi.Pointer<wire_Metadata> new_box_autoadd_metadata_0() {
    return _new_box_autoadd_metadata_0();
  }

  late final _new_box_autoadd_metadata_0Ptr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_Metadata> Function()>>(
          'new_box_autoadd_metadata_0');
  late final _new_box_autoadd_metadata_0 = _new_box_autoadd_metadata_0Ptr
      .asFunction<ffi.Pointer<wire_Metadata> Function()>();

  ffi.Pointer<wire_Player> new_box_autoadd_player_0() {
    return _new_box_autoadd_player_0();
  }

  late final _new_box_autoadd_player_0Ptr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_Player> Function()>>(
          'new_box_autoadd_player_0');
  late final _new_box_autoadd_player_0 = _new_box_autoadd_player_0Ptr
      .asFunction<ffi.Pointer<wire_Player> Function()>();

  ffi.Pointer<wire_int_32_list> new_int_32_list_0(
    int len,
  ) {
    return _new_int_32_list_0(
      len,
    );
  }

  late final _new_int_32_list_0Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<wire_int_32_list> Function(
              ffi.Int32)>>('new_int_32_list_0');
  late final _new_int_32_list_0 = _new_int_32_list_0Ptr
      .asFunction<ffi.Pointer<wire_int_32_list> Function(int)>();

  ffi.Pointer<wire_uint_8_list> new_uint_8_list_0(
    int len,
  ) {
    return _new_uint_8_list_0(
      len,
    );
  }

  late final _new_uint_8_list_0Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<wire_uint_8_list> Function(
              ffi.Int32)>>('new_uint_8_list_0');
  late final _new_uint_8_list_0 = _new_uint_8_list_0Ptr
      .asFunction<ffi.Pointer<wire_uint_8_list> Function(int)>();

  void free_WireSyncReturn(
    WireSyncReturn ptr,
  ) {
    return _free_WireSyncReturn(
      ptr,
    );
  }

  late final _free_WireSyncReturnPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(WireSyncReturn)>>(
          'free_WireSyncReturn');
  late final _free_WireSyncReturn =
      _free_WireSyncReturnPtr.asFunction<void Function(WireSyncReturn)>();
}

class _Dart_Handle extends ffi.Opaque {}

class wire_int_32_list extends ffi.Struct {
  external ffi.Pointer<ffi.Int32> ptr;

  @ffi.Int32()
  external int len;
}

class wire_uint_8_list extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> ptr;

  @ffi.Int32()
  external int len;
}

class wire_Player extends ffi.Opaque {}

class wire_Metadata extends ffi.Struct {
  external ffi.Pointer<wire_uint_8_list> title;

  external ffi.Pointer<wire_uint_8_list> artist;

  external ffi.Pointer<wire_uint_8_list> album;

  external ffi.Pointer<wire_uint_8_list> art_uri;

  external ffi.Pointer<wire_uint_8_list> art_bytes;
}

typedef DartPostCObjectFnType = ffi.Pointer<
    ffi.NativeFunction<ffi.Bool Function(DartPort, ffi.Pointer<ffi.Void>)>>;
typedef DartPort = ffi.Int64;
typedef uintptr_t = ffi.UnsignedLong;

const int CHUNK_SIZE = 131072;
