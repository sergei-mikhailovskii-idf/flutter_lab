import 'package:domain/usecase/palindrome_usecase.dart';
import 'package:presentation/base/base_bloc.dart';
import 'package:presentation/screen/details/details_page.dart';
import 'package:presentation/screen/home/home_data.dart';

import '../../internal/service/analytics_service.dart';

abstract class HomeBloc extends BaseBloc {
  factory HomeBloc(
    AnalyticsService analyticsService,
    PalindromeUseCase palindromeUseCase,
  ) =>
      _HomeBloc(analyticsService, palindromeUseCase);

  void checkPalindrome();

  void setPalindromeString(String palindrome);

  void navigateToDetails();
}

class _HomeBloc extends BlocImpl implements HomeBloc {
  final AnalyticsService _analyticsService;
  final PalindromeUseCase _palindromeUseCase;

  final _screenData = HomeData.init();

  bool _isLoading = false;

  _HomeBloc(this._analyticsService, this._palindromeUseCase);

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

  @override
  void setPalindromeString(String palindrome) {
    _screenData.palindromeInput = palindrome;
  }

  @override
  void navigateToDetails() {
    _analyticsService.trackCustomEvent(event: "show_details_clicked");
    appNavigator.push(DetailsPage.page());
  }

  void updateData() {
    super.handleData(
      isLoading: _isLoading,
      data: _screenData.copy(),
    );
  }
}
