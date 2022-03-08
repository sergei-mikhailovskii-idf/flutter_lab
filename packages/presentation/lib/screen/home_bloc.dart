import 'package:domain/usecase/get_registration_use_case.dart';
import 'package:presentation/base/base_bloc.dart';
import 'package:presentation/screen/home_data.dart';

abstract class HomeBloc extends BaseBloc {
  factory HomeBloc(
    GetRegistrationStepUseCase palindromeUseCase,
  ) =>
      _HomeBloc(palindromeUseCase);

  void getRegistration();

  void sendRegistration();

  void onEmailChanged(String email);

  void onPhoneChanged(String phone);
}

class _HomeBloc extends BlocImpl implements HomeBloc {
  final GetRegistrationStepUseCase _getRegistrationStepUseCase;
  final _screenData = HomeData.init();

  bool _isLoading = false;

  _HomeBloc(this._getRegistrationStepUseCase);

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  @override
  void getRegistration() async {
    _isLoading = true;
    _screenData.registrationStep = 'Loading';
    _updateData();

    _screenData.registrationStep = await _getRegistrationStepUseCase();

    _isLoading = false;
    _updateData();
  }

  @override
  void dispose() {
    super.dispose();
    _getRegistrationStepUseCase.dispose();
  }

  @override
  void sendRegistration() {
  }

  @override
  void onEmailChanged(String email) {
    _screenData.email = email;
  }

  @override
  void onPhoneChanged(String phone) {
    _screenData.phone = phone;
  }

  void _updateData() {
    super.handleData(
      isLoading: _isLoading,
      data: _screenData.copy(),
    );
  }
}
