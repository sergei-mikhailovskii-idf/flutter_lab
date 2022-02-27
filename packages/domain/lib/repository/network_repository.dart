import 'package:domain/model/palindrome_response.dart';

abstract class INetworkRepository {
  Future<PalindromeResponse> checkPalindrome(String palindrome);
}
