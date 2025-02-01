import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ToggleChip extends StatelessWidget {
  const ToggleChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VxBox().color(Theme.of(context).hintColor).withRounded().make(),
        Align(
          alignment: Alignment.centerLeft,
          child: VxBox()
              .color(Theme.of(context).colorScheme.tertiary)
              .p0
              .width(context.percentWidth * 25)
              .withRounded()
              .make(),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: CupertinoButton(
            padding: const EdgeInsets.all(0),
            child: "Login".text.color(Theme.of(context).colorScheme.background).make(),
            onPressed: () {},
          ).box.width(context.percentWidth * 25).make(),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CupertinoButton(
            padding: const EdgeInsets.all(0),
            child: "Signup".text.color(Theme.of(context).colorScheme.background).make(),
            onPressed: () {},
          ).box.width(context.percentWidth * 25).make(),
        ),
      ],
    ).box.width(context.percentWidth * 50).height(45).makeCentered();
  }
}
