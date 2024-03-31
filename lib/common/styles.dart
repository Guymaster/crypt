import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppNameTxtStyle {
  static TextStyle classic(double size, Color color){
    return GoogleFonts.poppins(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold
    );
  }
}

abstract class CollectionNameTxtStyle {
  static TextStyle classic(double size, Color color){
    return GoogleFonts.poppins(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.normal,
        textBaseline: TextBaseline.ideographic
    );
  }
}