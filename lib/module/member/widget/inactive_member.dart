import 'package:flutter/material.dart';

import '../../../helper/common_member_data_table.dart';

import '../model/members_model.dart';
import '../view_model/member_view_model.dart';

class InactiveMemberWidget extends StatelessWidget {
  final List<String> columnNames;
  final List<Members> members;
  final bool isDataLoading;
  const InactiveMemberWidget({
    super.key,
    required this.columnNames,
    required this.members,
    required this.isDataLoading,
  });

  @override
  Widget build(BuildContext context) {
    return CommonMemberDataTable(
      noDataFound: 'No inactive member found',
      isDataLoading: isDataLoading,
      columnNames: columnNames,
      members: members,
    );
  }
}
