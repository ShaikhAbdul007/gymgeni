import 'package:flutter/material.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/dimension.dart';
import 'package:gymgeni/utils/colors.dart';

import '../module/member/model/members_model.dart';
import '../module/member_master/model/member_master_model.dart';
import '../utils/text_style.dart';
import 'common_action.dart';

class CommonMemberDataTable extends StatelessWidget {
  final List<String> columnNames;
  final List<Member> members;
  final VoidCallback? deleteOnTap;
  final VoidCallback? editOnTap;
  const CommonMemberDataTable({
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
        width: MediaQuery.of(context).size.width,
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
                      ListTile(
                        leading: Container(
                          width: 90,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              member.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        title: Text(
                          member.name,
                          style: customNunito(fontSize: 15),
                        ),
                        subtitle: Text(
                          member.subtitle,
                          style: customNunito(fontSize: 13),
                        ),
                      ),
                    ),
                    DataCell(
                      Text(member.plan, style: customNunito(fontSize: 12)),
                    ),
                    DataCell(
                      Text(member.amount, style: customNunito(fontSize: 12)),
                    ),
                    DataCell(
                      Text(
                        member.balanceAmount,
                        style: customNunito(fontSize: 12),
                      ),
                    ),
                    DataCell(
                      Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color:
                              member.status == 'Active'
                                  ? Colors.green.shade300
                                  : member.status == 'Pending'
                                  ? Colors.yellow
                                  : member.status == 'Inactive'
                                  ? Colors.red.shade400
                                  : Colors.grey.shade100,
                        ),
                        child: Center(
                          child: Text(
                            member.status,
                            style: customNunito(fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Text(member.date, style: customNunito(fontSize: 12)),
                    ),
                    DataCell(
                      Text(
                        member.rejectDate,
                        style: customNunito(fontSize: 12),
                      ),
                    ),
                    DataCell(
                      CommonAction(
                        deleteOnTap: deleteOnTap ?? () {},
                        editOnTap: editOnTap ?? () {},
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

class CommonMasterMemberDataTable extends StatelessWidget {
  final List<String> columnNames;
  final List<MemberMasterModel> members;
  final VoidCallback? deleteOnTap;
  final VoidCallback? editOnTap;
  const CommonMasterMemberDataTable({
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
                      Text(member.group, style: customNunito(fontSize: 12)),
                    ),

                    DataCell(
                      CommonAction(deleteOnTap: () {}, editOnTap: () {}),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
