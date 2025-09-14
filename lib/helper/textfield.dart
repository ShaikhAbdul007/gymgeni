import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../color/colors.dart';
import '../utils/text_style.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  final int maxLines;
  final int minLines;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int maxInputLength;
  final bool filteringTextInputFormatterRequired;
  final double verticalPadding;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.maxLines = 1,
    this.validator,
    this.suffixIcon,
    this.verticalPadding = 8,
    this.readOnly = false,
    this.keyboardType,
    this.minLines = 1,
    this.maxInputLength = 500,
    this.filteringTextInputFormatterRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 0.5, color: Colors.grey.shade100),
      ),
      child: TextFormField(
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        style: customMontserrat(fontSize: 12),
        cursorColor: AppColors.blackColor,
        cursorHeight: 18,
        cursorWidth: 0.5,
        keyboardType: keyboardType,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxInputLength),
          filteringTextInputFormatterRequired
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter,
        ],
        obscureText: obscureText,
        controller: controller,
        maxLines: maxLines,
        minLines: minLines,
        validator: validator,
        readOnly: readOnly,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          fillColor: Colors.grey.shade100,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
