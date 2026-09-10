import '../const/global_border_radius.dart';
import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  colorSchemeSeed: AppColors.primaryBlue,
  snackBarTheme: SnackBarThemeData(behavior: SnackBarBehavior.floating),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(),
    color: AppColors.primaryDark,
    centerTitle: true,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.primaryBlue.withOpacity(0.65),
  ),
  scaffoldBackgroundColor: AppColors.primaryDark,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.surfaceDark,
    filled: true,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(globalBorderRadius),
      borderSide: BorderSide(color: AppColors.primaryRed),
    ),
    errorStyle: TextStyle(color: AppColors.primaryRed),
    hintStyle: TextStyle(fontSize: 14, color: Colors.white60),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(globalBorderRadius),
      borderSide: BorderSide(width: 1),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      backgroundColor: WidgetStatePropertyAll(AppColors.primaryBlue),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(globalBorderRadius),
        ),
      ),
    ),
  ),

  cardTheme: CardThemeData(
    color: AppColors.backgroundDark,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(globalBorderRadius),
    ),
  ),

  dialogTheme: DialogThemeData(
    backgroundColor: Color.alphaBlend(
      AppColors.primaryBlue.withValues(alpha: 0.2),
      AppColors.primaryDark,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(globalBorderRadius),
      side: BorderSide(color: Colors.white.withValues(alpha: 0.15), width: 1.5),
    ),
  ),
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(globalBorderRadius),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(globalBorderRadius),
        ),
      ),
      foregroundColor: WidgetStatePropertyAll(Colors.grey.shade300),
      side: WidgetStatePropertyAll(BorderSide(color: Colors.grey.shade300)),
    ),
  ),

  chipTheme: ChipThemeData(
    backgroundColor: AppColors.backgroundDark,
    labelStyle: TextStyle(color: Colors.white),
    labelPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    selectedColor: AppColors.primaryBlue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(globalBorderRadius),

      side: BorderSide(
        color: Color.alphaBlend(
          AppColors.backgroundDark.withValues(alpha: 0.5),
          AppColors.primaryBlue.withValues(alpha: 0.25),
        ),
      ),
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(color: AppColors.repBlue),
    backgroundColor: AppColors.surfaceDark,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(Colors.white),

      backgroundColor: WidgetStatePropertyAll(AppColors.primaryBlue),
    ),
  ),
  textTheme: GoogleFonts.spaceGroteskTextTheme(ThemeData.dark().textTheme),
  popupMenuTheme: PopupMenuThemeData(
    color: AppColors.backgroundDark,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(globalBorderRadius),
      side: BorderSide(color: Colors.white.withValues(alpha: 0.1), width: 2),
    ),
  ),
);

abstract class AppThemeData {
  static const double globalBorderRadius = 12;
  static TextStyle defaultTextStyle = GoogleFonts.spaceGrotesk();
}
