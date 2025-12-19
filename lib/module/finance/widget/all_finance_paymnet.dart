import 'package:flutter/material.dart';
import 'package:gymgeni/helper/common_finance_data_table.dart';
import '../model/finance_pending_model.dart';

class AllFinancePayment extends StatelessWidget {
  final bool isDataLoading;
  final List<String> columnNames;
  final List<Payments> paymentList;
  const AllFinancePayment({
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
      noDataFound: 'No payment found',
    );
  }
}
