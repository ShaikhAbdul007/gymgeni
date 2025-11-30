import 'package:flutter/material.dart';
import 'package:gymgeni/helper/common_member_data_table.dart';

class FinancePendingPayment extends StatelessWidget {
  final bool isDataLoading;
  final List<String> columnNames;
  const FinancePendingPayment({
    super.key,
    required this.isDataLoading,
    required this.columnNames,
  });

  @override
  Widget build(BuildContext context) {
    return CommonMemberDataTable(
      columnNames: columnNames,
      members: [],
      isDataLoading: isDataLoading,
      noDataFound: 'No pending payment found',
    );
  }
}
