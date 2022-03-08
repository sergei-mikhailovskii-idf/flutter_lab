import 'package:domain/repository/network_repository.dart';
import 'package:domain/usecase/get_registration_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> initDomainModule() async {
  _initUseCaseModule();
}

void _initUseCaseModule() {
  GetIt.I.registerFactory(
    () => GetRegistrationStepUseCase(GetIt.I.get<INetworkRepository>()),
  );
}
