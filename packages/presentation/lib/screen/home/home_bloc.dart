import 'package:cloud_firestore/cloud_firestore.dart';
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

  void readWriteFirestore();
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
    _readData();
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

  @override
  void readWriteFirestore() {
    FirebaseFirestore.instance
        .collection('users')
        .add(
          {
            'name': 'Sergei',
          },
        )
        .then((value) => print('success'))
        .onError((error, stackTrace) => print('error'));
  }

  void _readData() {
    FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((e) => e.data()['name']).toList())
        .listen(
      (event) {
        print(event);
      },
    );
  }

  void updateData() {
    super.handleData(
      isLoading: _isLoading,
      data: _screenData.copy(),
    );
  }
}
