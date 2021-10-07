import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smartgrocery/res/colors.dart';
import 'package:smartgrocery/res/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  IconData suffixIcon = Icons.visibility_off;

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }


}
