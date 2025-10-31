import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinanceViewmodel extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  List<Tab> tabs = [
    Tab(child: Text('All')),
    Tab(child: Text('Sale')),
    Tab(child: Text('Pending')),
    Tab(child: Text('Configuration')),
  ];

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }
}
