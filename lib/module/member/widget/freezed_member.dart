import 'package:flutter/material.dart';
import '../../../helper/common_member_data_table.dart';
import '../model/members_model.dart';

class FreezedMemberWidget extends StatelessWidget {
  final List<String> columnNames;
  final List<Members> members;
  final bool isDataLoading;
  final VoidCallback deleteOnTap;
  final VoidCallback editOnTap;
  const FreezedMemberWidget({
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
      noDataFound: 'No freezed member found',
      isDataLoading: isDataLoading,
      columnNames: columnNames,
      members: members,
      deleteOnTap: deleteOnTap,
      editOnTap: editOnTap,

    );
  }
}
