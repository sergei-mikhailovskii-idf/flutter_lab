import 'package:flutter/material.dart';
import 'package:flutter_lab/di/injector.dart';
import 'package:presentation/screen/home_page.dart';

void main() async {
  configureDependencies();
  runApp(const MyApp());
}
