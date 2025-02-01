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
            VxBox(
              child: ListTile(
                dense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                minVerticalPadding: 0,
                title: "Alternative Route".text.bodyLarge(context).bold.make(),
                subtitle: "Via Broadway".text.make(),
                leading: const Icon(
                  CupertinoIcons.shield_lefthalf_fill,
                  color: Vx.yellow500,
                ),
                trailing: "10 min".text.bold.make(),
              ),
            )
                .height(65)
                .rounded
                .color(AppColors.primary(context))
                .border(color: AppColors.secondary(context).withOpacity(.2))
                .makeCentered(),
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
