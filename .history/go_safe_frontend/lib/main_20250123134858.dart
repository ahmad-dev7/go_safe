import 'package:flutter/material.dart';
import 'package:go_safe/screens/login_signup_screen.dart';
import 'package:go_safe/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Safe',
      routes: <String, WidgetBuilder>{
        '/': (context) => const SplashScreen(),
        "LoginSignup": (context) => const LoginSignupScreen(),
      },
    );
  }
}
