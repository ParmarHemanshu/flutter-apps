import 'package:flutter/material.dart';
import 'package:picsy_app/screens/HomeScreeen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picsy App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),

    );
  }
}

