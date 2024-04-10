import 'package:flutter/material.dart';
import 'color_theme.dart';

enum AppTheme{
  Orange,
  Green,
  Purple,
  Blue
}

ColorScheme getAppTheme(AppTheme theme, ThemeMode mode) {
  switch (theme) {
    case AppTheme.Orange:
      return _getThemeData(
        primaryColor: primaryOrange,
        onPrimary: OnPrimaryOrange,
        secondary: secondaryOrange,
        onSecondary: OnSecondaryOrange,
        mode: mode,
      );
    case AppTheme.Green:
      return _getThemeData(
        primaryColor: primaryGreen,
        onPrimary: OnPrimaryGreen,
        secondary: secondaryGreen,
        onSecondary: OnSecondaryGreen,
        mode: mode,
      );
    case AppTheme.Purple:
      return _getThemeData(
        primaryColor: primaryPurple,
        onPrimary: OnPrimaryPurple,
        secondary: secondaryPurple,
        onSecondary: OnSecondaryPurple,
        mode: mode,
      );
    case AppTheme.Blue:
      return _getThemeData(
        primaryColor: primaryBlue,
        onPrimary: OnPrimaryBlue,
        secondary: secondaryBlue,
        onSecondary: OnSecondaryBlue,
        mode: mode,
      );
  }
}

ColorScheme _getThemeData({
  required Color primaryColor,
  required Color onPrimary,
  required Color secondary,
  required Color onSecondary,
  required ThemeMode mode,
}) {
  final isDarkMode = mode == ThemeMode.dark;

  return isDarkMode
        ? ColorScheme.dark(
      primary: primaryColor,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
    )
        : ColorScheme.light(
      primary: primaryColor,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
    );
}


// final appTheme={
//   AppTheme.Orange:ThemeData(
//  primaryColor: primaryOrange,
//     colorScheme: ColorScheme.light(
//       primary: primaryOrange,
//       onPrimary: OnPrimaryOrange,
//       secondary: secondaryOrange,
//       onSecondary: OnSecondaryOrange
//     )
//   ),
//
//   AppTheme.Green:ThemeData(
//       primaryColor: primaryGreen,
//       colorScheme: ColorScheme.light(
//         primary: primaryGreen,
//         onPrimary: OnPrimaryGreen,
//         secondary: secondaryGreen,
//         onSecondary: OnSecondaryGreen,
//       )
//   ),
//
//    AppTheme.Purple:ThemeData(
//      primaryColor: primaryPurple,
//      colorScheme: ColorScheme.light(
//        primary: primaryPurple,
//          onPrimary: OnPrimaryPurple,
//          secondary: secondaryPurple,
//          onSecondary: OnSecondaryPurple,
//          )
//    ),
//
//   AppTheme.Blue:ThemeData(
//     primaryColor: primaryBlue,
//       colorScheme: ColorScheme.light(
//         primary: primaryBlue,
//         onPrimary: OnPrimaryBlue,
//         secondary: secondaryBlue,
//         onSecondary: OnSecondaryBlue,
//       )
//   ),
//
