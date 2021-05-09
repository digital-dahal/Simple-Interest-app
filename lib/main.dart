import 'package:flutter/material.dart';
import './screen/Home/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomeContainer(),
    );
  }
}

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
