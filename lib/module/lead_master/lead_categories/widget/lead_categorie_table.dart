import 'package:flutter/material.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/dimension.dart';
import 'package:gymgeni/utils/colors.dart';
import '../../../../helper/common_action.dart';
import '../../../../utils/text_style.dart';
import '../model/lead_categories_model.dart';

class LeadCategorieTable extends StatelessWidget {
  final List<String> columnNames;
  final List<LeadCategoryData> groupType;
  final void Function(LeadCategoryData group)? deleteOnTap;
  final void Function(LeadCategoryData group)? editOnTap;
  const LeadCategorieTable({
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
