import 'package:domain/model/home_step_fields.dart';
import 'package:domain/repository/network_repository.dart';

import 'usecase.dart';

class SendRegistrationStepUseCase
    implements UseCaseParams<HomeStepFields, Future<void>> {
  final INetworkRepository _repository;

  SendRegistrationStepUseCase(this._repository);

  @override
  Future<void> call(HomeStepFields request) async =>
      _repository.sendRegistration(request.toJson());

  @override
  void dispose() {
    _repository.dispose();
  }
}
