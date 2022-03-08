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
    _updateData();

    final step = await _getRegistrationStepUseCase();
    print(step);

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

  void _updateData() {
    super.handleData(
      isLoading: _isLoading,
      data: _screenData.copy(),
    );
  }
}
