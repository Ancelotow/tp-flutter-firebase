import 'package:flutter/material.dart';
import 'package:tp_flutter_firebase/posts_screen/analytics/error_analytics.dart';

class AnalyticsProvider extends InheritedWidget {
  final ErrorAnalytics errorAnalytics;

  const AnalyticsProvider({
    super.key,
    required Widget child,
    required this.errorAnalytics,
  }) : super(child: child);

  static AnalyticsProvider of(BuildContext context) {
    final AnalyticsProvider? result = context.dependOnInheritedWidgetOfExactType<AnalyticsProvider>();
    assert(result != null, 'No AnalyticsProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AnalyticsProvider old) {
    return true;
  }
}
