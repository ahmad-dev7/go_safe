import 'package:flutter/material.dart';

class LightThemeData {
  static ThemeData themeData = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light().copyWith(
      background: const Color(0xFFf9fafb), //* For scaffold background colors
      primaryContainer: const Color(0xFFffffff), //* For containers just on top of scaffold [Primary Container]
      onPrimaryContainer: const Color(0xFFf9fafb), //* For for containers on top of primary container
      secondary: const Color(0xFF6b7280), //* For subtitle texts
      tertiary: const Color(0xFF16bc88), //* For accent colors
    ),
    iconTheme: const IconThemeData().copyWith(
      color: const Color(0xFF16bc88), //* For icons color
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xFF16bc88), // Cursor color
      selectionColor: Color(0x3916BC87), // Text selection highlight color
      selectionHandleColor: Color(0xFF16bc88), // Selection handle (drag point) color
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFffffff), // Input field background color
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xFF16bc88)), // Accent color for focused input
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF6b7280)), // Accent for enabled input
      ),
    ),
  );
}
