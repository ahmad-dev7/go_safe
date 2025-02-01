import 'package:flutter/material.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:velocity_x/velocity_x.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const ActionButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        //side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        minimumSize: const Size(double.maxFinite, 55),
        backgroundColor: AppColors.accent(context),
      ),
      child: label.text.white.bodyLarge(context).bold.makeCentered(),
    );
  }
}
