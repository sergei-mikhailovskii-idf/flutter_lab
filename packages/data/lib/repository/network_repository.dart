import 'package:domain/model/palindrome_response.dart';
import 'package:domain/repository/network_repository.dart';

class NetworkRepository implements INetworkRepository {
  @override
  Future<PalindromeResponse> checkPalindrome(String palindrome) async {
    /// sending palindrome to server
    await Future.delayed(Duration(seconds: 5));
    return Future.value(PalindromeResponse(true));
  }
}
