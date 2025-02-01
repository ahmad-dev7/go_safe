import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/components/toggle_chip.dart';
import 'package:go_safe/constants/k_validator.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginSignupScreen extends StatelessWidget {
  const LoginSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormFieldState>();
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
                        validator: validateEmail,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(CupertinoIcons.mail),
                        ),
                      ),
                      const HeightBox(kSectionGap),
                      CupertinoButton(onPressed: () => '', child: "Submit".text.make())
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
