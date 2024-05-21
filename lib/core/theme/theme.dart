import 'package:flutter/material.dart';
import 'package:timesheet_app/core/theme/app_colors.dart';

// Function to get light theme data
ThemeData getLightTheme() {
  return ThemeData(
    primaryColor: primaryColorLight,
    scaffoldBackgroundColor: backgroundColorLight,
    cardColor: cardColorLight,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: textColorLight),
      bodyMedium: TextStyle(color: textColorLight),
      bodySmall: TextStyle(color: textColorLight),
      displayLarge: TextStyle(color: textColorLight),
      displayMedium: TextStyle(color: textColorLight),
      displaySmall: TextStyle(color: textColorLight),
      headlineLarge: TextStyle(color: textColorLight),
      headlineMedium: TextStyle(color: textColorLight),
      headlineSmall: TextStyle(color: textColorLight),
      titleLarge: TextStyle(color: textColorLight),
      titleMedium: TextStyle(color: textColorLight),
      titleSmall: TextStyle(color: textColorLight),
      labelLarge: TextStyle(color: textColorLight),
      labelMedium: TextStyle(color: textColorLight),
      labelSmall: TextStyle(color: textColorLight),
    ),
    colorScheme: const ColorScheme.light(
      primary: primaryColorLight,
      secondary: secondaryColorLight,
      background: backgroundColorLight,
      surface: cardColorLight,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onBackground: textColorLight,
      onSurface: textColorLight,
    ),
  );
}

// Function to get dark theme data
ThemeData getDarkTheme() {
  return ThemeData(
    primaryColor: primaryColorDark,
    scaffoldBackgroundColor: backgroundColorDark,
    cardColor: cardColorDark,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: textColorDark),
      bodyMedium: TextStyle(color: textColorDark),
      bodySmall: TextStyle(color: textColorDark),
      displayLarge: TextStyle(color: textColorDark),
      displayMedium: TextStyle(color: textColorDark),
      displaySmall: TextStyle(color: textColorDark),
      headlineLarge: TextStyle(color: textColorDark),
      headlineMedium: TextStyle(color: textColorDark),
      headlineSmall: TextStyle(color: textColorDark),
      titleLarge: TextStyle(color: textColorDark),
      titleMedium: TextStyle(color: textColorDark),
      titleSmall: TextStyle(color: textColorDark),
      labelLarge: TextStyle(color: textColorDark),
      labelMedium: TextStyle(color: textColorDark),
      labelSmall: TextStyle(color: textColorDark),
    ),
    colorScheme: const ColorScheme.dark(
      primary: primaryColorDark,
      secondary: secondaryColorDark,
      background: backgroundColorDark,
      surface: cardColorDark,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onBackground: textColorDark,
      onSurface: textColorDark,
    ),
  );
}
