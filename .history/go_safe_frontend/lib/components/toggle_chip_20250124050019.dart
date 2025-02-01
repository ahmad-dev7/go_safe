import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class ToggleChip extends StatelessWidget {
  const ToggleChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VxBox().pink500.roundedLg.makeCentered(),
        VxBox().white.width(100).roundedLg.makeCentered(),
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
            child: "Signup".text.make(),
            onPressed: () {},
          ),
        ),
      ],
    ).box.width(context.percentWidth * 50).height(50).makeCentered();
  }
}
