import 'package:flutter/material.dart';
import '../utils/colors.dart';

Widget customDivider({
  bool isParameterGiven = false,
  Color? color,
  double indent = 0,
  double endIndent = 0,
  double height = 0,
  double thickness = 0,
}) {
  return Divider(
    color: isParameterGiven ? color : AppColors.greyLightColor,
    thickness: thickness,
    height: height,
    indent: isParameterGiven ? indent : 20,
    endIndent: isParameterGiven ? endIndent : 20,
  );
}

class CustomVerticalDivider extends StatelessWidget {
  final double height;
  final double width;
  const CustomVerticalDivider({super.key, this.height = 25, this.width = 0.5});

  @override
  Widget build(BuildContext context) {
    return Container(height: height, width: width, color: Colors.black);
  }
}
