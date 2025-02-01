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
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class LoginSignupScreen extends StatelessWidget {
  const LoginSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    late String name, phoneNumber, email, password;
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
                      const HeightBox(4),
                      //* Name field [Only for Signup]
                      SignupField(
                        child: TextFormField(
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.name,
                          validator: validateName,
                          onChanged: (value) => name = value,
                          decoration: const InputDecoration(
                            labelText: "Name",
                            prefixIcon: Icon(CupertinoIcons.person),
                          ),
                        ).pOnly(bottom: kElementGap),
                      ),
                      //* Phone number field [only for Signup]
                      SignupField(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: validatePhoneNumber,
                          onChanged: (value) => phoneNumber = value,
                          decoration: const InputDecoration(
                            labelText: "Phone Number",
                            prefixIcon: Icon(CupertinoIcons.phone),
                          ),
                        ).pOnly(bottom: kElementGap),
                      ),
                      //* Email field
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail,
                        onChanged: (value) => email = value,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(CupertinoIcons.mail),
                        ),
                      ).pOnly(bottom: kElementGap),
                      //* Password field
                      // Password field is separated in different file so that to toggle password visibility only that section would be rebuild
                      PasswordField(
                        onChanged: (value) => password = value,
                      ).pOnly(bottom: kElementGap),
                      //* Submit button
                      MultiBlocListener(
                        listeners: [
                          BlocListener<LoginCubit, LoginState>(
                            listener: (ctx, loginState) {
                              if (loginState is LoginCompleted) {}
                              if (loginState is LoginFailed) {
                                var snackBar = SnackBar(
                                  content: AwesomeSnackbarContent(
                                    title: "Oops! Login failed",
                                    message: loginState.error,
                                    contentType: ContentType.failure,
                                  ),
                                );
                                ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
                              }
                            },
                          ),
                          BlocListener<SignupCubit, SignupState>(
                            listener: (ctx, signupState) {
                              if (signupState is SignupCompleted) {
                                print(signupState.userData.name);
                              }
                              if (signupState is SignupFailed) {
                                print(signupState.error);
                              }
                            },
                          ),
                        ],
                        child: BlocBuilder<LoginSignupSwitchCubit, LoginSignupSwitchState>(
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
                                        if (formKey.currentState!.validate()) {
                                          if (isLoginSwitch) {
                                            context.read<LoginCubit>().login(email.trim(), password);
                                          } else {
                                            context.read<SignupCubit>().signup(
                                                  name: name,
                                                  phoneNumber: phoneNumber,
                                                  email: email,
                                                  password: password,
                                                );
                                          }
                                        }
                                      },
                                      child: VxBox(
                                        child: isLoading
                                            ? const CircularProgressIndicator(color: Vx.white)
                                                .box
                                                .size(30, 30)
                                                .makeCentered()
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
