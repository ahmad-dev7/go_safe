import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:velocity_x/velocity_x.dart';

class ToggleChip extends StatelessWidget {
  const ToggleChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VxBox().color(Theme.of(context).highlightColor).withRounded().make(),
        Align(
          alignment: Alignment.centerLeft,
          child: VxBox().color(AppColors.accent(context)).width(context.percentWidth * 25).withRounded().make(),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: CupertinoButton(
            padding: const EdgeInsets.all(0),
            child: "Login".text.semiBold.color(AppColors.background(context)).make(),
            onPressed: () {},
          ).box.width(context.percentWidth * 25).make(),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CupertinoButton(
            padding: const EdgeInsets.all(0),
            child: "Signup".text.semiBold.color(Theme.of(context).colorScheme.background).make(),
            onPressed: () {},
          ).box.width(context.percentWidth * 25).make(),
        ),
      ],
    ).box.width(context.percentWidth * 50).height(45).makeCentered();
  }
}
