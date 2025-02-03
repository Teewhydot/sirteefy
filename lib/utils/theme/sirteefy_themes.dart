// typography for the app
import 'package:flutter/material.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
// use Fira Code as default font

// class SirteefyThemes {
//
//   static final ThemeData lightTheme = ThemeData(
//     primarySwatch: Colors.blue,
//     fontFamily: 'FiraCode',
//     textTheme: const TextTheme(
//       displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
//       displayMedium: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
//       displaySmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//       headlineMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//       headlineSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
//       titleLarge: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
//       bodyLarge: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
//       bodyMedium: TextStyle(fontSize: 12.0, fontFamily: 'Hind'),
//     ),
//   );
//
//   static final ThemeData darkTheme = ThemeData(
//     primarySwatch: Colors.blue,
//     fontFamily: 'FiraCode',
//   );
// }
//


class AppThemes {
  // Base text style with Fira Code font and configurable properties
  static TextStyle firaCodeStyle({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: 'FiraCode',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // Light Theme
  static ThemeData lightTheme({double scaleFactor = 1.0}) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      textTheme: TextTheme(
        displayLarge: firaCodeStyle(
          fontSize: 57 * scaleFactor,
          fontWeight: FontWeight.w400,
        ),
        displayMedium: firaCodeStyle(
          fontSize: 45 * scaleFactor,
          fontWeight: FontWeight.w400,
        ),
        displaySmall: firaCodeStyle(
          fontSize: 36 * scaleFactor,
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: firaCodeStyle(
          fontSize: 32 * scaleFactor,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: firaCodeStyle(
          fontSize: 28 * scaleFactor,
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: firaCodeStyle(
          fontSize: 24 * scaleFactor,
          fontWeight: FontWeight.w400,
        ),
        titleLarge: firaCodeStyle(
          fontSize: 22 * scaleFactor,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: firaCodeStyle(
          fontSize: 16 * scaleFactor,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: firaCodeStyle(
          fontSize: 14 * scaleFactor,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: firaCodeStyle(
          fontSize: 16 * scaleFactor,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: firaCodeStyle(
          fontSize: 14 * scaleFactor,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: firaCodeStyle(
          fontSize: 12 * scaleFactor,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: firaCodeStyle(
          fontSize: 14 * scaleFactor,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: firaCodeStyle(
          fontSize: 12 * scaleFactor,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: firaCodeStyle(
          fontSize: 11 * scaleFactor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Dark Theme
  static ThemeData darkTheme({double scaleFactor = 1.0}) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
      ),
      textTheme: TextTheme(
        // Same text styles as light theme but colors will auto-adjust
        displayLarge: firaCodeStyle(
          fontSize: 57 * scaleFactor,
          fontWeight: FontWeight.w400,
        ),
        // ... (repeat all text styles from light theme)
      ),
    );
  }
}
