import 'package:flutter/material.dart';

class AppColors {
  static Color primary(BuildContext context) => Theme.of(context).colorScheme.primaryContainer;

  static Color onPrimary(BuildContext context) => Theme.of(context).colorScheme.onPrimaryContainer;

  static Color secondary(BuildContext context) => Theme.of(context).colorScheme.secondary;

  static Color background(BuildContext context) => Theme.of(context).colorScheme.background;

  static Color accent(BuildContext context) => Theme.of(context).colorScheme.tertiary;
}
