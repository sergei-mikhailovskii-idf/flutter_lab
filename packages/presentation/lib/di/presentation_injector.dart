import 'package:domain/usecase/get_registration_use_case.dart';
import 'package:domain/usecase/send_registration_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/screen/home/home_bloc.dart';
import 'package:presentation/screen/home/home_view_mapper.dart';

void initPresentationModule() {
  _initHomeScreenModule();
}

void _initHomeScreenModule() {
  GetIt.I.registerFactory<HomeViewMapper>(() => HomeViewMapper());
  GetIt.I.registerFactory<HomeBloc>(
    () => HomeBloc(
      GetIt.I.get<GetRegistrationStepUseCase>(),
      GetIt.I.get<SendRegistrationStepUseCase>(),
      GetIt.I.get<HomeViewMapper>(),
    ),
  );
}
