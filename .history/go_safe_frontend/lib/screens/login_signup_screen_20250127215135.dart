import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/components/toggle_chip.dart';
import 'package:go_safe/constants/k_validator.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:go_safe/cubit/login_signup_switch_cubit.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginSignupScreen extends StatelessWidget {
  const LoginSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Flexible(
                    child: Lottie.asset("assets/animations/auth_screen_animation.json"),
                  ),
                  const HeightBox(kSectionGap),
                  const ToggleChip(),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: BlocBuilder<LoginSignupSwitchCubit, LoginSignupSwitchState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          const HeightBox(kSectionGap),
                          //* Name field [Only for Signup]
                          if (state is SignupState)
                            Wrap(
                              direction: Axis.vertical,
                              children: [
                                TextFormField(
                                  validator: validateEmail,
                                  decoration: const InputDecoration(
                                    labelText: "Name",
                                    prefixIcon: Icon(CupertinoIcons.mail),
                                  ),
                                ),
                                const HeightBox(25),
                              ],
                            ),

                          TextFormField(
                            validator: validateEmail,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(CupertinoIcons.mail),
                            ),
                          ),
                          const HeightBox(25),
                          TextFormField(
                            validator: validateEmail,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(CupertinoIcons.mail),
                            ),
                          ),
                          const HeightBox(25),
                          TextFormField(
                            validator: validateEmail,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(CupertinoIcons.mail),
                            ),
                          ),
                          const HeightBox(25),
                          TextFormField(
                            validator: validateEmail,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(CupertinoIcons.mail),
                            ),
                          ),
                          const HeightBox(kSectionGap),
                          CupertinoButton.filled(
                            onPressed: () => formKey.currentState?.validate(),
                            child: "Submit".text.make(),
                          ),
                        ],
                      ).px20();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
