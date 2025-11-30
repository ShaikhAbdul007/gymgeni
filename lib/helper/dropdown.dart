import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/text_style.dart';

class CustomDropDown extends StatelessWidget {
  final List<dynamic> listItems;
  final dynamic selectedDropDownItem;
  final Function(dynamic value) notifyParent;
  final String? error;
  final String? hintText;
  const CustomDropDown({
    super.key,
    required this.listItems,
    required this.notifyParent,
    this.selectedDropDownItem,
    this.error,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5, color: Colors.grey.shade100),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<dynamic>(
          style: customMontserrat(fontSize: 12),
          decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            iconColor: AppColors.blackColor,
            filled: true,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            contentPadding: EdgeInsets.only(left: 10, right: 5, top: 15),

            hintText: hintText,
          ),
          validator: ((value) => value == null ? error : null),
          isExpanded: true,
          isDense: true,
          initialValue: selectedDropDownItem,
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

class CustomDropDownWithModel extends StatelessWidget {
  final List<dynamic> listItems;
  final dynamic selectedDropDownItem;
  final Function(dynamic value) notifyParent;
  final String? error;
  final String? hintText;
  const CustomDropDownWithModel({
    super.key,
    required this.listItems,
    required this.notifyParent,
    this.selectedDropDownItem,
    this.error,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5, color: Colors.grey.shade100),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<dynamic>(
          style: customMontserrat(fontSize: 13),
          decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            iconColor: AppColors.blackColor,
            filled: true,
            border: InputBorder.none,
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            contentPadding: EdgeInsets.only(left: 10, right: 5, top: 15),
          ),
          validator: ((value) => value == null ? error : null),
          isExpanded: true,
          isDense: true,
          initialValue: selectedDropDownItem,
          items:
              listItems.map<DropdownMenuItem<dynamic>>((dynamic item) {
                return DropdownMenuItem<dynamic>(
                  value: item.id,
                  child: Text(
                    "${item.name}",
                    style: customMontserrat(fontSize: 12),
                  ),
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
