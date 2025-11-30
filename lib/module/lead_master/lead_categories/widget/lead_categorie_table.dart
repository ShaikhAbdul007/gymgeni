import 'package:flutter/material.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/dimension.dart';
import 'package:gymgeni/utils/colors.dart';
import '../../../../helper/common_action.dart';
import '../../../../utils/text_style.dart';
import '../model/lead_categories_model.dart';

class LeadCategorieTable extends StatelessWidget {
  final List<String> columnNames;
  final List<LeadCategoryData> leadCategories;
  final void Function(LeadCategoryData leadCategorie)? deleteOnTap;
  final void Function(LeadCategoryData leadCategorie)? editOnTap;
  const LeadCategorieTable({
    super.key,
    required this.columnNames,

    this.deleteOnTap,
    this.editOnTap,
    required this.leadCategories,
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
              leadCategories.map((leadCategorie) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        leadCategorie.name ?? '',
                        style: customNunito(fontSize: 14),
                      ),
                    ),
                    DataCell(
                      CommonAction(
                        deleteOnTap: () => deleteOnTap?.call(leadCategorie),
                        editOnTap: () => editOnTap?.call(leadCategorie),
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
