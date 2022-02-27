import 'package:domain/usecase/palindrome_usecase.dart';
import 'package:presentation/base/base_bloc.dart';
import 'package:presentation/screen/home_data.dart';

abstract class HomeBloc extends BaseBloc {
  factory HomeBloc(
    PalindromeUseCase palindromeUseCase,
  ) =>
      _HomeBloc(palindromeUseCase);

  void checkPalindrome();

  void setPalindromeString(String palindrome);
}

class _HomeBloc extends BlocImpl implements HomeBloc {
  final PalindromeUseCase _palindromeUseCase;
  final _screenData = HomeData.init();

  bool _isLoading = false;

  _HomeBloc(this._palindromeUseCase);

  @override
  void initState() {
    super.initState();
    updateData();
  }

  @override
  void checkPalindrome() async {
    _isLoading = true;
    updateData();

    _screenData.isPalindrome = await _palindromeUseCase(
      _screenData.palindromeInput,
    );
    _isLoading = false;
    updateData();
  }

  @override
  void dispose() {
    super.dispose();
    _palindromeUseCase.dispose();
  }

  void updateData() {
    super.handleData(
      isLoading: _isLoading,
      data: _screenData.copy(),
    );
  }

  @override
  void setPalindromeString(String palindrome) {
    _screenData.palindromeInput = palindrome;
  }
}
