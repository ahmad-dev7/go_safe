import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_values.dart';
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
        var indicatorColor = AppColors.accent(context);
        //* Width of combined chip [60% of screen width]. Buttons are using half of it [totalWidth * 0.5]
        var totalWidth = context.percentWidth * 60;
        return Stack(
          children: [
            //* Gives bg color of whole switch
            VxBox().color(activeTextColor).border(color: indicatorColor).withRounded().make(),
            //* Aligns to active state
            AnimatedAlign(
              duration: kDuration,
              alignment: state is LoginSwitch ? Alignment.centerLeft : Alignment.centerRight,
              child: VxBox().color(indicatorColor).width(totalWidth * 0.5).withRounded().make(),
            ),
            //* Login button
            Align(
              alignment: Alignment.centerLeft,
              child: CupertinoButton(
                onPressed: () => state is SignupSwitch ? switchState() : null,
                padding: const EdgeInsets.all(0),
                child: "Login".text.color(state is LoginSwitch ? activeTextColor : inactiveTextColor).make(),
              ).box.width(totalWidth * 0.5).make(),
            ),
            //* Signup button
            Align(
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                onPressed: () => state is LoginSwitch ? switchState() : null,
                padding: const EdgeInsets.all(0),
                child: "Signup".text.color(state is SignupSwitch ? activeTextColor : inactiveTextColor).make(),
              ).box.width(totalWidth * 0.5).make(),
            ),
          ],
        ).box.width(totalWidth).height(40).makeCentered();
      },
    );
  }
}
