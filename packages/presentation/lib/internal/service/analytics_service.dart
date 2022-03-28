import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/widgets.dart';

abstract class AnalyticsService {
  factory AnalyticsService(
    FirebaseAnalytics analytics,
  ) =>
      _AppAnalyticsService(
        analytics,
      );

  RouteObserver get analyticsObserver;

  void trackScreen({required String? name});

  void trackPushOpened({required String title, String? pushType});

  void trackPushReceived({required String title, String? pushType});

  void trackCustomEvent(
      {required String event, Map<String, Object?>? parameters});
}

class _AppAnalyticsService implements AnalyticsService {
  final FirebaseAnalytics _analytics;

  @override
  RouteObserver get analyticsObserver =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  _AppAnalyticsService(
    this._analytics,
  );

  @override
  void trackPushOpened({required String title, String? pushType}) {
    _analytics.logEvent(
      name: 'Push_notification',
      parameters: {
        'value': 'opened',
        'label': title,
        'type': pushType,
      },
    );
  }

  @override
  void trackPushReceived({required String title, String? pushType}) {
    _analytics.logEvent(
      name: 'Push_notification',
      parameters: {
        'value': 'received',
        'label': title,
        'type': pushType,
      },
    );
  }

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
