import 'package:presentation/screen/app/app_page.dart';

import 'base_arguments.dart';
import 'base_page.dart';

abstract class AppNavigator {
  ///region init

  void init({
    Function(BasePage page) push,
    Function(BasePage page) popOldAndPush,
    Function(BasePage page) popAllAndPush,
    Function(List<BasePage> pages) pushPages,
    Function(BasePage page) popAndPush,
    Function(List<BasePage> pages) popAllAndPushPages,
    Function() pop,
    Function() maybePop,
    Function(BasePage page) popUntil,
    AppPage? Function() currentPage,
  });

  ///endregion

  ///region nav operators

  void push(BasePage page);

  void popAllAndPush(BasePage page);

  void popOldAndPush(BasePage page);

  void pushPages(List<BasePage> pages);

  void popAndPush(BasePage page);

  void popAllAndPushPages(List<BasePage> pages);

  void pop();

  void maybePop();

  void popUntil(BasePage page);

  AppPage? currentPage();

  ///endregion
}

class AppNavigatorImpl implements AppNavigator {
  ///functions
  Function(BasePage page)? _push;
  Function(BasePage page)? _popOldAndPush;
  Function(BasePage page)? _popAllAndPush;
  Function(List<BasePage> pages)? _pushPages;
  Function(BasePage page)? _popAndPush;
  Function(List<BasePage> pages)? _popAllAndPushPages;
  Function()? _pop;
  Function()? _maybePop;
  Function(BasePage page)? _popUntil;
  AppPage? Function()? _currentPage;

  @override
  void init({
    Function(BasePage page)? push,
    Function(BasePage page)? popOldAndPush,
    Function(BasePage page)? popAllAndPush,
    Function(List<BasePage> pages)? pushPages,
    Function(BasePage page)? popAndPush,
    Function(List<BasePage> pages)? popAllAndPushPages,
    Function()? pop,
    Function()? maybePop,
    Function(BasePage page)? popUntil,
    AppPage? Function()? currentPage,
  }) {
    _push = push;
    _popOldAndPush = popOldAndPush;
    _popAllAndPush = popAllAndPush;
    _pushPages = pushPages;
    _popAndPush = popAndPush;
    _popAllAndPushPages = popAllAndPushPages;
    _pop = pop;
    _maybePop = maybePop;
    _popUntil = popUntil;
    _currentPage = currentPage;
  }

  @override
  void push(BasePage page) => _push?.call(page);

  @override
  void popAllAndPush(BasePage page) => _popAllAndPush?.call(page);

  @override
  void pushPages(List<BasePage> pages) => _pushPages?.call(pages);

  @override
  void pop() => _pop?.call();

  @override
  void maybePop() => _maybePop?.call();

  @override
  void popUntil(BasePage page) => _popUntil?.call(page);

  @override
  void popAndPush(BasePage page) => _popAndPush?.call(page);

  @override
  void popAllAndPushPages(List<BasePage> pages) =>
      _popAllAndPushPages?.call(pages);

  @override
  void popOldAndPush(BasePage<BaseArguments> page) {
    _popOldAndPush?.call(page);
  }

  @override
  AppPage currentPage() => _currentPage?.call() as AppPage;
}
