import 'package:flutter/material.dart';

class LightThemeData {
  static ThemeData themeData = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light().copyWith(
      background: const Color(0xFFf9fafb),
      primaryContainer: const Color(0xFFffffff),
      onPrimaryContainer: const Color(0xFFf9fafb),
    ),
  );
}
