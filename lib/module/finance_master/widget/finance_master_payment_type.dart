import 'package:flutter/material.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/dimension.dart';
import 'package:gymgeni/utils/colors.dart';
import '../../../../helper/common_action.dart';
import '../../../../utils/text_style.dart';
import '../finance_payment_method/model/all_payment_method_model.dart';

class FinanceMasterPaymentType extends StatelessWidget {
  final List<String> columnNames;
  final List<AllPaymentData> paymentList;
  final void Function(AllPaymentData payments)? deleteOnTap;
  final void Function(AllPaymentData payments)? editOnTap;
  const FinanceMasterPaymentType({
    super.key,
    required this.columnNames,
    required this.paymentList,
    this.deleteOnTap,
    this.editOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: DataTable(
          dataRowMinHeight: 8,
          dataRowMaxHeight: 60,
          columnSpacing: 10,
          headingRowColor: WidgetStateColor.resolveWith(
            (states) => AppColors.whiteColor,
          ),
          columns:
              columnNames.map((columnName) {
                return DataColumn(
                  label: Text(
                    columnName,
                    style: customPoppin(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList(),
          rows:
              paymentList.map((employeeType) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        employeeType.name ?? '',
                        style: customNunito(fontSize: 14),
                      ),
                    ),
                    DataCell(
                      CommonAction(
                        deleteOnTap: () => deleteOnTap?.call(employeeType),
                        editOnTap: () => editOnTap?.call(employeeType),
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
