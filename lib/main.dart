import 'package:flutter/material.dart';
import 'package:flutter_lab/di/injector.dart';
import 'package:presentation/screen/home/home_page.dart';

void main() async {
  await initInjector();
  runApp(const MyApp());
}
