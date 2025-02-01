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

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _name, _phoneNumber, _email, _password;
  @override
  Widget build(BuildContext context) {
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
                  key: _formKey,
                  child: Column(
                    children: [
                      const HeightBox(4),
                      //* Name field [Only for Signup]
                      SignupField(
                        child: TextFormField(
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.name,
                          validator: validateName,
                          onChanged: (value) => _name = value,
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
                          onChanged: (value) => _phoneNumber = value,
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
                        onChanged: (value) => _email = value,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(CupertinoIcons.mail),
                        ),
                      ).pOnly(bottom: kElementGap),
                      //* Password field
                      // Password field is separated in different file so that to toggle password visibility only that section would be rebuild
                      PasswordField(
                        onChanged: (value) => _password = value,
                      ).pOnly(bottom: kElementGap),
                      //* Submit button with conditional action of [Login] or [Signup]
                      SubmitButton(
                        onValidate: () => _formKey.currentState!.validate(),
                        onLogin: (loginCubit) => loginCubit.login(
                          _email,
                          _password,
                        ),
                        onSignup: (signupCubit) => signupCubit.signup(
                          name: _name,
                          phoneNumber: _phoneNumber,
                          email: _email,
                          password: _password,
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
