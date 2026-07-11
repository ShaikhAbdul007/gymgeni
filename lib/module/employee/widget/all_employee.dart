import 'package:flutter/material.dart';
import 'package:gymgeni/helper/common_employee_data_tabel.dart';

import '../model/all_employee_model.dart';

class AllEmployee extends StatelessWidget {
  final List<String> columnNames;
  final List<Employees> employees;
  final bool isDataLoading;
  final void Function(Employees employee)? editOnTap;
  final void Function(Employees employee)? deleteOnTap;
  const AllEmployee({
    super.key,
    required this.columnNames,
    required this.employees,
    required this.isDataLoading,
    this.editOnTap,
    this.deleteOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return CommonEmployeeDataTable(
      columnNames: columnNames,
      employees: employees,
      isDataLoading: isDataLoading,
      noDataFound: 'No employee found',
      editOnTap: editOnTap,
      deleteOnTap: deleteOnTap,
    );
  }
}
