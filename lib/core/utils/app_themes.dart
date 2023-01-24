import 'package:flutter/material.dart';
import 'package:responsive_movies_app/core/utils/app_colors.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    splashColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: AppSize.s0,
        backgroundColor: AppColors.primaryColor,
        shape: const StadiumBorder(),
        maximumSize: const Size(double.infinity, AppSize.s48),
        minimumSize: const Size(double.infinity, AppSize.s48),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.primaryLightColor,
      iconColor: AppColors.primaryColor,
      prefixIconColor: AppColors.primaryColor,
      contentPadding: EdgeInsets.symmetric(
          horizontal: AppPadding.p16, vertical: AppPadding.p16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s30)),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
