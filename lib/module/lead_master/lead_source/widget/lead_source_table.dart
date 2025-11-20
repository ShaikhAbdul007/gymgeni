import 'package:flutter/material.dart';
import 'package:gymgeni/module/lead_master/lead_source/model/lead_source_model.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/dimension.dart';
import 'package:gymgeni/utils/colors.dart';
import '../../../../helper/common_action.dart';
import '../../../../utils/text_style.dart';

class LeadSourceTable extends StatelessWidget {
  final List<String> columnNames;
  final List<LeadSourceData> groupType;
  final void Function(LeadSourceData group)? deleteOnTap;
  final void Function(LeadSourceData group)? editOnTap;
  const LeadSourceTable({
    super.key,
    required this.columnNames,
    required this.groupType,
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
              groupType.map((group) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(group.name ?? '', style: customNunito(fontSize: 14)),
                    ),
                    DataCell(
                      CommonAction(
                        deleteOnTap: () => deleteOnTap?.call(group),
                        editOnTap: () => editOnTap?.call(group),
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
