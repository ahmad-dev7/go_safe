import 'package:flutter/material.dart';
import 'package:go_safe/components/toggle_chip.dart';
import 'package:go_safe/constants/k_heights.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Center(
                child: Lottie.asset(
                  "assets/animations/auth_screen_animation.json",
                  fit: BoxFit.fitHeight,
                  height: context.percentHeight * 35,
                ),
              ),
              subtitle: const ToggleChip().py12(),
            ),
            const Form(child: Column())
          ],
        ),
      ),
    );
  }
}
