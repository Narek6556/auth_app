import 'package:auth_app/app.dart';
import 'package:auth_app/data/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  runApp(const App());
}
