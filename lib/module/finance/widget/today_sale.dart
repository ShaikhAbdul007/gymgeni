import 'package:flutter/material.dart';
import 'package:gymgeni/helper/common_finance_data_table.dart';

import '../../dashboard/model/dashboard_business_overall_componenet_model.dart';
import '../../dashboard/widget/dashboard_business_over_all_section.dart';
import 'sale_payment_over_all_section.dart';

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
    var mainHeroList = [
      DashBoardBusinessOverAllComponenetModel(
        iconsColor: Colors.green,
        icons: Icons.arrow_upward_rounded,
        color: Color(0xFFEFF6FF),
        label: 'Total Upi',
        amount: 0,
        percentage: '8.5',
        image: 'assets/employee.png',
      ),
      DashBoardBusinessOverAllComponenetModel(
        iconsColor: Colors.red,
        icons: Icons.arrow_downward_rounded,
        color: Color(0xFFFAF5FF),
        label: 'Total Card',
        amount: 0,
        percentage: '2.5',
        image: 'assets/attendence.png',
      ),
      DashBoardBusinessOverAllComponenetModel(
        iconsColor: Colors.green,
        icons: Icons.arrow_upward_rounded,
        color: Color(0xFFFEFCE8),
        label: 'Total Cash',
        amount: 0,
        percentage: '15.5',
        image: 'assets/money.png',
      ),
    ];

    return Column(
      children: [
        SalePaymentOverAllSection(
          isDataLoading: false,
          dashBoardBusinessOverAllListItem: mainHeroList,
        ),
        CommonFinanceDataTable(
          columnNames: columnNames,
          paymentList: paymentList,
          isDataLoading: isDataLoading,
          noDataFound: 'No sale found',
        ),
      ],
    );
  }
}
