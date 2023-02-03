import 'package:flutter/material.dart';

import '../view/layout_screen.dart';
import 'app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APi Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      home: const LayoutScreen(),
    );
  }
}
