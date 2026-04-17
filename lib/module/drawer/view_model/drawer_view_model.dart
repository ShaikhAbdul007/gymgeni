import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gymgeni/cachemanager/cache_manager.dart';
import 'package:gymgeni/data/networking.dart';
import 'package:gymgeni/module/user/model/user_model.dart';
import 'package:gymgeni/repository/user_repository.dart';
import 'package:gymgeni/utils/constant.dart';
import 'package:gymgeni/utils/errorstrings.dart';

import '../../../routes/routes_path.dart';
import '../widget/menu_item.dart';

class CustomDrawerController extends GetxController with CacheManager {
  UserRepository userRepository = UserRepository();
  Rx<UserData> userData = UserData().obs;
  var isUserDataLoading = false.obs;
  var selectedIndex = 0.obs; // selected menu ke liye
  var hoverIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  void menuOnTap(int index, String route) {
    selectedIndex.value = index;
    Get.rootDelegate.toNamed(route);
  }

  void onHovering(bool hovering, int index) {
    hoverIndex.value = hovering ? index : -1;
  }

  void getUserData() async {
    isUserDataLoading.value = true;
    var userProfileData = retrieveUserDetails();
    try {
      var res = await userRepository.getUserData(
        body: {'userId': userProfileData.id ?? ''},
      );
      if (res.status == success) {
        userData.value = res.data ?? UserData();
      } else if (res.status == failed) {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isUserDataLoading.value = false;
    }
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
