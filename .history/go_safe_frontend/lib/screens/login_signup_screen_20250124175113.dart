import 'package:flutter/material.dart';
import 'package:go_safe/components/toggle_chip.dart';
import 'package:go_safe/constants/k_values.dart';
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
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Flexible(child: Lottie.asset("assets/animations/auth_screen_animation.json")),
                  const HeightBox(kSectionGap),
                  const ToggleChip(),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [
                      const HeightBox(kSectionGap * 2),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(kBorderRadius), borderSide: const BorderSide()),
                        ),
                      ),
                    ],
                  ).px20(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
