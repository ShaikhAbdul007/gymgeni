import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      highlightColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      primaryColor: AppColors.whiteColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      splashFactory: NoSplash.splashFactory,
      focusColor: AppColors.transparent,
      hoverColor: AppColors.transparent,
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.whiteColor,
        elevation: 25.0,
      ),
      iconTheme: const IconThemeData(color: AppColors.blackColor),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      hoverColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      primaryColor: AppColors.blackColor,
      splashFactory: NoSplash.splashFactory,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
      ),
      iconTheme: IconThemeData(color: AppColors.whiteColor),
    );
  }
}
