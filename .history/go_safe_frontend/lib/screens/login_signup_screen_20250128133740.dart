import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/components/login_signup_screen_components/password_field.dart';
import 'package:go_safe/components/login_signup_screen_components/signup_field.dart';
import 'package:go_safe/components/login_signup_screen_components/submit_button.dart';
import 'package:go_safe/components/login_signup_screen_components/toggle_chip.dart';
import 'package:go_safe/constants/k_validator.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

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
            //* Lottie animation and login/signup toggle chip
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
            //* Login/Signup input fields and Submit button
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
                      //* Submit button with conditional action of [Login] or [Signup]
                      SubmitButton(
                        onValidate: formKey.currentState!.validate,
                        onLogin: (loginCubit) => loginCubit.login(
                          email,
                          password,
                        ),
                        onSignup: (signupCubit) => signupCubit.signup(
                          name: name,
                          phoneNumber: phoneNumber,
                          email: email,
                          password: password,
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
