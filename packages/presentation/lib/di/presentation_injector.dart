import 'package:domain/usecase/palindrome_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/navigator/app_navigator.dart';
import 'package:presentation/screen/details/details_bloc.dart';
import 'package:presentation/screen/home/home_bloc.dart';

void initPresentationModule() {
  _initHomeScreenModule();
  _initNavigationModule();
  _initDetailsScreenModule();
}

void _initNavigationModule() {
  GetIt.I.registerSingleton<AppNavigator>(AppNavigatorImpl());
}

void _initHomeScreenModule() {
  GetIt.I.registerFactory<HomeBloc>(
    () => HomeBloc(
      GetIt.I.get<PalindromeUseCase>(),
    ),
  );
}

void _initDetailsScreenModule() {
  GetIt.I.registerFactory<DetailsBloc>(
    () => DetailsBloc(),
  );
}
