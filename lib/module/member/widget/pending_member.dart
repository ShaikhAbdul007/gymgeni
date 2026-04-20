import 'package:flutter/material.dart';

import '../../../helper/common_member_data_table.dart';

import '../model/members_model.dart';

class PendingMemberWidget extends StatelessWidget {
  final List<String> columnNames;
  final List<Members> members;
  final bool isDataLoading;
  final void Function(Members member) deleteOnTap;
  final void Function(Members member) editOnTap;
  const PendingMemberWidget({
    super.key,
    required this.columnNames,
    required this.members,
    required this.isDataLoading,
    required this.deleteOnTap,
    required this.editOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return CommonMemberDataTable(
      noDataFound: 'No pending member found',
      isDataLoading: isDataLoading,
      columnNames: columnNames,
      members: members,
      deleteOnTap: deleteOnTap,
      editOnTap: editOnTap,
    );
  }
}
