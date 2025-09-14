import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/text_style.dart';

class CustomDropDown extends StatelessWidget {
  final List<dynamic> listItems;
  final dynamic selectedDropDownItem;

  final Function(dynamic value) notifyParent;
  const CustomDropDown({
    super.key,
    required this.listItems,
    required this.notifyParent,
    this.selectedDropDownItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 0.5, color: Colors.grey.shade100),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<dynamic>(
          style: customMontserrat(fontSize: 12),
          decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            iconColor: AppColors.blackColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            contentPadding: EdgeInsets.only(left: 10, right: 5, top: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
          validator:
              ((value) => value == null ? " Please Select Location" : null),
          isExpanded: true,
          isDense: true,
          value: selectedDropDownItem,
          items:
              listItems.map<DropdownMenuItem<dynamic>>((dynamic item) {
                return DropdownMenuItem<dynamic>(
                  value: item,
                  child: Text("$item", style: customMontserrat(fontSize: 12)),
                );
              }).toList(),
          onChanged: (value) {
            notifyParent(value);
          },
        ),
      ),
    );
  }
}
