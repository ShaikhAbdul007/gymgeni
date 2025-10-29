import 'package:flutter/material.dart';
import 'package:gymgeni/helper/svg_assetes.dart';

class CommonAction extends StatelessWidget {
  final VoidCallback editOnTap;
  final VoidCallback deleteOnTap;
  const CommonAction({
    super.key,
    required this.editOnTap,
    required this.deleteOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: editOnTap,
          child: CustomImageAssets(
            svgAssets: 'assets/editicon.png',
            height: 50,
            width: 20,
          ),
        ),
        SizedBox(width: 8),
        InkWell(
          onTap: deleteOnTap,
          child: CustomImageAssets(
            svgAssets: 'assets/deleteicon.png',
            height: 50,
            width: 20,
          ),
        ),
      ],
    );
  }
}
