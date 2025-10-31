import 'package:flutter/material.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/dimension.dart';
import 'package:gymgeni/utils/colors.dart';
import '../../../../helper/common_action.dart';
import '../../../../utils/text_style.dart';
import '../model/member_allgoal_model.dart';

class MemberGoalMemberTable extends StatelessWidget {
  final List<String> columnNames;
  final List<MemberAllGoalData> goalType;
  final void Function(MemberAllGoalData goal)? deleteOnTap;
  final void Function(MemberAllGoalData goal)? editOnTap;
  const MemberGoalMemberTable({
    super.key,
    required this.columnNames,
    required this.goalType,
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
              goalType.map((goal) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(goal.name ?? '', style: customNunito(fontSize: 14)),
                    ),
                    DataCell(
                      CommonAction(
                        deleteOnTap: () => deleteOnTap?.call(goal),
                        editOnTap: () => editOnTap?.call(goal),
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
