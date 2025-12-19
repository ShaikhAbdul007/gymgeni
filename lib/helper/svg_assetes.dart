import 'package:flutter/material.dart';

class CustomNetworkOrAssetImage extends StatelessWidget {
  final double height;
  final double width;
  final String svgAssets;
  final bool isNetworkAssets;
  const CustomNetworkOrAssetImage({
    super.key,
    this.height = 80,
    this.width = 50,
    required this.svgAssets,
    this.isNetworkAssets = false,
  });

  @override
  Widget build(BuildContext context) {
    return isNetworkAssets
        ? Image.network(height: height, width: width, svgAssets)
        : Image.asset(height: height, width: width, svgAssets);
  }
}
