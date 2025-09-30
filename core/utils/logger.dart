mixin LoggerMixin {
  void logDebug(String message) {
    print('[DEBUG] $message');
  }

  void logInfo(String message) {
    print('[INFO] $message');
  }

  void logError(String message, [Object? error, StackTrace? stackTrace]) {
    print('[ERROR] $message');
    if (error != null) print('Error: $error');
    if (stackTrace != null) print('StackTrace: $stackTrace');
  }
}