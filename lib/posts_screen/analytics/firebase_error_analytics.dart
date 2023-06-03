import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'error_analytics.dart';

class FirebaseErrorAnalytics extends ErrorAnalytics {
  @override
  Future<void> logError({
    required String message,
    dynamic error,
    StackTrace? stackTrace,
    bool fatal = false,
  }) async {
    await FirebaseCrashlytics.instance.recordError(
      error,
      stackTrace,
      reason: message,
      fatal: fatal,
    );
  }
}
