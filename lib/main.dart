import 'package:flutter/material.dart';
import 'package:latana/app/app.locator.dart';
import 'package:latana/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latana',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const LoginPage(),
      initialRoute: Routes.loginPage,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
