import 'package:domain/usecase/get_registration_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/screen/home/home_bloc.dart';

void initPresentationModule() {
  _initHomeScreenModule();
}

void _initHomeScreenModule() {
  GetIt.I.registerFactory<HomeBloc>(
    () => HomeBloc(
      GetIt.I.get<GetRegistrationStepUseCase>(),
    ),
  );
}
