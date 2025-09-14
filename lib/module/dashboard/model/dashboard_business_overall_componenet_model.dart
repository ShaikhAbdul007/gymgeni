import 'package:flutter/material.dart';

class DashBoardBusinessOverAllComponenetModel {
  final String label;
  final String amount;
  final String percentage;
  final String image;
  final Color color;
  final IconData icons;
  final Color iconsColor;

  DashBoardBusinessOverAllComponenetModel(
      {required this.color,
      required this.label,
      required this.icons,
      required this.iconsColor,
      required this.amount,
      required this.percentage,
      required this.image});
}