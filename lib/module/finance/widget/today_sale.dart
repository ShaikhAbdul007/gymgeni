import 'package:flutter/material.dart';
import 'package:gymgeni/helper/common_finance_data_table.dart';

class TodayFinancePayment extends StatelessWidget {
  final bool isDataLoading;
  final List<String> columnNames;
  final List<dynamic> paymentList;
  const TodayFinancePayment({
    super.key,
    required this.isDataLoading,
    required this.columnNames,
    required this.paymentList,
  });

  @override
  Widget build(BuildContext context) {
    return CommonFinanceDataTable(
      columnNames: columnNames,
      paymentList: paymentList,
      isDataLoading: isDataLoading,
      noDataFound: 'No sale found',
    );
  }
}
