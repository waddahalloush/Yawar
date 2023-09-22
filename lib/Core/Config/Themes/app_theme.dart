import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTheme {
  static const double fSize = 4;
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(primary: LightAppColor.primaryColorLight),
    //App Base Font Family
    fontFamily: "ElMessiri",
    // App Base Colors
    primaryColor: LightAppColor.primaryColor,
    indicatorColor: const Color(0xFF123B50),
    disabledColor: const Color(0xFFD0DCE1),
    primaryColorLight: LightAppColor.primaryColorLight,
    primaryColorDark: LightAppColor.primaryColorDark,
    shadowColor: LightAppColor.shadowColor,
    scaffoldBackgroundColor: LightAppColor.backgroundColor,
    dividerColor: LightAppColor.primaryColorDark,
    //App Base theme
    iconTheme: IconThemeData(color: LightAppColor.primaryColor),
    dividerTheme: const DividerThemeData(
      color: Colors.grey,
      thickness: 2,
    ),
    inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: Colors.indigo,
        labelStyle: TextStyle(
            fontSize: fSize * 3.sp,
            fontWeight: FontWeight.w800,
            color: LightAppColor.displayColor)),

    drawerTheme:
        DrawerThemeData(backgroundColor: LightAppColor.backgroundColor),
    appBarTheme: AppBarTheme(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
      backgroundColor: LightAppColor.backgroundColor,
    ),
    //App Primary Text Theme
    primaryTextTheme: TextTheme(
      displayLarge: TextStyle(
          fontSize: fSize * 6.sp,
          fontWeight: FontWeight.w900,
          color: LightAppColor.displayColor),
      displayMedium: TextStyle(
          fontSize: fSize * 4.3.sp,
          color: LightAppColor.displayColor,
          fontWeight: FontWeight.w900),
      displaySmall: TextStyle(
          fontSize: fSize * 3.sp,
          color: LightAppColor.displayColor,
          fontWeight: FontWeight.w900),
      headlineLarge: TextStyle(
        color: LightAppColor.headlineColor,
        fontSize: fSize * 6.sp,
        fontWeight: FontWeight.w900,
      ),
      headlineMedium: TextStyle(
          fontSize: fSize * 4.3.sp,
          color: LightAppColor.headlineColor,
          fontWeight: FontWeight.w900),
      headlineSmall: TextStyle(
          color: LightAppColor.headlineColor,
          fontSize: fSize * 3.sp,
          fontWeight: FontWeight.w900),
      titleLarge: TextStyle(
          fontSize: fSize * 6.sp,
          color: LightAppColor.titleColor,
          fontWeight: FontWeight.w900),
      titleMedium: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: fSize * 4.3.sp,
          color: LightAppColor.titleColor),
      titleSmall: TextStyle(
          fontSize: fSize * 3.sp,
          color: LightAppColor.titleColor,
          fontWeight: FontWeight.w900),
      bodyLarge: TextStyle(
          fontSize: fSize * 6.sp,
          color: LightAppColor.bodyColor,
          fontWeight: FontWeight.w900),
      bodyMedium: TextStyle(
          fontSize: fSize * 4.3.sp,
          color: LightAppColor.bodyColor,
          fontWeight: FontWeight.w900),
      bodySmall: TextStyle(
          color: LightAppColor.bodyColor,
          fontSize: fSize * 3.sp,
          fontWeight: FontWeight.w900),
      labelLarge: TextStyle(
          color: LightAppColor.labelColor,
          fontSize: fSize * 6.sp,
          fontWeight: FontWeight.w900),
      labelMedium: TextStyle(
          color: LightAppColor.labelColor,
          fontSize: fSize * 4.3.sp,
          fontWeight: FontWeight.w900),
      labelSmall: TextStyle(
          color: LightAppColor.labelColor,
          fontSize: fSize * 2.5.sp,
          fontWeight: FontWeight.w900),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    //App Base Font Family
    fontFamily: "ElMessiri",
    // App Base Colors
    primaryColor: DarkAppColor.primaryColor,
    colorScheme: ColorScheme.dark(primary: DarkAppColor.primaryColorLight),
    primaryColorLight: DarkAppColor.primaryColorLight,
    primaryColorDark: DarkAppColor.primaryColorDark,
    shadowColor: DarkAppColor.shadowColor,
    scaffoldBackgroundColor: DarkAppColor.backgroundColor,
    dividerColor: DarkAppColor.primaryColorDark,
    //App Base theme
    iconTheme: IconThemeData(
      color: DarkAppColor.primaryColor,
      size: 30.r,
    ),
    dividerTheme: const DividerThemeData(color: Colors.grey, thickness: 2),

    inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: Colors.amber,
        labelStyle: TextStyle(
            fontSize: fSize * 3.sp,
            fontWeight: FontWeight.bold,
            color: DarkAppColor.displayColor)),

    drawerTheme: DrawerThemeData(backgroundColor: DarkAppColor.backgroundColor),
    appBarTheme: AppBarTheme(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      backgroundColor: DarkAppColor.backgroundColor,
    ),
    //App Primary Text Theme
    primaryTextTheme: TextTheme(
      displayLarge: TextStyle(
          fontSize: fSize * 6.sp,
          fontWeight: FontWeight.w900,
          color: DarkAppColor.displayColor),
      displayMedium: TextStyle(
          fontSize: fSize * 4.3.sp,
          color: DarkAppColor.displayColor,
          fontWeight: FontWeight.w900),
      displaySmall: TextStyle(
          fontSize: fSize * 3.sp,
          color: DarkAppColor.displayColor,
          fontWeight: FontWeight.w900),
      headlineLarge: TextStyle(
        color: DarkAppColor.headlineColor,
        fontSize: fSize * 6.sp,
        fontWeight: FontWeight.w900,
      ),
      headlineMedium: TextStyle(
          fontSize: fSize * 4.3.sp,
          color: DarkAppColor.headlineColor,
          fontWeight: FontWeight.w900),
      headlineSmall: TextStyle(
          color: DarkAppColor.headlineColor,
          fontSize: fSize * 3.sp,
          fontWeight: FontWeight.w900),
      titleLarge: TextStyle(
          fontSize: fSize * 6.sp,
          color: DarkAppColor.titleColor,
          fontWeight: FontWeight.w900),
      titleMedium: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: fSize * 4.3.sp,
          color: DarkAppColor.titleColor),
      titleSmall: TextStyle(
          fontSize: fSize * 3.sp,
          color: DarkAppColor.titleColor,
          fontWeight: FontWeight.w900),
      bodyLarge: TextStyle(
          fontSize: fSize * 6.sp,
          color: DarkAppColor.bodyColor,
          fontWeight: FontWeight.w900),
      bodyMedium: TextStyle(
          fontSize: fSize * 4.3.sp,
          color: DarkAppColor.bodyColor,
          fontWeight: FontWeight.w900),
      bodySmall: TextStyle(
          color: DarkAppColor.bodyColor,
          fontSize: fSize * 3.sp,
          fontWeight: FontWeight.w900),
      labelLarge: TextStyle(
          color: DarkAppColor.labelColor,
          fontSize: fSize * 6.sp,
          fontWeight: FontWeight.w900),
      labelMedium: TextStyle(
          color: DarkAppColor.labelColor,
          fontSize: fSize * 4.3.sp,
          fontWeight: FontWeight.w900),
      labelSmall: TextStyle(
          color: DarkAppColor.labelColor,
          fontSize: fSize * 2.5.sp,
          fontWeight: FontWeight.w900),
    ),
  );
}
