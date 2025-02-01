import 'package:flutter/material.dart';

class DarkThemeData {
  static ThemeData themeData = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark().copyWith(
      background: const Color(0xFF162036), //* For scaffold background colors
      primaryContainer: const Color(0xFF1f2937), //* For containers just on top of scaffold [Primary Container]
      onPrimaryContainer: const Color(0xFFf9fafb), //* For for containers on top of primary container
      secondary: const Color(0xFF6b7280), //* For subtitle texts
      tertiary: const Color(0xFF16bc88), //* For accent colors
    ),
    iconTheme: const IconThemeData().copyWith(
      color: const Color(0xFF16bc88), //* For icons color
    ),
  );
}
