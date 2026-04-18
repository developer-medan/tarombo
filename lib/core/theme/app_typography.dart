import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  AppTypography._();

  static TextStyle get headline => GoogleFonts.inter(
        fontWeight: FontWeight.w800,
        letterSpacing: -1.0,
      );

  static TextStyle get body => GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      );

  static TextStyle get label => GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
      );
}
