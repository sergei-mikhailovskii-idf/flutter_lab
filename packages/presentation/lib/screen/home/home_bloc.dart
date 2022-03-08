import 'package:domain/usecase/get_registration_use_case.dart';
import 'package:domain/usecase/send_registration_use_case.dart';
import 'package:presentation/base/base_bloc.dart';
import 'package:presentation/screen/home/home_data.dart';
import 'package:presentation/screen/home/home_view_mapper.dart';

abstract class HomeBloc extends BaseBloc {
  factory HomeBloc(
    GetRegistrationStepUseCase getRegistrationStepUseCase,
    SendRegistrationStepUseCase sendRegistrationStepUseCase,
    HomeViewMapper viewMapper,
  ) =>
      _HomeBloc(
        getRegistrationStepUseCase,
        sendRegistrationStepUseCase,
        viewMapper,
      );

  void getRegistration();

  void sendRegistration();

  void onEmailChanged(String email);

  void onPhoneChanged(String phone);
}

class _HomeBloc extends BlocImpl implements HomeBloc {
  final GetRegistrationStepUseCase _getRegistrationStepUseCase;
  final SendRegistrationStepUseCase _sendRegistrationStepUseCase;
  final HomeViewMapper _viewMapper;
  final _screenData = HomeData.init();

  bool _isLoading = false;

  _HomeBloc(
    this._getRegistrationStepUseCase,
    this._sendRegistrationStepUseCase,
    this._viewMapper,
  );

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
  void sendRegistration() async {
    _screenData.registrationStep = 'Loading';
    _updateData();

    final request = _viewMapper.mapScreenDataToRequest(_screenData);
    await _sendRegistrationStepUseCase(request);
    _screenData.registrationStep = 'Success';
    _updateData();
  }

  @override
  void onEmailChanged(String email) {
    _screenData.email = email;
  }

  @override
  void onPhoneChanged(String phone) {
    _screenData.phone = phone;
  }

  @override
  void dispose() {
    super.dispose();
    _getRegistrationStepUseCase.dispose();
  }

  void _updateData() {
    super.handleData(
      isLoading: _isLoading,
      data: _screenData.copy(),
    );
  }
}
