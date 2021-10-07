
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smartgrocery/res/colors.dart';
import 'package:smartgrocery/res/styles.dart';
import 'package:smartgrocery/screens/auth/components/auth_button.dart';
import 'package:smartgrocery/screens/auth/components/text_input_field.dart';

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
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                navblue,
                appAccent,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      TextInputField(
                        controller: _usernameController,
                        label: 'Username',
                        hintText: 'Enter your Username',
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 30.0),
                      TextInputField(
                        controller: _passwordController,
                        label: 'Password',
                        hintText: 'Enter your Password',
                        textInputAction: TextInputAction.done,
                        icon: Icons.lock,
                        obscureText:
                        suffixIcon == Icons.visibility_off ? true : false,
                        suffixIcon: suffixIcon,
                        onEyePressed: () {
                          setState(() {
                            suffixIcon = suffixIcon == Icons.visibility
                                ? Icons.visibility_off
                                : Icons.visibility;
                          });
                        },
                      ),
                      _buildForgotPasswordBtn(),
                      AuthButton(
                        onPressed: () {},
                        text: 'Login',
                      ),
                      _buildSignupBtn(),
                    ],
                  ),
                ),
                Positioned(
                  child: SafeArea(
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Platform.isAndroid
                              ? Icons.arrow_back
                              : Icons.arrow_back_ios,
                        ),
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: MaterialButton(
        onPressed: () {},
        padding: const EdgeInsets.only(right: 0.0),
        child: const Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an Account?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
