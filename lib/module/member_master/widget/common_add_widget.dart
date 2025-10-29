import 'package:flutter/material.dart';
import '../../../helper/textfield.dart';
import '../../../utils/keys.dart';
import '../../../utils/text_style.dart';
import '../../../helper/button.dart';
import '../../../helper/svg_assetes.dart';
import '../../../utils/divider.dart';
import '../../../utils/sizebox.dart';

class CommonAddWidget extends StatelessWidget {
  final TextEditingController controller;
  final String headerLabel;
  final String labelHintText;
  final bool isLoading;
  final void Function() submitOnPress;
  final void Function() cancelOnPress;
  const CommonAddWidget({
    super.key,
    required this.controller,
    required this.headerLabel,
    required this.labelHintText,
    required this.submitOnPress,
    required this.cancelOnPress,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: traingModeKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          setHeight(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(headerLabel, style: customNato(fontSize: 16)),
              InkWell(
                onTap: cancelOnPress,
                child: CustomImageAssets(
                  svgAssets: 'assets/cancel.png',
                  height: 15,
                ),
              ),
            ],
          ),
          setHeight(height: 15),
          customDivider(isParameterGiven: true, endIndent: 0, indent: 0),
          setHeight(height: 20),
          CustomTextField(
            minLines: 2,
            maxLines: 5,
            controller: controller,
            hintText: labelHintText,
            validator: (trainig) {
              if (trainig == null || trainig.isEmpty) {
                return 'Enter training mode';
              }
              return null;
            },
          ),
          setHeight(height: 10),
          CustomButton(
            isLoading: isLoading,
            height: 40,
            width: 200,
            label: 'Save',
            onPress: submitOnPress,
          ),
          setWidth(width: 10),
        ],
      ),
    );
  }
}
