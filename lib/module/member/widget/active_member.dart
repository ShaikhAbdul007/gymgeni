import 'package:flutter/material.dart';

import '../../../helper/common_member_data_table.dart';
import '../model/members_model.dart';

class ActiveMemberWidget extends StatelessWidget {
  final List<String> columnNames;
  final List<Members> members;
  final bool isDataLoading;
  final void Function(Members member)? editOnTap;
  final void Function(Members member)? deleteOnTap;
  final void Function(Members member)? freezeOnTap;
  final void Function(Members member)? unfreezeOnTap;
  final void Function(Members member)? transferOnTap;
  const ActiveMemberWidget({
    super.key,
    required this.columnNames,
    required this.members,
    required this.isDataLoading,
    this.editOnTap,
    this.deleteOnTap,
    this.freezeOnTap,
    this.unfreezeOnTap,
    this.transferOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return CommonMemberDataTable(
      noDataFound: 'No active member found',
      isDataLoading: isDataLoading,
      columnNames: columnNames,
      members: members,
      editOnTap: editOnTap,
      deleteOnTap: deleteOnTap,
      freezeOnTap: freezeOnTap,
      unfreezeOnTap: unfreezeOnTap,
      transferOnTap: transferOnTap,
    );
  }
}
