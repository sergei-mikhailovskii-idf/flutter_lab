import 'usecase.dart';

class PalindromeUseCase implements UseCase<String, Future<bool>> {
  @override
  Future<bool> call(String params) async {
    await Future.delayed(Duration(seconds: 5));
    return Future.value(false);
  }

  @override
  void dispose() {
    /// clearing resources
  }
}
