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
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(kBorderRadius),
          topRight: Radius.circular(kBorderRadius),
        ),
        child: ExpansionTile(
          dense: true,
          shape: const Border(),
          initiallyExpanded: true,
          iconColor: AppColors.accent(context),
          backgroundColor: AppColors.primary(context),
          collapsedBackgroundColor: AppColors.primary(context),
          tilePadding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          childrenPadding: EdgeInsets.fromLTRB(
            kHorizontalPadding,
            kVerticalPadding / 2,
            kHorizontalPadding,
            kHorizontalPadding,
          ),
          title: "Route Information".text.size(18).bold.make(),
          children: [
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
        ),
      ),
    );
  }
}
