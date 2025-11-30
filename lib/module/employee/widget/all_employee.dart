import 'package:flutter/material.dart';
import 'package:gymgeni/helper/common_employee_data_tabel.dart';

import '../model/all_employee_model.dart';

class AllEmployee extends StatelessWidget {
  final List<String> columnNames;
  final List<Employees> employees;
  final bool isDataLoading;
  const AllEmployee({
    super.key,
    required this.columnNames,
    required this.employees,
    required this.isDataLoading,
  });

  @override
  Widget build(BuildContext context) {
    return CommonEmployeeDataTable(
      columnNames: columnNames,
      employees: employees,
      isDataLoading: isDataLoading,
      noDataFound: 'No employee found',
    );
  }
}
