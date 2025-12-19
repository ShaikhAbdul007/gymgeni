import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/module/finance/model/finance_today_model.dart';
import 'package:gymgeni/repository/finance_repo.dart';
import 'package:gymgeni/utils/constant.dart';
import 'package:gymgeni/utils/errorstrings.dart';
import 'package:intl/intl.dart';

import '../model/finance_pending_model.dart';

class FinanceViewmodel extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isAllFinanceDataLoading = false.obs;
  RxBool isPendingFinanceDataLoading = false.obs;
  RxBool isTodayDataLoading = false.obs;
  RxBool isDataLoading = false.obs;
  TabController? tabController;
  final financeRepo = FinanceRepo();
  List<Tab> tabs = [
    Tab(child: Text('All')),
    Tab(child: Text('Sale')),
    Tab(child: Text('Pending')),
    Tab(child: Text('Configuration')),
  ];
  RxList<Payments> allFinanceList = <Payments>[].obs;
  RxList<Payments> pendingFinanceList = <Payments>[].obs;
  RxList<SalesDetails> todayFinanceList = <SalesDetails>[].obs;
  List<String> columns = [
    'Name',
    'Plan',
    'Amount',
    'Balance',
    'Status',
    'Join Date',
    'Expire Date',
    'Action',
  ];

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }

  void getAllFinanceData() async {
    isAllFinanceDataLoading.value = true;
    try {
      var res = await financeRepo.getFinanceData();
      if (res.status == success) {
        allFinanceList.value = res.data?.payments ?? [];
      } else {
        Constant.showSnackBar(
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isAllFinanceDataLoading.value = false;
    }
  }

  void getPendingFinanceData() async {
    isPendingFinanceDataLoading.value = true;
    try {
      var res = await financeRepo.getPendingFinanceData();
      if (res.status == success) {
        pendingFinanceList.value = res.data?.payments ?? [];
      } else {
        Constant.showSnackBar(
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isPendingFinanceDataLoading.value = false;
    }
  }

  void getTodayFinanceData() async {
    String dateee = DateFormat('yyyy-MM-dd').format(DateTime.now());
    isTodayDataLoading.value = true;
    try {
      var res = await financeRepo.getTodayFinanceData(dateee: dateee);
      if (res.status == success) {
        todayFinanceList.value = res.data?.salesDetails ?? [];
      } else {
        Constant.showSnackBar(
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isTodayDataLoading.value = false;
    }
  }
}
