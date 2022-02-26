import 'package:flutter/material.dart';
import 'package:car_search/screen/home.dart';
import 'package:car_search/theme.dart';
import 'package:car_search/shared/routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: appTheme,
      home: const HomeScreen(),
      routes: appRoutes,
      //home: Scaffold(
      //  appBar: AppBar(title: const Text("carSearch")),
      //  body: const HomeScreen(),
      //),
    );
  }
}
