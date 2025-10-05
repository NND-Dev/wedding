import 'package:flutter/foundation.dart';

mixin LoggerMixin {
  void logDebug(String message) {
    if (kDebugMode) {
      debugPrint('[DEBUG] $message');
    }
  }

  void logInfo(String message) {
    if (kDebugMode) {
      debugPrint('[INFO] $message');
    }
  }

  void logError(String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      debugPrint('[ERROR] $message');
      if (error != null) debugPrint('Error: $error');
      if (stackTrace != null) debugPrint('StackTrace: $stackTrace');
    }
  }
}
