import 'package:ce_reg_system/pages/FirstPage.dart';
import 'package:flutter/material.dart';
import 'package:ce_reg_system/pages/ProfilePage.dart';
import 'router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter.configureRoutes(); // Configure the routes

    return MaterialApp(
      title: 'Flutter Demoasd',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'NotoSansThai',
      ),
      onGenerateRoute: AppRouter.router.generator,
      home: const FirstPage(),
    );
  }
}
