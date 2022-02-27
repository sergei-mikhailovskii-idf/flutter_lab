import 'package:domain/usecase/palindrome_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/screen/home_bloc.dart';

void initPresentationModule() {
  _initHomeScreenModule();
}

void _initHomeScreenModule() {
  GetIt.I.registerFactory<HomeBloc>(
    () => HomeBloc(
      GetIt.I.get<PalindromeUseCase>(),
    ),
  );
}
