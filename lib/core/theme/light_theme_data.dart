import 'package:flutter/material.dart';
import 'package:hungry_app/core/styling/app_colors.dart';
import 'package:hungry_app/core/styling/App_text_styles.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary300,
      brightness: Brightness.light,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: AppColors.grey900,
      displayColor: AppColors.grey900,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary300,
        foregroundColor: AppColors.grey0,
        disabledBackgroundColor: AppColors.grey100,
        disabledForegroundColor: AppColors.grey0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStyles.mSemiBold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.grey300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.grey300, width: 0.4),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.grey300, width: 0.7),
      ),
      fillColor: Colors.transparent.withOpacity(0.3),
      filled: true,
      hintStyle: AppTextStyles.mRegular.copyWith(color: AppColors.white),
    ),
  );
}
