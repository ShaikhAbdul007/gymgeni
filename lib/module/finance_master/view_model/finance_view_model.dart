import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinanceMasterViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  List<Widget> tabs = [
    Tab(child: Text('Payment Method')),
    // Tab(child: Text('Follow up Type')),
    // Tab(child: Text('Source')),
    // Tab(child: Text('Status')),
  ];

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    callApiDataOnIndex();
    super.onInit();
  }

  void callApiDataOnIndex() {}
}
