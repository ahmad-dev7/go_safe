import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ToggleChip extends StatelessWidget {
  const ToggleChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CupertinoButton.filled(
          child: "Login".text.make(),
          onPressed: () {},
        ),
        CupertinoButton.filled(
          child: "Login".text.make(),
          onPressed: () {},
        ),
      ],
    ).box.height(100).makeCentered();
  }
}
