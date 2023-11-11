import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle headingTextStyle(
      {double fontSize = 18, Color color = Colors.white}) {
    return GoogleFonts.rubik(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle monStyle({required color}) {
    return GoogleFonts.montserrat(
      color: color,
      fontWeight: FontWeight.w800,
      fontSize: 24,
    );
  }

  static TextStyle poppins() {
    return GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
      fontSize: 36,
    );
  }

  static TextStyle normalStyle({double fontSize = 16.0}) {
    return GoogleFonts.lato(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      letterSpacing: 1.5,
    );
  }
}
