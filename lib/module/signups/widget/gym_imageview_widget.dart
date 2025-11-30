import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../../../helper/button.dart';

class GymImageViewWidget extends StatelessWidget {
  final Uint8List image;
  final void Function() okOnPress;
  final void Function() clearOnPress;
  const GymImageViewWidget({
    super.key,
    required this.image,
    required this.okOnPress,
    required this.clearOnPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.memory(image, width: 300, height: 400),
        CustomButton(
          height: 30,
          width: 200,
          label: 'Clear Image',
          onPress: clearOnPress,
        ),
        CustomButtonWithOutBackGroudColor(
          height: 30,
          width: 100,
          label: 'Ok',
          onPress: okOnPress,
        ),
      ],
    );
  }
}
