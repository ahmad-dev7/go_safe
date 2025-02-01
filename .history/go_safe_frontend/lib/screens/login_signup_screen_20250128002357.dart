import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/components/signup_field.dart';
import 'package:go_safe/components/toggle_chip.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_validator.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:go_safe/cubit/login_cubit.dart';
import 'package:go_safe/cubit/login_signup_switch_cubit.dart';
import 'package:go_safe/cubit/signup_cubit.dart';
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
              flex: 3,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      //* Name field [Only for Signup]
                      SignupField(
                        child: TextFormField(
                          validator: validateName,
                          decoration: const InputDecoration(
                            labelText: "Name",
                            prefixIcon: Icon(CupertinoIcons.person),
                          ),
                        ).pOnly(bottom: kElementGap),
                      ),
                      //* Phone number field [only for Signup]
                      SignupField(
                        child: TextFormField(
                          validator: validateEmail,
                          decoration: const InputDecoration(
                            labelText: "Phone Number",
                            prefixIcon: Icon(CupertinoIcons.phone),
                          ),
                        ).pOnly(bottom: kElementGap),
                      ),
                      //* Email field
                      TextFormField(
                        validator: validateEmail,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(CupertinoIcons.mail),
                        ),
                      ).pOnly(bottom: kElementGap),
                      //* Password field
                      TextFormField(
                        validator: validateEmail,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(CupertinoIcons.lock),
                        ),
                      ).pOnly(bottom: kElementGap),
                      //* Submit button
                      BlocBuilder<LoginSignupSwitchCubit, LoginSignupSwitchState>(
                        // This builder notifies for current state is login or signup
                        builder: (context, loginSignupSwitchState) {
                          bool isLogin = loginSignupSwitchState is LoginSwitch;
                          return BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, loginActionState) {
                              return BlocBuilder<SignupCubit, SignupState>(builder: (context, signupActionState) {
                                return InkWell(
                                  onTap: () {},
                                  child: VxBox(
                                    child: (isLogin ? "Login" : "Signup")
                                        .text
                                        .white
                                        .semiBold
                                        .bodyLarge(context)
                                        .makeCentered(),
                                  ).size(double.maxFinite, 50).color(AppColors.accent(context)).roundedSM.make(),
                                );
                              });
                            },
                          );
                        },
                      ),
                    ],
                  ).px(kHorizontalPadding),
                ),
              ).pOnly(top: kSectionGap),
            ),
          ],
        ),
      ),
    );
  }
}
