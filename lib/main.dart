import 'package:flutter/material.dart';
import 'package:car_search/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("HIT IT"),),
        body: const HomeScreen(),),
    );
  }
}
