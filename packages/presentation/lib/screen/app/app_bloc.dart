import 'package:flutter/widgets.dart';
import 'package:presentation/base/base_bloc.dart';
import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screen/home/home_page.dart';

import '../../internal/service/analytics_service.dart';
import 'app_data.dart';
import 'app_page.dart';

abstract class AppBloc extends BaseBloc {
  factory AppBloc(AnalyticsService analyticsService) =>
      _AppBloc(analyticsService);

  void handleRemoveRouteSettings(RouteSettings value);
}

class _AppBloc extends BlocImpl implements AppBloc {
  final _appData = AppData.init();
  final AnalyticsService _analyticsService;

  _AppBloc(this._analyticsService);

  @override
  void initState() {
    super.initState();
    _initNavHandler();
    _updateData();
  }

  @override
  void handleRemoveRouteSettings(RouteSettings value) {
    _appData.pages.remove(value);
    _updateData();
  }

  void _updateData() {
    final currentPage = _currentPage();
    _analyticsService.trackScreen(name: currentPage.name);
    super.handleData(data: _appData);
  }

  void _initNavHandler() {
    appNavigator.init(
      push: _push,
      popOldAndPush: _popOldAndPush,
      popAllAndPush: _popAllAndPush,
      popAndPush: _popAndPush,
      pushPages: _pushPages,
      popAllAndPushPages: _popAllAndPushPages,
      pop: _pop,
      maybePop: _maybePop,
      popUntil: _popUntil,
      currentPage: _currentPage,
    );
  }

  void _push(BasePage page) {
    _appData.pages.add(page);
    _updateData();
  }

  void _popAllAndPush(BasePage page) {
    _appData.pages.clear();
    _push(page);
  }

  void _popOldAndPush(BasePage page) {
    final oldIndex = _appData.pages.indexWhere(
      (element) => element.name == page.name,
    );
    if (oldIndex != -1) {
      _appData.pages.removeAt(oldIndex);
    }
    _push(page);
  }

  void _popAndPush(BasePage page) {
    _appData.pages.removeLast();
    _push(page);
  }

  void _pushPages(List<BasePage> pages) {
    pages.forEach(_appData.pages.add);
    _updateData();
  }

  void _popAllAndPushPages(List<BasePage> pages) {
    _appData.pages.clear();
    pages.forEach(_appData.pages.add);
    _updateData();
  }

  void _pop() {
    _appData.pages.removeLast();
    _updateData();
  }

  void _maybePop() {
    if (_appData.pages.length > 1) {
      _pop();
    }
  }

  void _popUntil(BasePage page) {
    final start = _appData.pages.indexWhere((e) => e.name == page.name) + 1;
    final end = _appData.pages.length;
    _appData.pages.removeRange(start, end);
    _updateData();
  }

  AppPage _currentPage() {
    if (_appData.pages.isEmpty) {
      _appData.pages.add(MyHomePage.page());
    }
    return _appData.pages.last as AppPage;
  }
}
