import 'package:air_conditioner_ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // theme
  static final ThemeData appTheme = ThemeData(
    brightness: Brightness.dark,

    primaryColor: AppColors.primaryColor,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      onPrimary: AppColors.whiteColor,
      secondary: AppColors.primaryColor,
      onSecondary: AppColors.whiteColor,
      surface: AppColors.backgroundColor,
      onSurface: AppColors.whiteColor,
      background: AppColors.backgroundColor,
      onBackground: AppColors.whiteColor,
      error: Colors.red,
      onError: AppColors.whiteColor,
    ),

    scaffoldBackgroundColor: AppColors.backgroundColor,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.whiteColor,
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        color: AppColors.primaryColor,
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(fontFamily: 'Poppins', color: AppColors.whiteColor),
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        color: AppColors.primaryColor,
        fontSize: 20,
      ),

      // heading
      headlineLarge: TextStyle(
        fontFamily: 'Poppins',
        color: AppColors.whiteColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Poppins',
        color: AppColors.whiteColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Poppins',
        color: AppColors.whiteColor,
        fontSize: 20,
      ),

      // tittle
      titleLarge: TextStyle(fontFamily: 'Poppins', color: AppColors.whiteColor),
      titleMedium: TextStyle(
        fontFamily: 'Poppins',
        color: AppColors.whiteColor,
      ),
      titleSmall: TextStyle(fontFamily: 'Poppins', color: AppColors.whiteColor),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
        textStyle: const TextStyle(fontFamily: 'Poppins'),
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.whiteColor,
    ),

    cardTheme: const CardThemeData(color: AppColors.backgroundColor),

    iconTheme: const IconThemeData(color: AppColors.whiteColor),

    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),

    canvasColor: AppColors.backgroundColor,
  );
}
