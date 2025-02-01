import 'package:flutter/material.dart';

class LightThemeData {
  static ThemeData themeData = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light().copyWith(
      /// For scaffold background colors
      background: const Color(0xFFf9fafb),
      primaryContainer: const Color(0xFFffffff), //* For containers just on top of scaffold
      onPrimaryContainer: const Color(0xFFf9fafb), //* For for containers on top of
      secondary: const Color(0xFF6b7280),
      tertiary: const Color(0xFF16bc88),
    ),
  );
}
