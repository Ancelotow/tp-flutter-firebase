import 'package:flutter/cupertino.dart';
import 'package:tp_flutter_firebase/posts_screen/analytics/error_analytics.dart';

class MockErrorAnalytics implements ErrorAnalytics {
  @override
  Future<void> logError({
    required String message,
    error,
    StackTrace? stackTrace,
    bool fatal = false,
  }) {
    debugPrintStack(stackTrace: stackTrace, label: message);
    return Future.value();
  }
}
