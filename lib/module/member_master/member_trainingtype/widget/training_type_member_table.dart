import 'package:flutter/material.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/dimension.dart';
import 'package:gymgeni/utils/colors.dart';
import '../../../../helper/common_action.dart';
import '../../../../utils/text_style.dart';
import '../model/member_alltrainingtype_model.dart';

class TrainingModeMemberTable extends StatelessWidget {
  final List<String> columnNames;
  final List<MemberAllTrainingTypeData> members;
  final void Function(MemberAllTrainingTypeData member)? deleteOnTap;
  final void Function(MemberAllTrainingTypeData member)? editOnTap;
  const TrainingModeMemberTable({
    super.key,
    required this.columnNames,
    required this.members,
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
              members.map((member) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        member.name ?? '',
                        style: customNunito(fontSize: 14),
                      ),
                    ),

                    DataCell(
                      CommonAction(
                        deleteOnTap: () => deleteOnTap?.call(member),
                        editOnTap: () => editOnTap?.call(member),
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
