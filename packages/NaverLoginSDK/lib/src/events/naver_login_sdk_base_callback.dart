import 'package:flutter_logcat/flutter_logcat.dart';

abstract class NaverLoginSdkBaseCallback {
  /// Managing Functions.
  Map<String, Function?> functionEvents = {};

  /// Connection to EventChannel StreambroadcastrReceiver
  ///
  /// I/flutter (13565): listen.. event:{onError: {errorCode: -1, message: user_cancel}}
  void listen<T>(T event) async {
    if (event is Map) {
      try {
        // Check 'key' only one
        // Check 'value' only one
        final String key = event.keys.first;
        final dynamic arguments = event.values.first;

        final Function? functionEvent = functionEvents[key];

        if (functionEvent != null &&
            (_paramsCount(function: functionEvent.runtimeType.toString()) ==
                _argumentsCount(arguments: arguments))) {
          Function.apply(functionEvent, arguments);
        }
      } catch (e, stackTrace) {
        Log.w("\n$stackTrace");
      }
    }
  }

  /// 2025-01-03-Fri, resolved for Closure Problem.
  /// Matching arugments count.
  ///
  /// ```dart
  /// function.runtimeType;
  /// ```
  ///
  /// - result
  /// ```text
  ///   () => Null
  ///   (String, String, dynamic) => Null
  /// ```
  ///
  int _paramsCount({required String function}) {
    final startBracketIndex = function.indexOf(
      '(',
    );
    final endBracketIndex = function.lastIndexOf(') =>');
    final String subFunction = function
        .substring(startBracketIndex + 1, endBracketIndex)
        .replaceAll(' ', '');
    final List<String> params = subFunction.split(',');
    return subFunction.isNotEmpty ? params.length : 0;
  }

  /// For matching [_paramsCount].
  ///
  int _argumentsCount({required dynamic arguments}) {
    // List<dynamic> == List<Object?>
    if (arguments is List<dynamic>) {
      return arguments.length;
    }
    return 0;
  }
}
