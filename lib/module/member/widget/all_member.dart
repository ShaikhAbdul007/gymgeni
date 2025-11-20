import 'package:flutter/material.dart';
import '../../../helper/common_data_table.dart';
import '../model/members_model.dart';

class AllMemberWidget extends StatelessWidget {
  final List<String> columnNames;
  final List<Members> members;
  final bool isDataLoading;
  const AllMemberWidget({
    super.key,
    required this.columnNames,
    required this.members,
    required this.isDataLoading,
  });

  @override
  Widget build(BuildContext context) {
    return CommonMemberDataTable(
      noDataFound: 'No member found',
      isDataLoading: isDataLoading,
      columnNames: columnNames,
      members: members,
    );
  }
}
