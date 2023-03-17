import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData theme() => ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            minimumSize: const Size(200.0, 54.0),
            maximumSize: const Size(200.0, 54.0),
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
