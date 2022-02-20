class HomeData {
  bool? isPalindrome;
  String palindromeInput = '';

  HomeData(this.isPalindrome, this.palindromeInput);

  factory HomeData.init() => HomeData(null, '');

  HomeData copy() => HomeData(isPalindrome, palindromeInput);
}
