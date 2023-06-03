abstract class ErrorAnalytics {
  Future<void> logError({
    required String message,
    dynamic error,
    StackTrace? stackTrace,
    bool fatal = false,
  });
}
