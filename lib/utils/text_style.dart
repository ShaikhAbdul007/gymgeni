import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

TextStyle customPoppin({
  Color color = AppColors.blackColor,
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 15,
  TextDecoration? decoration,
}) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize,
  );
}

TextStyle customNato({
  Color color = AppColors.blackColor,
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 15,
  TextDecoration? decoration,
}) {
  return GoogleFonts.notoSansAnatolianHieroglyphs(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize,
    decoration: decoration,
  );
}

TextStyle customRaleway({
  Color color = AppColors.blackColor,
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 15,
  TextDecoration? decoration,
}) {
  return GoogleFonts.raleway(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize,
    decoration: decoration,
  );
}

TextStyle customUbuntu({
  Color color = AppColors.blackColor,
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 15,
  TextDecoration? decoration,
}) {
  return GoogleFonts.ubuntu(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize,
    decoration: decoration,
  );
}

TextStyle customMontserrat({
  Color color = AppColors.blackColor,
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 15,
  TextDecoration? decoration,
}) {
  return GoogleFonts.montserrat(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize,
    decoration: decoration,
  );
}

TextStyle customNunito({
  Color color = AppColors.blackColor,
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 15,
  TextDecoration? decoration,
}) {
  return GoogleFonts.montserrat(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize,
    decoration: decoration,
  );
}
