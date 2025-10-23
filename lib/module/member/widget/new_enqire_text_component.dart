import 'package:flutter/material.dart';

import '../../../helper/date_picker.dart';
import '../../../helper/dropdown.dart';
import '../../../helper/textfield.dart';
import '../../../utils/sizebox.dart';
import '../../../utils/text_style.dart';

class NewEnquireComponentWithDropDown extends StatelessWidget {
  final String label;
  final List<dynamic> listItems;
  final dynamic Function(dynamic) notifyParent;
  final double width;

  const NewEnquireComponentWithDropDown({
    super.key,
    required this.label,
    this.width = 120,
    required this.listItems,
    required this.notifyParent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: customNunito(fontSize: 12)),
          setHeight(height: 3),
          CustomDropDown(listItems: listItems, notifyParent: notifyParent),
        ],
      ),
    );
  }
}

class NewEnquireComponent extends StatelessWidget {
  final TextEditingController textController;
  final String label;
  final String labelHintText;
  final int maxLines;
  final int minLines;
  final double width;
  final bool isDatePicker;

  const NewEnquireComponent({
    super.key,
    required this.textController,
    required this.label,
    required this.labelHintText,
    this.maxLines = 1,
    this.minLines = 1,
    this.width = 200,
    this.isDatePicker = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: customNunito(fontSize: 12)),
          setHeight(height: 3),
          isDatePicker
              ? CustomDatePicker(
                hintText: labelHintText,
                selectedDate: DateTime.now(),
                controller: textController,
              )
              : CustomTextField(
                maxLines: maxLines,
                minLines: minLines,
                hintText: labelHintText,
                controller: textController,
              ),
        ],
      ),
    );
  }
}
