import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color background = Color(0xFFE8DCCA);
  static Color orange = Color(0xFFFF7F50);
  static Color dark = Color(0xFF17130D);

  static TextStyle headline = GoogleFonts.playfairDisplay(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: dark,
  );

  static TextStyle subheadline = GoogleFonts.playfairDisplay(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: dark,
  );

  static TextStyle buttonStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static ThemeData theme = ThemeData(
    primaryColor: orange,
    scaffoldBackgroundColor: background,
    textTheme: TextTheme(
      displayLarge: headline,
      bodyLarge: subheadline,
      labelLarge: buttonStyle,
    ),
  );
}
