import 'package:domain/repository/network_repository.dart';

import 'usecase.dart';

class GetRegistrationStepUseCase implements UseCase<String, Future<String?>> {
  final INetworkRepository _repository;

  GetRegistrationStepUseCase(this._repository);

  @override
  Future<String?> call(String params) async =>
      _repository.getRegistration(params).then((value) => value.step);

  @override
  void dispose() {
    _repository.dispose();
  }
}
