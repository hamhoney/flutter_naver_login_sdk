import 'consts/naver_login_sdk_constant_bundle.dart';

class NaverLoginSdkConstant {
  NaverLoginSdkConstant._();

  // private constructor and nested explicit
  static final NaverLoginSdkConstantKey _key = NaverLoginSdkConstantKey();
  static final NaverLoginSdkConstantValue _value = NaverLoginSdkConstantValue();

  // Getter&Setter
  static NaverLoginSdkConstantKey get key => _key;
  static NaverLoginSdkConstantValue get value => _value;

  static const String channelNameMethod = 'naver_login_sdk_method';
  static const String channelNameEvent = 'naver_login_sdk_event';
}
