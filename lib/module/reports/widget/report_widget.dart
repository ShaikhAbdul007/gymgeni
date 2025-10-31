import 'package:flutter/material.dart';
import 'package:gymgeni/utils/text_style.dart';

import '../../../helper/button.dart';
import '../../../helper/date_picker.dart';
import '../../../utils/container.dart';
import '../../../utils/divider.dart';
import '../../../utils/sizebox.dart';

class ReportContainer extends StatelessWidget {
  final double height;
  final double width;
  final String label;
  final String note;
  const ReportContainer({
    super.key,
    this.height = 0,
    this.width = 0,
    required this.label,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    DateTimeRange dateTimeRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now(),
    );

    return CustomContainer(
      padding: EdgeInsets.only(left: 10, top: 5),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: customPoppin(fontSize: 15)),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: CustomDateRangePicker(
                    hintText: 'hintText',
                    selectedDate: dateTimeRange,
                    controller: TextEditingController(),
                  ),
                ),
                CustomButton(
                  height: 40,
                  width: 100,
                  label: 'Download',

                  onPress: () {},
                ),
              ],
            ),
          ),
          setHeight(height: 5),
          customDivider(isParameterGiven: true, indent: 0, endIndent: 20),
          setHeight(height: 15),
          Text('Note: $note', style: customNunito(fontSize: 15)),
        ],
      ),
    );
  }
}
