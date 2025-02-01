import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class ToggleChip extends StatelessWidget {
  const ToggleChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CupertinoButton(
            child: "Login".text.make(),
            onPressed: () {},
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CupertinoButton(
            child: "Login".text.make(),
            onPressed: () {},
          ),
        ),
      ],
    ).box.height(100).makeCentered();
  }
}
