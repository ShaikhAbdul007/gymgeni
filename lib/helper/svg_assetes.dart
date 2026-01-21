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
        ? Image.network(
          svgAssets,
          height: height,
          width: width,

          // ⬇️ fallback here
          errorBuilder: (context, error, stackTrace) {
            return Image.asset('assets/user.png', height: height, width: width);
          },
        )
        : Image.asset(svgAssets, height: height, width: width);
  }
}
