import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UTextTheme{

  static TextTheme lightTextTheme =
      TextTheme(
          headlineSmall: GoogleFonts.montserrat(
              color: Colors.black87,
              fontSize: 30.0
          ),
          bodyLarge: GoogleFonts.poppins(
              color: Colors.black54,
              fontSize: 24.0
          )
  );
  static TextTheme darkTextTheme = TextTheme(
          headlineSmall: GoogleFonts.montserrat(
              color: Colors.white70,
              fontSize: 30.0
          ),
          bodyLarge: GoogleFonts.poppins(
              color: Colors.white60,
              fontSize: 24.0
          )
  );

}