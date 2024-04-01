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

abstract class FileNameTxtStyle {
  static TextStyle classic(double size, Color color){
    return GoogleFonts.poppins(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold
    );
  }
}

abstract class FileContentTxtStyle {
  static TextStyle classic(double size, Color color){
    return GoogleFonts.poppins(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w500
    );
  }
}

abstract class FormLabelTxtStyle {
  static TextStyle classic(double size, Color color){
    return GoogleFonts.poppins(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w500,
    );
  }
}

abstract class FormTitleTxtStyle {
  static TextStyle classic(double size, Color color){
    return GoogleFonts.poppins(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold
    );
  }
}