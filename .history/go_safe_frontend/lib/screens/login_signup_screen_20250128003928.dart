import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/components/password_field.dart';
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
                          validator: validatePhoneNumber,
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
                      const PasswordField(),
                      //* Submit button
                      BlocBuilder<LoginSignupSwitchCubit, LoginSignupSwitchState>(
                        // This builder notifies for current state is login or signup
                        builder: (context, loginSignupSwitch) {
                          bool isLoginSwitch = loginSignupSwitch is LoginSwitch;
                          // This builder notifies login action states
                          return BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, loginAction) {
                              // This builder notifies signup action states
                              return BlocBuilder<SignupCubit, SignupState>(
                                builder: (context, signupAction) {
                                  bool isLoading = loginAction is LoginStarted || signupAction is SignupStarted;
                                  return InkWell(
                                    onTap: () {
                                      if (!formKey.currentState!.validate()) {
                                        if (isLoginSwitch) {
                                          context.read<LoginCubit>().login("aali.dev7@gmail.com", "aali");
                                        } else {
                                          context.read<SignupCubit>().signup();
                                        }
                                      }
                                    },
                                    child: VxBox(
                                      child: isLoading
                                          ? const CircularProgressIndicator(color: Vx.white)
                                          : (isLoginSwitch ? "Login" : "Signup")
                                              .text
                                              .white
                                              .semiBold
                                              .bodyLarge(context)
                                              .makeCentered(),
                                    ).size(double.maxFinite, 50).color(AppColors.accent(context)).roundedSM.make(),
                                  );
                                },
                              );
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
