import 'package:flutter/material.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:velocity_x/velocity_x.dart';

class InfoTile extends StatefulWidget {
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
  State<InfoTile> createState() => _InfoTileState();
}

class _InfoTileState extends State<InfoTile> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        visualDensity: VisualDensity.compact,
        foregroundColor: AppColors.accent(context),
        side: BorderSide(
          color: widget.borderColor ?? AppColors.border(context),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kBorderRadius)),
        minimumSize: const Size(double.maxFinite, 65),
      ),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        minVerticalPadding: 0,
        title: widget.title.text.bodyLarge(context).bold.make(),
        subtitle: widget.subtitle.text.make(),
        leading: widget.leading,
        trailing: widget.trailing,
      ),
    );
  }
}
