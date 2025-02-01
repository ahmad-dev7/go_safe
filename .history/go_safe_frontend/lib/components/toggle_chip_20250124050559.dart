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
          child: VxBox().green100.width(context.percentWidth * 25).roundedLg.make(),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: CupertinoButton.filled(
            child: "Login".text.make().box.width(context.percentWidth * 25).makeCentered(),
            onPressed: () {},
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CupertinoButton.filled(
            child: "Signup".text.make(),
            onPressed: () {},
          ),
        ),
      ],
    ).box.width(context.percentWidth * 50).height(50).makeCentered();
  }
}
