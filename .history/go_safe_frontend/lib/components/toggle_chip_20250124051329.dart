import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ToggleChip extends StatelessWidget {
  const ToggleChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: VxBox().green900.p0.width(context.percentWidth * 25).roundedLg.make(),
        ),
        VxBox()
            .color(
              Theme.of(context).colorScheme.primaryContainer,
            )
            .make(),
        Align(
          alignment: Alignment.centerLeft,
          child: CupertinoButton(
            color: Theme.of(context).colorScheme.primaryContainer,
            padding: const EdgeInsets.all(0),
            child: "Login".text.color(Theme.of(context).colorScheme.onBackground).make(),
            onPressed: () {},
          ).box.width(context.percentWidth * 25).make(),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CupertinoButton(
            padding: const EdgeInsets.all(0),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: "Signup".text.color(Theme.of(context).colorScheme.onBackground).make(),
            onPressed: () {},
          ).box.width(context.percentWidth * 25).make(),
        ),
      ],
    ).box.width(context.percentWidth * 50).height(50).makeCentered();
  }
}
