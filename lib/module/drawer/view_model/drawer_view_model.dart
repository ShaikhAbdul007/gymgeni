import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gymgeni/cachemanager/cache_manager.dart';

import '../../../routes/routes_path.dart';
import '../widget/menu_item.dart';

class CustomDrawerController extends GetxController with CacheManager {
  var selectedIndex = 0.obs; // selected menu ke liye
  var hoverIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    _updateSelectedIndex();
    Get.rootDelegate.addListener(_routeListener);
  }

  @override
  void onReady() {
    super.onReady();
    _updateSelectedIndex();
  }

  @override
  void onClose() {
    Get.rootDelegate.removeListener(_routeListener);
    super.onClose();
  }

  void _routeListener() {
    _updateSelectedIndex();
  }

  void _updateSelectedIndex() {
    final currentRoute = Get.currentRoute;
    final delegateRoute = Get.rootDelegate.currentConfiguration?.currentPage?.name ?? '';
    for (int i = 0; i < listMenuItem.length; i++) {
      final route = listMenuItem[i].route;
      if (currentRoute.startsWith(route) || (delegateRoute.isNotEmpty && delegateRoute.startsWith(route))) {
        selectedIndex.value = i;
        break;
      }
    }
  }

  void menuOnTap(int index, String route) {
    selectedIndex.value = index;
    if (route == RoutesPaths.loginView) {
      removeBox();
      Get.rootDelegate.offNamed(RoutesPaths.loginView);
      return;
    }
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
      route: RoutesPaths.dashboardView,
      itemName: 'Dashboard',
    ),
    MenuItem(
      isSelected: false,
      isHovered: false,
      icon: CupertinoIcons.person,
      route: RoutesPaths.memberView,
      itemName: 'Member',
    ),
    MenuItem(
      isSelected: false,
      isHovered: false,
      icon: CupertinoIcons.person_3,
      route: RoutesPaths.leadView,
      itemName: 'Leads',
    ),
    MenuItem(
      isSelected: false,
      isHovered: false,
      icon: CupertinoIcons.money_dollar,
      route: RoutesPaths.financeView,
      itemName: 'Finance',
    ),
    MenuItem(
      isSelected: false,
      isHovered: false,
      icon: CupertinoIcons.news,
      route: RoutesPaths.reportView,
      itemName: 'Reports',
    ),
    MenuItem(
      isSelected: false,
      isHovered: false,
      icon: CupertinoIcons.person_2,
      route: RoutesPaths.employeeView,
      itemName: 'Employees',
    ),
    MenuItem(
      isSelected: false,
      isHovered: false,
      icon: CupertinoIcons.square_arrow_right,
      route: RoutesPaths.loginView,
      itemName: 'Logout',
    ),
  ];
}
