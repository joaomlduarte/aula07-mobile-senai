import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTheme {
  static final ThemeData appTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.backgroundColor),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(foregroundColor: AppColors.mainColor),
    ),
  );
}
