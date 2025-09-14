import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/routes_path.dart';
import '../widget/menu_item.dart';

class CustomDrawerController extends GetxController {
  var selectedIndex = 0.obs; // selected menu ke liye
  var hoverIndex = (-1).obs;

  void menuOnTap(int index, String route) {
    selectedIndex.value = index;
    Get.rootDelegate.toNamed(route);
  }

  void onHovering(bool hovering, int index) {
    hoverIndex.value = hovering ? index : -1;
  }

  List<MenuItem> listMenuItem = [
    MenuItem(
      isSelected: false,
      isHovered: false,
      icon: CupertinoIcons.rectangle_3_offgrid,
      route: RoutesPaths.mainScreen,
      itemName: 'Dashboard',
    ),
    MenuItem(
      isSelected: false,
      isHovered: false,
      icon: CupertinoIcons.person,
      route: RoutesPaths.memberScreen,
      itemName: 'Member',
    ),
    // MenuItem(
    //   isSelected: false,
    //   isHovered: false,
    //   icon: CupertinoIcons.person_3,
    //   route: RoutesPaths.allLeadScreen,
    //   itemName: 'Leads',
    // ),
    // MenuItem(
    //   isSelected: false,
    //   isHovered: false,
    //   icon: CupertinoIcons.money_dollar,
    //   route: RoutesPaths.saleScreen,
    //   itemName: 'Finance',
    // ),
    // MenuItem(
    //   isSelected: false,
    //   isHovered: false,
    //   icon: CupertinoIcons.news,
    //   route: RoutesPaths.reportScreen,
    //   itemName: 'Reports',
    // ),
    // MenuItem(
    //   isSelected: false,
    //   isHovered: false,
    //   icon: CupertinoIcons.person_2_alt,
    //   route: RoutesPaths.allStaffScreen,
    //   itemName: 'Employees',
    // ),
  ];
}
