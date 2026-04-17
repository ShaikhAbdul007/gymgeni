import 'package:flutter/material.dart';

import '../../../helper/common_member_data_table.dart';
import '../model/members_model.dart';

class ActiveMemberWidget extends StatelessWidget {
  final List<String> columnNames;
  final List<Members> members;
  final bool isDataLoading;
  final VoidCallback deleteOnTap;
  final VoidCallback editOnTap;
  const ActiveMemberWidget({
    super.key,
    required this.columnNames,
     required this.deleteOnTap,
     required this.editOnTap,
    required this.members,
    required this.isDataLoading,
  });

  @override
  Widget build(BuildContext context) {
    return CommonMemberDataTable(
      noDataFound: 'No active member found',
      isDataLoading: isDataLoading,
      columnNames: columnNames,
      members: members,
      deleteOnTap: deleteOnTap,
      editOnTap: editOnTap,
    );
  }
}
