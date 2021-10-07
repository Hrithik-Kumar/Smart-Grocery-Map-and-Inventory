import 'package:flutter/material.dart';
import 'package:smartgrocery/screens/auth/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Smart Grocery',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
