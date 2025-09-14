import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/dashboard_business_overall_componenet_model.dart';

class DashboardViewModel extends GetxController {
  final RxString hoverRoute = ''.obs;

  void changeHoverItem(String route) {}

  bool isHovering(String route) => hoverRoute.value == route;

  void menuOnTap(String route) {
    Get.rootDelegate.toNamed(route);
  }

  RxInt selectedIndex = 0.obs;
  changeIndex(int index) {
    selectedIndex.value = index;
  }

  final dataMap = <String, double>{
    "Monthly Plan": 5,
    "Qauterly Plan": 8,
    "Yearly Plan": 12,
  };
  final List<Color> colorList = [
    Colors.blueAccent,
    Colors.redAccent,
    Colors.greenAccent,
  ];
  var mainHeroList = [
    DashBoardBusinessOverAllComponenetModel(
      icons: Icons.arrow_upward_rounded,
      iconsColor: Colors.green,
      label: 'Total Members',
      amount: '1,248',
      percentage: '12.5',
      color: Color(0xff1a000000),
      image: 'assets/employeegroup.png',
    ),
    DashBoardBusinessOverAllComponenetModel(
      iconsColor: Colors.green,
      icons: Icons.arrow_upward_rounded,
      color: Color(0xFFEFF6FF),
      label: 'Active Members',
      amount: '856',
      percentage: '8.5',
      image: 'assets/employee.png',
    ),
    DashBoardBusinessOverAllComponenetModel(
      icons: Icons.arrow_upward_rounded,
      iconsColor: Colors.green,
      label: 'Total Plan Expiry',
      amount: '1,248',
      percentage: '12.5',
      color: Color(0xff1a000000),
      image: 'assets/employeegroup.png',
    ),
    DashBoardBusinessOverAllComponenetModel(
      iconsColor: Colors.green,
      icons: Icons.arrow_upward_rounded,
      color: Color(0xFFEFF6FF),
      label: 'Pending Balance',
      amount: '856',
      percentage: '8.5',
      image: 'assets/employee.png',
    ),
    DashBoardBusinessOverAllComponenetModel(
      iconsColor: Colors.red,
      icons: Icons.arrow_downward_rounded,
      color: Color(0xFFFAF5FF),
      label: 'Member Present',
      amount: '78.5 %',
      percentage: '2.5',
      image: 'assets/attendence.png',
    ),
    DashBoardBusinessOverAllComponenetModel(
      iconsColor: Colors.green,
      icons: Icons.arrow_upward_rounded,
      color: Color(0xFFFEFCE8),
      label: 'Today Revenue',
      amount: '24,568',
      percentage: '15.5',
      image: 'assets/money.png',
    ),
    DashBoardBusinessOverAllComponenetModel(
      iconsColor: Colors.green,
      icons: Icons.arrow_upward_rounded,
      color: Color(0xFFFEFCE8),
      label: 'Weekely Revenue',
      amount: '24,568',
      percentage: '15.5',
      image: 'assets/money.png',
    ),
    DashBoardBusinessOverAllComponenetModel(
      iconsColor: Colors.green,
      icons: Icons.arrow_upward_rounded,
      color: Color(0xFFFEFCE8),
      label: 'Monthly Revenue',
      amount: '24,568',
      percentage: '15.5',
      image: 'assets/money.png',
    ),
  ];
}
