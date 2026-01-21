import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/module/dashboard/model/expiry_member_model.dart';
import 'package:gymgeni/module/dashboard/model/pie_stats_model.dart';
import 'package:gymgeni/module/dashboard/model/recent_acitivity_model.dart';
import 'package:gymgeni/repository/dashboard_repo.dart';
import 'package:gymgeni/repository/expiry_member_repo.dart';
import 'package:gymgeni/repository/pie_stats_repo.dart';
import 'package:gymgeni/repository/recent_activites_repo.dart';
import '../../../utils/constant.dart';
import '../../../utils/errorstrings.dart';
import '../model/dashboard_business_overall_componenet_model.dart';

class DashboardViewModel extends GetxController {
  final dashBoardRepo = DashboardRepo();
  final recentActivitesRepo = RecentActivitesRepo();
  final expiryMemberRepo = ExpiryMemberRepo();
  final pieStatsRepo = PieStatsRepo();
  final RxString hoverRoute = ''.obs;
  RxBool isdataLoading = false.obs;
  RxBool isRecentDataLoading = false.obs;
  RxBool isexiryMemberDataLoading = false.obs;
  RxBool isPieDataLoading = false.obs;
  Rx<DashboardData> dashboardDataStats = DashboardData().obs;
  Rx<PieStatsData> pieStatMetricData = PieStatsData().obs;
  List<DashBoardBusinessOverAllComponenetModel> mainHeroList = [];
  RxList<RecentActivityData> recentActivitesList = <RecentActivityData>[].obs;
  RxList<ExpiryMembers> expiryMembersList = <ExpiryMembers>[].obs;
  bool isHovering(String route) => hoverRoute.value == route;
  Map<String, double> dataMap = {};

  @override
  void onInit() {
    getDashBoardStats();
    getExpiryMembersData();
    getRecentActivites();
    getPieStatsData();
    super.onInit();
  }

  void menuOnTap(String route) {
    Get.rootDelegate.toNamed(route);
  }

  RxInt selectedIndex = 0.obs;
  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void getPieStatsMetricData() {
    dataMap = {
      "Monthly Plan":
          pieStatMetricData.value.monthlyPercentage?.toDouble() ?? 0.0,
      "Qauterly Plan":
          pieStatMetricData.value.quarterlyPercentage?.toDouble() ?? 0.0,
      "Yearly Plan":
          pieStatMetricData.value.yearlyPercentage?.toDouble() ?? 0.0,
    };
  }

  final List<Color> colorList = [
    Colors.blueAccent,
    Colors.redAccent,
    Colors.greenAccent,
  ];

  void getDashBoardStats() async {
    isdataLoading.value = true;
    try {
      var res = await dashBoardRepo.getDashboardStats();
      if (res.status == success) {
        dashboardDataStats.value = res.data ?? DashboardData();
        getMainList();
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isdataLoading.value = false;
    }
  }

  void getRecentActivites() async {
    isRecentDataLoading.value = true;
    try {
      var res = await recentActivitesRepo.getRecentActivities();
      if (res.status == success) {
        recentActivitesList.value = res.data ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isRecentDataLoading.value = false;
    }
  }

  void getExpiryMembersData() async {
    isexiryMemberDataLoading.value = true;
    try {
      var res = await expiryMemberRepo.getExpiryMembers();
      if (res.status == success) {
        expiryMembersList.value = res.data?.members ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isexiryMemberDataLoading.value = false;
    }
  }

  void getPieStatsData() async {
    isPieDataLoading.value = true;
    try {
      var res = await pieStatsRepo.getPieStats();
      if (res.status == success) {
        pieStatMetricData.value =
            res.data ??
            PieStatsData(
              monthlyPercentage: 0,
              quarterlyPercentage: 0,
              yearlyPercentage: 0,
            );
        getPieStatsMetricData();
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isPieDataLoading.value = false;
    }
  }

  void getMainList() {
    mainHeroList = [
      DashBoardBusinessOverAllComponenetModel(
        icons: Icons.arrow_upward_rounded,
        iconsColor: Colors.green,
        label: 'Total Members',
        amount: dashboardDataStats.value.totalMembers ?? 0,
        percentage: '12.5',
        color: Color(0xff1a000000),
        image: 'assets/employeegroup.png',
      ),
      DashBoardBusinessOverAllComponenetModel(
        iconsColor: Colors.green,
        icons: Icons.arrow_upward_rounded,
        color: Color(0xFFEFF6FF),
        label: 'Active Members',
        amount: dashboardDataStats.value.activeMembers ?? 0,
        percentage: '8.5',
        image: 'assets/employee.png',
      ),
      DashBoardBusinessOverAllComponenetModel(
        icons: Icons.arrow_upward_rounded,
        iconsColor: Colors.green,
        label: 'Total Plan Expiry',
        amount: dashboardDataStats.value.expiringSoonMembers ?? 0,
        percentage: '12.5',
        color: Color(0xff1a000000),
        image: 'assets/employeegroup.png',
      ),
      DashBoardBusinessOverAllComponenetModel(
        iconsColor: Colors.green,
        icons: Icons.arrow_upward_rounded,
        color: Color(0xFFEFF6FF),
        label: 'Pending Balance',
        amount: dashboardDataStats.value.totalPendingBalance ?? 0,
        percentage: '8.5',
        image: 'assets/employee.png',
      ),
      DashBoardBusinessOverAllComponenetModel(
        iconsColor: Colors.red,
        icons: Icons.arrow_downward_rounded,
        color: Color(0xFFFAF5FF),
        label: 'Member Present',
        amount: dashboardDataStats.value.presentMembersPercentage ?? 0,
        percentage: '2.5',
        image: 'assets/attendence.png',
      ),
      DashBoardBusinessOverAllComponenetModel(
        iconsColor: Colors.green,
        icons: Icons.arrow_upward_rounded,
        color: Color(0xFFFEFCE8),
        label: 'Today Revenue',
        amount: dashboardDataStats.value.totalRevenue ?? 0,
        percentage: '15.5',
        image: 'assets/money.png',
      ),
      DashBoardBusinessOverAllComponenetModel(
        iconsColor: Colors.green,
        icons: Icons.arrow_upward_rounded,
        color: Color(0xFFFEFCE8),
        label: 'Weekely Revenue',
        amount: dashboardDataStats.value.weeklyRevenue ?? 0,
        percentage: '15.5',
        image: 'assets/money.png',
      ),
      DashBoardBusinessOverAllComponenetModel(
        iconsColor: Colors.green,
        icons: Icons.arrow_upward_rounded,
        color: Color(0xFFFEFCE8),
        label: 'Monthly Revenue',
        amount: dashboardDataStats.value.monthlyRevenue ?? 0,
        percentage: '15.5',
        image: 'assets/money.png',
      ),
    ];
  }
}
