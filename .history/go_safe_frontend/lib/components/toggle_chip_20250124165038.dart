import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/constants/k_animation_duration.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/cubit/login_signup_switch_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

class ToggleChip extends StatelessWidget {
  const ToggleChip({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginSignupSwitchCubit, LoginSignupSwitchState>(
      builder: (context, state) {
        void switchState() => context.read<LoginSignupSwitchCubit>().updateState();
        var activeTextColor = AppColors.primary(context);
        var inactiveTextColor = AppColors.secondary(context);
        return Stack(
          children: [
            //* Gives bg color of whole switch
            VxBox().color(Theme.of(context).highlightColor).withRounded().make(),
            //* Aligns to active state
            AnimatedAlign(
              duration: kDuration,
              alignment: state is LoginSwitch ? Alignment.centerLeft : Alignment.centerRight,
              child: VxBox().color(AppColors.accent(context)).width(context.percentWidth * 25).withRounded().make(),
            ),
            //* Login button
            Align(
              alignment: Alignment.centerLeft,
              child: CupertinoButton(
                onPressed: () => state is SignupSwitch ? switchState() : null,
                padding: const EdgeInsets.all(0),
                child: "Login".text.semiBold.color(state is LoginSwitch ? activeTextColor : inactiveTextColor).make(),
              ).box.width(context.percentWidth * 25).make(),
            ),
            //* Signup button
            Align(
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                onPressed: () => state is LoginSwitch ? switchState() : null,
                padding: const EdgeInsets.all(0),
                child: "Signup".text.semiBold.color(state is SignupSwitch ? activeTextColor : inactiveTextColor).make(),
              ).box.width(context.percentWidth * 25).make(),
            ),
          ],
        ).box.width(context.percentWidth * 50).height(45).makeCentered();
      },
    );
  }
}
