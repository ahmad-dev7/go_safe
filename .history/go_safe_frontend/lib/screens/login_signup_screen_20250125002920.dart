import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_safe/components/toggle_chip.dart';
import 'package:go_safe/constants/k_app_colors.dart';
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
                      const HeightBox(kSectionGap * 3),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.primary(context),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.accent(context)),
                            borderRadius: BorderRadius.circular(kBorderRadius),
                          ),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(kBorderRadius)),
                          contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
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
