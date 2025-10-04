// Theme configuration for Wedding App

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Color(0xFFFFC107), // Primary color
      accentColor: Color(0xFF8E24AA), // Accent color
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Color(0xFF212121), // Primary color for dark theme
      accentColor: Color(0xFFBB86FC), // Accent color for dark theme
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
        bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white70),
        headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}