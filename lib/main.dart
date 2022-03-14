import 'package:flutter/material.dart';
import 'package:flutter_lab/di/injector.dart';
import 'package:presentation/screen/app/app.dart';

void main() async {
  await initInjector();
  runApp(App());
}
