import 'package:flutter/material.dart';
import 'package:smart_grocery_map/res/colors.dart';
import '/screens/auth/welcome_screen.dart';
//import '/screens/home/NavBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: yellow,
        appBarTheme: const AppBarTheme(
          color: yellow,
        )
      ),
      title: 'Smart Grocery',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
