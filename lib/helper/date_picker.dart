import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/colors.dart';
import '../utils/text_style.dart';
import 'textfield.dart';

class CustomDatePicker extends StatelessWidget {
  final String hintText;
  final DateTime selectedDate;
  final TextEditingController controller;
  const CustomDatePicker(
      {super.key,
      required this.hintText,
      required this.selectedDate,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: hintText,
      suffixIcon: InkWell(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(1990),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                        colorScheme: const ColorScheme.dark(
                            onPrimary: AppColors.whiteColor,
                            onSurface: AppColors.whiteColor,
                            primary: Colors.grey),
                        inputDecorationTheme: InputDecorationTheme(
                            labelStyle: TextStyle(fontSize: 15)),
                        textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                                textStyle: customMontserrat(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                                backgroundColor: AppColors.blackColor,
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(50)))), dialogTheme: DialogThemeData(backgroundColor: AppColors.blackColor)),
                    child: child!,
                  );
                });
            if (pickedDate != null) {
              String formatDate = DateFormat('dd-MM-yyyy').format(pickedDate);
              controller.text = formatDate;
            } else {
              return;
            }
          },
          child: Icon(
            Icons.calendar_month_rounded,
            color: Colors.black,
          )),
    );
  }
}

class CustomDateRangePicker extends StatelessWidget {
  final String hintText;
  final DateTimeRange selectedDate;
  final TextEditingController controller;
  const CustomDateRangePicker(
      {super.key,
      required this.hintText,
      required this.selectedDate,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: hintText,
      suffixIcon: InkWell(
          onTap: () async {
            DateTimeRange? pickedDate = await showDateRangePicker(
              context: context,
              initialDateRange: selectedDate,
              firstDate: DateTime(1990),
              lastDate: DateTime(2030),
              builder: (context, child) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: 400,
                    height: 600,
                    padding: EdgeInsets.all(16),
                    child: Theme(
                      data: ThemeData.light().copyWith(
                        datePickerTheme: DatePickerThemeData(
                          backgroundColor: Colors.black,
                          surfaceTintColor: Colors.black,
                          headerBackgroundColor: Colors.white10,
                          headerForegroundColor: Colors.black,
                          rangeSelectionBackgroundColor: Colors.grey.shade200,
                          rangeSelectionOverlayColor:
                              WidgetStateProperty.all(Colors.white),
                          todayBackgroundColor:
                              WidgetStateProperty.all(Colors.black),
                          todayForegroundColor:
                              WidgetStateProperty.all(Colors.white),
                        ),
                        colorScheme: const ColorScheme.dark(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          onSurface: Colors.black,
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      child: child!,
                    ),
                  ),
                );
              },
            );

            if (pickedDate != null) {
              final startDate = pickedDate.start;
              final endDate = pickedDate.end;

              String formatStartDate =
                  DateFormat('dd-MM-yyyy').format(startDate);
              String formatEndDate = DateFormat('dd-MM-yyyy').format(endDate);
              controller.text = '$formatStartDate - $formatEndDate';
            }
          },
          child: Icon(
            Icons.calendar_month_rounded,
            color: Colors.black,
          )),
    );
  }
}
