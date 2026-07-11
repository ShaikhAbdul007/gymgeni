import 'package:flutter/material.dart';
import 'package:gymgeni/helper/common_attendance_data_table.dart';
import '../model/member_attandence_model.dart';

class MemberAttendance extends StatelessWidget {
  final List<String> columnNames;
  final List<MemberAttendanceData> members;
  final bool isDataLoading;
  const MemberAttendance({
    super.key,
    required this.columnNames,
    required this.members,
    required this.isDataLoading,
  });

  @override
  Widget build(BuildContext context) {
    return CommonAttendanceDataTable(
      employees: members,
      noDataFound: 'No member attendance found',
      isDataLoading: isDataLoading,
      columnNames: columnNames,
    );
  }
}
