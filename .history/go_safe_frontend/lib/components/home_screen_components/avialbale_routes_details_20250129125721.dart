import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/components/info_tile.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:velocity_x/velocity_x.dart';

class AvailableRoutesDetails extends StatefulWidget {
  const AvailableRoutesDetails({super.key});

  @override
  State<AvailableRoutesDetails> createState() => _AvailableRoutesDetailsState();
}

class _AvailableRoutesDetailsState extends State<AvailableRoutesDetails> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: VxBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Route Information".text.size(20).bold.make(),
            HeightBox(kVerticalPadding),
            InfoTile(
              title: "Safest Route",
              subtitle: "Via Central Park",
              borderColor: AppColors.accent(context),
              leading: const Icon(CupertinoIcons.shield_lefthalf_fill),
            ),
            HeightBox(kVerticalPadding),
            InfoTile(
              title: "Alternative Route",
              subtitle: "Via Broadway",
              borderColor: AppColors.border(context),
            ),
            HeightBox(kVerticalPadding),
            VxBox(child: "Start Navigation".text.white.bodyLarge(context).bold.makeCentered())
                .height(55)
                .rounded
                .color(AppColors.accent(context))
                .make(),
          ],
        ).px(kHorizontalPadding).py12(),
      ).color(AppColors.primary(context)).topRounded(value: 20).make(),
    );
  }
}
