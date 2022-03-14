import 'package:domain/repository/network_repository.dart';

import 'usecase.dart';

class PalindromeUseCase implements UseCase<String, Future<bool>> {
  final INetworkRepository _repository;

  PalindromeUseCase(this._repository);

  @override
  Future<bool> call(String params) async {
    final response = await _repository.checkPalindrome(params);
    return Future.value(response.isPalindrome);
  }

  @override
  void dispose() {
    /// clearing resources
  }
}
