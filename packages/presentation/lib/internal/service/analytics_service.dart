import 'package:firebase_analytics/firebase_analytics.dart';

abstract class AnalyticsService {
  factory AnalyticsService(
    FirebaseAnalytics analytics,
  ) =>
      _AppAnalyticsService(
        analytics,
      );

  void trackScreen({required String? name});

  void trackCustomEvent(
      {required String event, Map<String, Object?>? parameters});
}

class _AppAnalyticsService implements AnalyticsService {
  final FirebaseAnalytics _analytics;

  _AppAnalyticsService(
    this._analytics,
  );

  @override
  void trackScreen({required String? name}) {
    final normalizedScreenName = name?.replaceFirst("/", "");
    _analytics.setCurrentScreen(
      screenName: normalizedScreenName,
      screenClassOverride: normalizedScreenName ?? "UnknownScreenName",
    );
  }

  @override
  void trackCustomEvent(
      {required String event, Map<String, Object?>? parameters}) {
    _analytics.logEvent(name: event, parameters: parameters);
  }
}
