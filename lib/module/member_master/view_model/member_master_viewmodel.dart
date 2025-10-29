import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberMasterViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  List<Widget> tabs = [
    Tab(child: Text('Training Mode')),
    Tab(child: Text('Training Type')),
    Tab(child: Text('Plans')),
    Tab(child: Text('Goal')),
    Tab(child: Text('Group')),
  ];

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }
}
