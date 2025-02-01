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
            const HeightBox(kElementGap),
            Center(
              child: Lottie.asset(
                "assets/animations/auth_screen_animation.json",
                fit: BoxFit.fitHeight,
                height: context.percentHeight * 35,
              ),
            ),
            const HeightBox(kSectionGap),
            const ToggleChip(),
            const HeightBox(kElementGap),
          ],
        ),
      ),
    );
  }
}
