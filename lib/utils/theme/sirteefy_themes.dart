// typography for the app
import 'package:flutter/material.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';

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
      scaffoldBackgroundColor: grayColor,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: grayColor,
        brightness: Brightness.light,
      ),
    );
  }

  // Dark Theme
  static ThemeData darkTheme({double scaleFactor = 1.0}) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: darkModeBGColor,
brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: darkModeBGColor,
        brightness: Brightness.dark,
      ),
    );
  }
}
