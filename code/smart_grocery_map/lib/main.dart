import 'package:flutter/material.dart';
import '/screens/home/Navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Grocery Map',
      home: new NavBar(),
    );
  }
}
