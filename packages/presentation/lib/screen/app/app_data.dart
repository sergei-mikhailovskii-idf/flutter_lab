import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screen/home/home_page.dart';

class AppData {
  final List<BasePage> pages;

  AppData(this.pages);

  factory AppData.init() {
    final pages = List<BasePage>.from([MyHomePage.page()]);
    return AppData(pages);
  }
}
