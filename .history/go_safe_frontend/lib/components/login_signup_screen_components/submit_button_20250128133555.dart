import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_snack_bar.dart';
import 'package:go_safe/cubit/login_cubit.dart';
import 'package:go_safe/cubit/login_signup_switch_cubit.dart';
import 'package:go_safe/cubit/signup_cubit.dart';
import 'package:go_safe/routes/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function(LoginCubit) onLogin;
  final Function(SignupCubit) onSignup;
  final bool Function() onValidate;
  const SubmitButton({
    super.key,
    required this.formKey,
    required this.onLogin,
    required this.onSignup,
    required this.onValidate,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginCubit, LoginState>(
          listener: (ctx, loginState) {
            if (loginState is LoginCompleted) {
              debugPrint("Login is taking me home");
              Navigator.pushReplacementNamed(context, Routes.screensNavigation);
            }
            if (loginState is LoginFailed) {
              kShowSnackBar(ctx, title: "Oops! Login failed", message: loginState.error);
            }
          },
        ),
        BlocListener<SignupCubit, SignupState>(
          listener: (ctx, signupState) {
            if (signupState is SignupCompleted) {
              debugPrint("signup is taking me home");
              Navigator.pushReplacementNamed(context, Routes.screensNavigation);
            }
            if (signupState is SignupFailed) {
              kShowSnackBar(ctx, title: "Oops! Signup failed", message: signupState.error);
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
                      if (onValidate()) {
                        if (isLoginSwitch) {
                          var loginCubit = context.read<LoginCubit>();
                          onLogin(loginCubit);
                        } else {
                          var signupCubit = context.read<SignupCubit>();
                          onSignup(signupCubit);
                        }
                      }
                    },
                    child: VxBox(
                      child: isLoading
                          ? const CircularProgressIndicator(color: Vx.white).box.size(30, 30).makeCentered()
                          : (isLoginSwitch ? "Login" : "Signup").text.white.semiBold.bodyLarge(context).makeCentered(),
                    ).size(double.maxFinite, 50).color(AppColors.accent(context)).roundedSM.make(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
