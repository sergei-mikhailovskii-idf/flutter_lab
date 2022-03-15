import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/navigator/app_navigator.dart';

abstract class BaseBloc<D> {
  Stream<BlocData<D?>> get dataStream;

  void initState();

  void dispose();
}

class BlocImpl<D> implements BaseBloc<D> {
  @override
  Stream<BlocData<D?>> get dataStream => _data.stream;

  @protected
  final appNavigator = GetIt.I.get<AppNavigator>();

  final _blocData = BlocData.init();

  final _data = StreamController<BlocData<D?>>();

  @override
  void dispose() {
    _data.close();
  }

  @protected
  void handleData({
    bool? isLoading,
    bool? isValid,
    D? data,
  }) {
    if (!_data.isClosed) {
      _blocData.updateParams(
        isLoading: isLoading,
        data: data,
      );
      _data.add(_blocData.copy<D>());
    }
  }

  @override
  void initState() {}
}
