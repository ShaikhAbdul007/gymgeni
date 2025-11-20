import 'package:flutter/material.dart';

import '../utils/text_style.dart';
import 'svg_assetes.dart';

class CommonAppbarWithCancelbutton extends StatelessWidget {
  final String headerLabel;
  final void Function() cancelOnPress;
  const CommonAppbarWithCancelbutton({
    super.key,
    required this.headerLabel,
    required this.cancelOnPress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(headerLabel, style: customNato(fontSize: 16)),
        InkWell(
          onTap: cancelOnPress,
          child: CustomImageAssets(svgAssets: 'assets/cancel.png', height: 15),
        ),
      ],
    );
  }
}
