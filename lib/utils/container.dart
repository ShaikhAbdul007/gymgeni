import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomContainer extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color color;
  final Color boxShadowColor;

  const CustomContainer({
    super.key,
    this.height = 0,
    this.width = 0,
    this.radius = 5,
    this.padding,
    this.margin,
    this.color = AppColors.whiteColor,
    this.boxShadowColor = Colors.grey,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: boxShadowColor,
            offset: Offset(0.1, 1.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
