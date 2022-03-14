import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/screen/app/app_bloc.dart';

import 'app_data.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {

  final _bloc = AppBloc();

  @override
  void initState() {
    super.initState();
    _bloc.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _home(),
    );
  }

  StreamBuilder _home() {
    return StreamBuilder<BlocData>(
      stream: _bloc.dataStream,
      builder: (context, result) {
        final blocData = result.data;
        final appData = blocData?.data;
        if (appData is AppData) {
          return _content(context, blocData, appData);
        } else {
          return Container();
        }
      },
    );
  }

  Scaffold _content(BuildContext context, BlocData? blocData, AppData appData) {
    return Scaffold(
      body: Navigator(
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
        pages: appData.pages,
      ),
    );
  }
}
