import 'package:flutter/material.dart';

import '../../../../helper/button.dart';
import '../../../../helper/svg_assetes.dart';
import '../../../../helper/textfield.dart';
import '../../../../utils/divider.dart';
import '../../../../utils/keys.dart';
import '../../../../utils/sizebox.dart';
import '../../../../utils/text_style.dart';

class CommonAddNewPlanWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController amountController;
  final String headerLabel;
  final String errorLabel;
  final String errorLabel2;
  final String labelHintText;
  final String labelHintText2;
  final bool isLoading;
  final void Function() submitOnPress;
  final void Function() cancelOnPress;
  const CommonAddNewPlanWidget({
    super.key,
    required this.controller,
    required this.amountController,
    required this.headerLabel,
    required this.labelHintText,
    required this.submitOnPress,
    required this.cancelOnPress,
    this.isLoading = false,
    required this.errorLabel,
    required this.errorLabel2,
    required this.labelHintText2,
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
                return errorLabel;
              }
              return null;
            },
          ),
          setHeight(height: 10),
          CustomTextField(
            minLines: 2,
            maxLines: 5,
            filteringTextInputFormatterRequired: true,
            keyboardType: TextInputType.number,
            controller: amountController,
            hintText: labelHintText2,
            validator: (amount) {
              if (amount == null || amount.isEmpty) {
                return errorLabel2;
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
