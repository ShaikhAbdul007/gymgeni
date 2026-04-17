import 'package:flutter/material.dart';
import 'package:gymgeni/helper/svg_assetes.dart';

class CommonAction extends StatelessWidget {
  final VoidCallback editOnTap;
  final VoidCallback deleteOnTap;
  final List<Widget>? actionButtons;
  const CommonAction({
    super.key,
    required this.editOnTap,
    required this.deleteOnTap,

    this.actionButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTooltipButton(
          svgAsset: 'assets/edit.png',
          buttonOnTap: editOnTap,
        ),
        SizedBox(width: 8),
        CustomTooltipButton(
          svgAsset: 'assets/delete.png',
          buttonOnTap: deleteOnTap,
        ),
        SizedBox(width: 8),
        ...actionButtons ?? [],
      ],
    );
  }
}

class CustomTooltipButton extends StatelessWidget {
  final String svgAsset;
  final VoidCallback buttonOnTap;
  const CustomTooltipButton({
    super.key,

    required this.svgAsset,
    required this.buttonOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonOnTap,
      child: CustomNetworkOrAssetImage(
        svgAssets: svgAsset,
        height: 50,
        width: 20,
      ),
    );
  }
}
