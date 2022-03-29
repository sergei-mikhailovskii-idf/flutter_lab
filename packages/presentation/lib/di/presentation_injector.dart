import 'package:domain/usecase/palindrome_usecase.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/navigator/app_navigator.dart';
import 'package:presentation/screen/details/details_bloc.dart';
import 'package:presentation/screen/home/home_bloc.dart';

import '../internal/service/analytics_service.dart';
import '../screen/app/app_bloc.dart';

void initPresentationModule() {
  _initAppModule();
  _initHomeScreenModule();
  _initNavigationModule();
  _initDetailsScreenModule();
  _initAnalyticsModule();
}

void _initAppModule() {
  GetIt.I.registerFactory<AppBloc>(
    () => AppBloc(
      GetIt.I.get<AnalyticsService>(),
    ),
  );
}

void _initAnalyticsModule() {
  GetIt.I.registerSingleton(FirebaseAnalytics());
  GetIt.I.registerSingleton(
    AnalyticsService(
      GetIt.I.get<FirebaseAnalytics>(),
    ),
  );
}

void _initNavigationModule() {
  GetIt.I.registerSingleton<AppNavigator>(AppNavigatorImpl());
}

void _initHomeScreenModule() {
  GetIt.I.registerFactory<HomeBloc>(
    () => HomeBloc(
      GetIt.I.get<AnalyticsService>(),
      GetIt.I.get<PalindromeUseCase>(),
    ),
  );
}

void _initDetailsScreenModule() {
  GetIt.I.registerFactory<DetailsBloc>(
    () => DetailsBloc(),
  );
}
