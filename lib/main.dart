import 'package:flutter/material.dart';
import 'package:flutter_lab/di/injector.dart';
import 'package:presentation/screen/app/app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await initInjector();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}
