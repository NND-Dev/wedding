// Theme configuration for Wedding App

import 'package:flutter/material.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: const Color(0xFFFFC107), // Primary color
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFFFC107),
        secondary: const Color(0xFF8E24AA),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: const Color(0xFF212121), // Primary color for dark theme
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF212121),
        secondary: const Color(0xFFBB86FC),
        brightness: Brightness.dark,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white70,
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
