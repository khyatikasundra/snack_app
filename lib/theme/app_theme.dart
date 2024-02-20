import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: TextStyle(
            fontSize: 20,
            color: Color(0xFF9E9E9E),
          ),
          displayMedium: TextStyle(
            fontSize: 29,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontSize: 18,
          ),
          headlineSmall: TextStyle(
            fontSize: 18,
            color: Color(0xFF9E9E9E),
          ),
          bodySmall: TextStyle(
            fontSize: 16,
            color: Color(0xFF9E9E9E),
          ),
          bodyMedium: TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}
