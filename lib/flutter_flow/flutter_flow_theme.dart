import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterFlowTheme {
  static const Color primaryColor = Color(0xFFE46EA4);
  static const Color primaryColorAccent = Color(0xFFE46EA4);
  static const Color primaryColorAccent1 = Color(0xFFEFA6C8);
  static const Color secondaryColor = Color(0xFF81D8D0);
  static const Color secondaryColor1 = Color(0xFFCFF0ED);
  static const Color tertiaryColor = Color(0xFFFBEBF5);

  static const Color black = Color(0xFF000000);
  static const Color grey1 = Color(0xFF878787);
  static const Color grey2 = Color(0xFF566469);
  // static const Color grey3 = Color(0xFF272726);
  static const Color grey3 = Color(0xFFFBEBF5);
  static const Color grey4 = Color(0xFF666666);
  static const Color alert = Color(0xFFDB2032);
  static const Color blue = Color(0xFF307AFF);

  String primaryFontFamily = 'Poppins';
  String secondaryFontFamily = 'Roboto';
  static TextStyle get title1 => GoogleFonts.getFont(
        'Roboto',
        color: black,
        fontWeight: FontWeight.bold,
        fontSize: 68,
      );
  static TextStyle get title2 => GoogleFonts.getFont(
        'Heebo',
        color: black,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  static TextStyle get title3 => GoogleFonts.getFont(
        'Heebo',
        color: black,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      );
  static TextStyle get subtitle1 => GoogleFonts.getFont(
        'Heebo',
        color: black,
        fontWeight: FontWeight.w300,
        fontSize: 14,
      );
  static TextStyle get subtitle2 => GoogleFonts.getFont(
        'Heebo',
        color: primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
  static TextStyle get subtitle3 => GoogleFonts.getFont(
        'Heebo',
        color: black,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      );
  static TextStyle get bodyText1 => GoogleFonts.getFont(
        'Heebo',
        color: black,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
      
  static TextStyle get login => GoogleFonts.getFont(
        'Heebo',
        color: primaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  static TextStyle get bodyText2 => GoogleFonts.getFont(
        'Heebo',
        color: black,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    required String fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
            );
}
