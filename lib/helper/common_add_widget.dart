import 'package:flutter/material.dart';
import 'package:gymgeni/helper/common_appbar_with_cancelbutton.dart';
import 'textfield.dart';
import '../utils/keys.dart';
import 'button.dart';
import '../utils/divider.dart';
import '../utils/sizebox.dart';

class CommonAddWidget extends StatelessWidget {
  final TextEditingController controller;
  final String headerLabel;
  final String errorLabel;
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
    required this.errorLabel,
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
