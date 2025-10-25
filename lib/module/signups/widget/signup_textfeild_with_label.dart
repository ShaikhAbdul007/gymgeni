import 'package:flutter/material.dart';
import 'package:gymgeni/helper/common_rich_text.dart';
import 'package:gymgeni/helper/textfield.dart';
import 'package:gymgeni/utils/sizebox.dart';

class SignupTextFeildWithLabel extends StatelessWidget {
  final String label;
  final int maxLines;
  final int minLines;
  final TextEditingController tcontroller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool readOnly;
  final bool isAsteriskdRequired;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool filteringTextInputFormatterRequired;
  final int maxInputLength;
  const SignupTextFeildWithLabel({
    super.key,
    this.maxLines = 1,
    this.minLines = 1,
    required this.label,
    required this.tcontroller,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.validator,
    this.keyboardType,
    this.filteringTextInputFormatterRequired = false,
    this.isAsteriskdRequired = true,
    this.maxInputLength = 500,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonRichText(label: label, isAsteriskdRequired: isAsteriskdRequired),
        setHeight(height: 5),
        CustomTextField(
          maxInputLength: maxInputLength,
          readOnly: readOnly,
          obscureText: obscureText,
          suffixIcon: suffixIcon,
          maxLines: maxLines,
          minLines: minLines,
          controller: tcontroller,
          validator: validator,
          keyboardType: keyboardType,
          filteringTextInputFormatterRequired:
              filteringTextInputFormatterRequired,
        ),
      ],
    );
  }
}
