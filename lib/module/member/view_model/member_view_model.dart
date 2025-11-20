import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/repository/member_master_goal_repo.dart';
import 'package:gymgeni/repository/member_master_plan_repo.dart';
import 'package:gymgeni/repository/member_master_trainingtype_repo.dart';
import 'package:gymgeni/repository/member_repo.dart';
import 'package:gymgeni/utils/errorstrings.dart';

import '../../../utils/constant.dart';
import '../../member_master/member_goal/model/member_allgoal_model.dart';
import '../../member_master/member_plan/model/member_allplan_model.dart';
import '../../member_master/member_trainingtype/model/member_alltrainingtype_model.dart';
import '../model/members_model.dart';

class MemberViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  final goalRepo = GoalRepo();
  final planRepo = PlanRepo();
  final traingTypeRepo = TraingTypeRepo();
  final memberRepo = MemberRepo();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController alternateContactNo = TextEditingController();
  TextEditingController goal = TextEditingController();
  TextEditingController healthCondition = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController search = TextEditingController();
  TextEditingController source = TextEditingController();
  TabController? tabController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> genderList = ['Male', 'Female', 'Other'];
  RxList<MemberAllPlanData> planList = <MemberAllPlanData>[].obs;
  RxList<MemberAllGoalData> goalList = <MemberAllGoalData>[].obs;
  RxList<MemberAllTrainingTypeData> trainingTypeList =
      <MemberAllTrainingTypeData>[].obs;
  RxList<Members> getMember = <Members>[].obs;
  final RxBool isMembersLoading = false.obs;
  final List<String> columnNames = [
    'Member',
    'Plan',
    'Amount',
    'Balance',
    'Status',
    'Join Date',
    'Expire Date',
    'Action',
  ];
  List<Tab> tabs = [
    Tab(child: Text('All')),
    Tab(child: Text('Active')),
    Tab(child: Text('Inactive')),
    Tab(child: Text('Pending')),
    Tab(child: Text('Freezed')),
    Tab(child: Text('Attendence')),
    Tab(child: Text('Configuration')),
  ];

  data() {
    tabController!.addListener(() {
      if (tabController!.indexIsChanging) return;
      switch (tabController!.index) {
        case 0:
          getMemberData(memberStatus: 'All');
          break;
        case 1:
          getMemberData(memberStatus: 'Active');
          break;
        case 2:
          getMemberData(memberStatus: 'Inactive');
          break;
        case 3:
          getMemberData(memberStatus: 'Pending');
          break;
        case 4:
          getMemberData(memberStatus: 'Freezed');
          break;
      }
    });
    getMemberData(memberStatus: 'All');
  }

  void openDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.closeEndDrawer();
  }

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    data();
    getPlanData();
    getGoalData();
    getTraingTypeData();
    super.onInit();
  }

  getPlanData() async {
    var res = await planRepo.getPlan();
    if (res.status == success) {
      planList.value = res.memberAllPlanData ?? [];
    } else {
      Constant.showSnackBar(
        context: Get.context!,
        errorMessage: res.message ?? '',
        errorStatus: false,
      );
    }
  }

  getGoalData() async {
    var res = await goalRepo.getGoal();
    if (res.status == success) {
      goalList.value = res.memberAllGoalData ?? [];
    } else {
      Constant.showSnackBar(
        context: Get.context!,
        errorMessage: res.message ?? '',
        errorStatus: false,
      );
    }
  }

  getTraingTypeData() async {
    var res = await traingTypeRepo.getTraingTypeMode();
    if (res.status == success) {
      trainingTypeList.value = res.memberAllTrainingTypeData ?? [];
    } else {
      Constant.showSnackBar(
        context: Get.context!,
        errorMessage: res.message ?? '',
        errorStatus: false,
      );
    }
  }

  getMemberData({required String memberStatus}) async {
    isMembersLoading.value = true;
    try {
      var res = await memberRepo.getMemberData(memberStatus: memberStatus);
      if (res.status == success) {
        getMember.value = res.data?.members ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isMembersLoading.value = false;
    }
  }
}
