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
  final _navigatorKey = GlobalKey<NavigatorState>();
  final globalRootNavKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _bloc.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: globalRootNavKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _home(),
    );
  }

  StreamBuilder _home() => StreamBuilder<BlocData>(
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

  Navigator _content(
    BuildContext context,
    BlocData? blocData,
    AppData appData,
  ) =>
      Navigator(
        key: _navigatorKey,
        onPopPage: (route, result) {
          _bloc.handleRemoveRouteSettings(route.settings);
          return route.didPop(result);
        },
        /// very important moment!!!
        pages: appData.pages.toList(),
      );
}
