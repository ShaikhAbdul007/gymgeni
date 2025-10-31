import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeadViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  List<Tab> tabs = [
    Tab(child: Text('All')),
    Tab(child: Text('Follow History')),
    Tab(child: Text('Configuration')),
  ];

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }
}
