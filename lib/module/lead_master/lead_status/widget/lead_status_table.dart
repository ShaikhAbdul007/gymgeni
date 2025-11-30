import 'package:flutter/material.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/dimension.dart';
import 'package:gymgeni/utils/colors.dart';
import '../../../../helper/common_action.dart';
import '../../../../utils/text_style.dart';
import '../model/lead_status_model.dart';

class LeadStatusTable extends StatelessWidget {
  final List<String> columnNames;
  final List<LeadStatusData> statusName;
  final void Function(LeadStatusData statusNames)? deleteOnTap;
  final void Function(LeadStatusData statusNames)? editOnTap;
  const LeadStatusTable({
    super.key,
    required this.columnNames,
    required this.statusName,
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
              statusName.map((statusNames) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        statusNames.name ?? '',
                        style: customNunito(fontSize: 14),
                      ),
                    ),
                    DataCell(
                      CommonAction(
                        deleteOnTap: () => deleteOnTap?.call(statusNames),
                        editOnTap: () => editOnTap?.call(statusNames),
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
