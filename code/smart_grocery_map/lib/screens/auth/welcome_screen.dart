import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '/screens/auth/customer_login_screen.dart';
import '/res/anims.dart';
import '/res/colors.dart';
import '/screens/auth/components/welcome_button.dart';
import '/screens/auth/components/welcome_button1.dart';
import '/screens/auth/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              const Text(
                'Smart Grocery',
                style: TextStyle(
                  color: yellow,
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Lottie.asset(basket),
              Expanded(
                child: Container(),
              ),
              WelcomeButton(
                text: 'Continue as Company',
                color: Colors.white,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                ),
              ),
              const SizedBox(height: 20.0),
              WelcomeButton1(
                text: 'Continue as Customer',
                color: navblue,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomerLoginScreen(),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
