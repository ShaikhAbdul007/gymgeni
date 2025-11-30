import 'package:flutter/widgets.dart';
import 'package:gymgeni/helper/common_attendance_data_table.dart';
import '../model/employee_attendance_model.dart';

class EmployeeAttendance extends StatelessWidget {
  final List<String> columnNames;
  final List<EmployeeAttendanceData> employees;
  final bool isDataLoading;
  const EmployeeAttendance({
    super.key,
    required this.columnNames,
    required this.employees,
    required this.isDataLoading,
  });

  @override
  Widget build(BuildContext context) {
    return CommonAttendanceDataTable(
      columnNames: columnNames,
      employees: employees,
      isDataLoading: isDataLoading,
      noDataFound: 'No employee attendance found',
    );
  }
}
