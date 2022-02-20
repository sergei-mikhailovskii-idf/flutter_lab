import 'usecase.dart';

class PalindromeUseCase implements UseCase<String, Future<bool>> {
  @override
  Future<bool> call(String params) async {
    await Future.delayed(Duration(seconds: 5));
    final isPalindrome = params == params.split('').reversed.toList().join('');
    return Future.value(isPalindrome);
  }

  @override
  void dispose() {
    /// clearing resources
  }
}
