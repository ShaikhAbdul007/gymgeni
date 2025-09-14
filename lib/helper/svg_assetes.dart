import 'package:flutter/material.dart';

class CustomImageAssets extends StatelessWidget {
  final double height;
  final double width;
  final String svgAssets;
  const CustomImageAssets(
      {super.key, this.height = 80, this.width = 50, required this.svgAssets});

  @override
  Widget build(BuildContext context) {
    return Image.asset(height: height, width: width, svgAssets);
  }
}
