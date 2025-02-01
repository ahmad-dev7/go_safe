import 'package:flutter/material.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:velocity_x/velocity_x.dart';

class InfoTile extends StatelessWidget {
  final Color? borderColor;
  final String title, subtitle;
  final Widget? leading, trailing;
  final double? height;

  const InfoTile({
    super.key,
    this.borderColor,
    required this.title,
    required this.subtitle,
    this.leading,
    this.trailing,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        visualDensity: VisualDensity.compact,
        surfaceTintColor: borderColor,
        side: BorderSide(
          color: borderColor ?? AppColors.border(context),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kBorderRadius)),
        minimumSize: const Size(double.maxFinite, 65),
      ),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        minVerticalPadding: 0,
        title: title.text.bodyLarge(context).bold.make(),
        subtitle: subtitle.text.make(),
        leading: leading,
        trailing: trailing,
      ),
    );
  }
}


/*
VxBox(
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        minVerticalPadding: 0,
        title: title.text.bodyLarge(context).bold.make(),
        subtitle: subtitle.text.make(),
        leading: leading,
        trailing: trailing,
      ),
    )
        .height(height ?? 65)
        .rounded
        .border(color: borderColor ?? AppColors.secondary(context).withOpacity(.2))
        .makeCentered();
 */