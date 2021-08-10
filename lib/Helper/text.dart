import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Helper {
  int radius = 10;
  int maxradius = 40;
  static Widget text(String msg, int size, int spacing, Color color) {
    return Text(
      msg,
      textAlign: TextAlign.center,
      style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold,
          fontSize: size.toDouble(),
          color: color,
          letterSpacing: spacing.toDouble()),
    );
  }

  static Widget subtext(String msg, int size, int spacing, Color color) {
    return Text(
      msg,
      textAlign: TextAlign.center,
      style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.normal,
          fontSize: size.toDouble(),
          color: color,
          letterSpacing: spacing.toDouble()),
    );
  }

  
}
