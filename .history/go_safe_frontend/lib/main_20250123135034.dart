import 'package:flutter/material.dart';
import 'package:go_safe/screens/home_screen.dart';
import 'package:go_safe/screens/login_signup_screen.dart';
import 'package:go_safe/screens/splash_screen.dart';
import 'package:go_safe/theme/dark_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Safe',
      theme: DarkThemeData.themeData,
      routes: <String, WidgetBuilder>{
        '/': (context) => const SplashScreen(),
        "LoginSignup": (context) => const LoginSignupScreen(),
        "home": (context) => const HomeScreen(),
      },
    );
  }
}
