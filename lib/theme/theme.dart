import 'package:flutter/material.dart';

import '../color/colors.dart';

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
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      appBarTheme: AppBarTheme(color: AppColors.whiteColor, elevation: 25.0),
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      hoverColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      primaryColor: AppColors.primaryColor,
      splashFactory: NoSplash.splashFactory,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
      ),
      iconTheme: IconThemeData(color: AppColors.whiteColor),
    );
  }
}
