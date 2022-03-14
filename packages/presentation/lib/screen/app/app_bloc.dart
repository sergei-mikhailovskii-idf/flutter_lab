import 'package:presentation/base/base_bloc.dart';

import 'app_data.dart';

abstract class AppBloc extends BaseBloc {
  factory AppBloc() => _AppBloc();
}

class _AppBloc extends BlocImpl implements AppBloc {
  final _appData = AppData.init();

  @override
  void initState() {
    super.initState();

    _updateData();
  }

  void _updateData() {
    super.handleData(data: _appData);
  }
}
