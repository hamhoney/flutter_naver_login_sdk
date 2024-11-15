import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:flutter_logcat/flutter_logcat.dart';
import '/src/events/naver_login_sdk_callback.dart';
import '/src/naver_login_sdk_constant.dart';

import 'naver_login_sdk_platform_interface.dart';

/// An implementation of [NaverLoginSdkPlatform] that uses method channels.
class NaverLoginSdkChannel extends NaverLoginSdkPlatform {
  /// Not final initialize
  OAuthLoginCallback? oauthLoginCallback;

  /// The method channel used to interact with the native platform.
  // @visibleForTesting
  final MethodChannel _methodChannel = const MethodChannel(NaverLoginSdkConstant.channelNameMethod);
  final EventChannel _eventChannel = const EventChannel(NaverLoginSdkConstant.channelNameEvent);

  /// Constructor
  NaverLoginSdkChannel() {
    _eventChannel.receiveBroadcastStream().listen(_onData);
  }

  // @override
  // Future<String?> getPlatformVersion() async {
  //   final version = ""; //await methodChannel.invokeMethod<String>(NaverLoginSdkConstant.platformVersion);
  //   return version;
  // }
  /// Neck Through
  void _onData<T>(T event) async {
    oauthLoginCallback?.listen(event);
  }


  @override
  void initialize({required String clientId, required String clientSecret, String clientName = "Flutter NaverLogin"}) async {
    Log.v("initialize..");
    final Map<String, String> params = {
      NaverLoginSdkConstant.value.initialize.clientId: clientId,
      NaverLoginSdkConstant.value.initialize.clientSecret: clientSecret,
      NaverLoginSdkConstant.value.initialize.clientName: clientName
    };
    await _methodChannel.invokeMethod<Void>(NaverLoginSdkConstant.key.initialize, params);
  }

  @override
  void authenticate({OAuthLoginCallback? callback}) async {
    oauthLoginCallback = callback;
    await _methodChannel.invokeMethod<Void>(NaverLoginSdkConstant.key.authenticate);
  }

  @override
  void logout() async {
    await _methodChannel.invokeMethod<Void>(NaverLoginSdkConstant.key.logout);
  }

  @override
  void release({OAuthLoginCallback? callback}) async {
    oauthLoginCallback = callback;
    await _methodChannel.invokeMethod<Void>(NaverLoginSdkConstant.key.release);
  }


}