import 'package:domain/repository/network_repository.dart';

import 'usecase.dart';

class GetRegistrationStepUseCase implements UseCase<Future<String?>> {
  final INetworkRepository _repository;

  GetRegistrationStepUseCase(this._repository);

  @override
  Future<String?> call() async =>
      _repository.getRegistration().then((value) => value.step);

  @override
  void dispose() {
    _repository.dispose();
  }
}
