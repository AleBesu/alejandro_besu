import 'package:flutter/material.dart';

/// Paleta de colores extraída del diseño original (dark theme, tema "cian/teal futurista").
class AppColors {
  AppColors._();

  static const background = Color(0xFF051424);
  static const surface = Color(0xFF051424);
  static const surfaceDim = Color(0xFF051424);
  static const surfaceBright = Color(0xFF2C3A4C);
  static const surfaceContainerLowest = Color(0xFF010F1F);
  static const surfaceContainerLow = Color(0xFF0D1C2D);
  static const surfaceContainer = Color(0xFF122131);
  static const surfaceContainerHigh = Color(0xFF1C2B3C);
  static const surfaceContainerHighest = Color(0xFF273647);
  static const surfaceVariant = Color(0xFF273647);

  static const primary = Color(0xFFDBFCFF);
  static const primaryContainer = Color(0xFF00F0FF);
  static const primaryFixedDim = Color(0xFF00DBE9);
  static const onPrimaryContainer = Color(0xFF006970);
  static const onBackground = Color(0xFFD4E4FA);
  static const onSurface = Color(0xFFD4E4FA);
  static const onSurfaceVariant = Color(0xFFB9CACB);

  static const secondary = Color(0xFF4EDEA3);
  static const secondaryContainer = Color(0xFF00A572);
  static const secondaryFixed = Color(0xFF6FFBBE);

  static const tertiary = Color(0xFFF5F5FF);
  static const tertiaryFixedDim = Color(0xFFBEC6E0);

  static const outline = Color(0xFF849495);
  static const outlineVariant = Color(0xFF3B494B);

  static const error = Color(0xFFFFB4AB);
}

class AppTextStyles {
  AppTextStyles._();

  static const displayLg = TextStyle(
    // fontFamily: _display,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.6,
    color: AppColors.primaryFixedDim,
    height: 1.15,
  );

  static const headlineMd = TextStyle(
    // fontFamily: _display,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.onSurface,
    height: 1.2,
  );

  static const bodyMd = TextStyle(
    // fontFamily: _body,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.onSurfaceVariant,
    height: 1.55,
  );

  static const labelCaps = TextStyle(
    // fontFamily: _mono,
    fontSize: 10,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.2,
    color: AppColors.primary,
  );

  static const codeSm = TextStyle(
    // fontFamily: _mono,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.onSurfaceVariant,
  );
}
