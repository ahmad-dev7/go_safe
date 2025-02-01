import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/components/action_button.dart';
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
        child: ExpansionTile(
          title: "Route Information".text.size(20).bold.make(),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Route Information".text.size(20).bold.make(),
              HeightBox(kVerticalPadding),
              InfoTile(
                title: "Safest Route",
                subtitle: "Via Central Park",
                borderColor: AppColors.accent(context),
                leading: Icon(
                  CupertinoIcons.shield_lefthalf_fill,
                  color: AppColors.accent(context),
                ),
                trailing: "12 min".text.make(),
              ),
              HeightBox(kVerticalPadding),
              InfoTile(
                title: "Alternative Route",
                subtitle: "Via Broadway",
                borderColor: AppColors.border(context),
                leading: Icon(
                  CupertinoIcons.shield_lefthalf_fill,
                  color: AppColors.warning(),
                ),
                trailing: "8 min".text.make(),
              ),
              HeightBox(kVerticalPadding),
              ActionButton(label: "Start Navigation", onTap: () {}),
            ],
          ).px(kHorizontalPadding).py12(),
        ),
      ).color(AppColors.primary(context)).topRounded(value: 20).make(),
    );
  }
}
