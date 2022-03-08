import 'package:domain/usecase/palindrome_usecase.dart';
import 'package:presentation/base/base_bloc.dart';
import 'package:presentation/screen/home_data.dart';

abstract class HomeBloc extends BaseBloc {
  factory HomeBloc(
    GetRegistrationStepUseCase palindromeUseCase,
  ) =>
      _HomeBloc(palindromeUseCase);

  void checkPalindrome();

  void setPalindromeString(String palindrome);
}

class _HomeBloc extends BlocImpl implements HomeBloc {
  final GetRegistrationStepUseCase _getRegistrationStepUseCase;
  final _screenData = HomeData.init();

  bool _isLoading = false;

  _HomeBloc(this._getRegistrationStepUseCase);

  @override
  void initState() {
    super.initState();
    updateData();
  }

  @override
  void checkPalindrome() async {
    _isLoading = true;
    updateData();

    final step = await _getRegistrationStepUseCase("");
    _isLoading = false;
    updateData();
  }

  @override
  void dispose() {
    super.dispose();
    _getRegistrationStepUseCase.dispose();
  }

  void updateData() {
    super.handleData(
      isLoading: _isLoading,
      data: _screenData.copy(),
    );
  }

  @override
  void setPalindromeString(String palindrome) {
  }
}
