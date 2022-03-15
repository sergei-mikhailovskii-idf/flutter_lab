import 'package:presentation/base/base_bloc.dart';

abstract class DetailsBloc extends BaseBloc {
  factory DetailsBloc() => _DetailsBloc();

  void back();
}

class _DetailsBloc extends BlocImpl implements DetailsBloc {
  @override
  void back() {
    appNavigator.pop();
  }
}
