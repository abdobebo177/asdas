import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  //sabitler
  static const mainColor = Colors.purple;

  static const String titleText = 'Average Calculator';
  static final TextStyle titleStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: mainColor);

  static BorderRadius borderRadius = BorderRadius.circular(16);

  static final TextStyle showAverageBodyStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: mainColor);

  static final TextStyle averageStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: mainColor);

  static final EdgeInsets dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  // ignore: prefer_const_constructors
  static final horizontalPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
