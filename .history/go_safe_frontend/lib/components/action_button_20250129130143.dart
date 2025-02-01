import 'package:flutter/material.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:velocity_x/velocity_x.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const ActionButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 55),
        backgroundColor: AppColors.accent(context),
      ),
      child: label.text.bodyLarge(context).bold.makeCentered(),
    );
  }
}
