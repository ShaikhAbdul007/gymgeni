import 'package:flutter/material.dart';
import 'package:gymgeni/helper/common_appbar_with_cancelbutton.dart';
import '../../../../helper/button.dart';
import '../../../../helper/textfield.dart';
import '../../../../utils/divider.dart';
import '../../../../utils/keys.dart';
import '../../../../utils/sizebox.dart';

class CommonAddNewPlanWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController amountController;
  final TextEditingController durationController;
  final String headerLabel;
  final String errorLabel;
  final String errorLabel2;
  final String errorLabel3;
  final String labelHintText;
  final String labelHintText2;
  final String labelHintText3;
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
    required this.durationController,
    required this.labelHintText3,
    required this.errorLabel3,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: commonAddWidgetKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          setHeight(height: 20),
          CommonAppbarWithCancelbutton(
            headerLabel: headerLabel,
            cancelOnPress: cancelOnPress,
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
            maxInputLength: 5,
            hintText: labelHintText2,
            validator: (amount) {
              if (amount == null || amount.isEmpty) {
                return errorLabel2;
              }
              return null;
            },
          ),
          setHeight(height: 10),
          CustomTextField(
            minLines: 2,
            maxLines: 5,
            filteringTextInputFormatterRequired: true,
            maxInputLength: 3,
            keyboardType: TextInputType.number,
            controller: durationController,
            hintText: labelHintText3,
            validator: (duration) {
              if (duration == null || duration.isEmpty) {
                return errorLabel3;
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
