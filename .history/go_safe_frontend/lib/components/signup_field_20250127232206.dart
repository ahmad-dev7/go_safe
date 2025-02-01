import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:go_safe/cubit/login_signup_switch_cubit.dart';

//! Name and Phone Number textfield of Signup section uses this as a wrapper class for in-out animation

class SignupField extends StatelessWidget {
  final Widget textField;
  const SignupField({super.key, required this.textField});

  @override
  Widget build(BuildContext context) {
    Future<bool> showSignupField(bool signup) async {
      if (signup) {
        return true;
      } else {
        return Future.delayed(kDuration * 1.8).then((value) => false);
      }
    }

    return BlocBuilder<LoginSignupSwitchCubit, LoginSignupSwitchState>(
      builder: (context, state) {
        return FutureBuilder(
          future: showSignupField(state is SignupState),
          builder: (ctx, hideField) {
            if (hideField.hasData) {
              return AnimatedSize(
                duration: Durations.medium1,
                child: hideField.data!
                    ? const SizedBox()
                    : ZoomIn(
                        animate: state is SignupState,
                        duration: kDuration * 2,
                        child: textField,
                      ),
              );
            } else {
              return const SizedBox();
            }
          },
        );
      },
    );
  }
}
