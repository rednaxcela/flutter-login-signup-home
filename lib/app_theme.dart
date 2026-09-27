import 'package:flutter/material.dart';

// Shared design constants so all three screens look consistent.
// Plain black and white, professional look: white background, black
// as the single accent, grays for structure. No color hues.
class AppColors {
  static const Color primary = Colors.black; // accent: buttons, AppBar, focus
  static const Color background = Colors.white;
  static const Color surface = Color(0xFFF5F5F5); // field fill
  static const Color border = Color(0xFFD0D0D0);
  static const Color textDark = Color(0xFF1A1A1A); // main text
  static const Color textMuted = Color(0xFF6E6E6E);
}

const double kFieldSpacing = 16.0;
const double kScreenPadding = 24.0;

// Reusable text field style so Login and Sign-Up look the same.
InputDecoration appInputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: AppColors.textMuted),
    filled: true,
    fillColor: AppColors.surface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.border),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.border),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
    ),
  );
}

// Text style for what the user types (dark text on the light field fill).
const TextStyle appInputTextStyle = TextStyle(color: AppColors.textDark);

// Reusable primary button style used on every screen.
// Black button with white text — the one accent in this palette.
ButtonStyle primaryButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    minimumSize: const Size.fromHeight(48),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );
}
