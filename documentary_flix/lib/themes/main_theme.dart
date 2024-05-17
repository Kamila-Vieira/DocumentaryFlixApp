import 'package:flutter/material.dart';
import 'package:documentary_flix/themes/colors.dart';

ThemeData mainTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Roboto',
  primaryColor: ThemeColors.primaryColor,
  colorScheme: ColorScheme.fromSeed(
    primary: ThemeColors.primaryColor,
    seedColor: ThemeColors.primaryColor,
    background: ThemeColors.backgroundColor,
    brightness: Brightness.dark,
    error: ThemeColors.errorColor,
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
    ),
    bodyLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.normal,
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
  ),
);
