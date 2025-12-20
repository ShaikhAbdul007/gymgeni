import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/repository/finance_payment_method_repo.dart';
import 'package:gymgeni/repository/member_master_goal_repo.dart';
import 'package:gymgeni/repository/member_master_group_repo.dart';
import 'package:gymgeni/repository/member_master_plan_repo.dart';
import 'package:gymgeni/repository/member_master_trainingtype_repo.dart';
import 'package:gymgeni/repository/member_repo.dart';
import 'package:gymgeni/repository/source_repo.dart';
import 'package:gymgeni/utils/errorstrings.dart';
import '../../../repository/member_master_trainingmode_repo.dart';
import '../../../utils/constant.dart';
import '../../../utils/keys.dart';
import '../../finance_master/finance_payment_method/model/all_payment_method_model.dart';
import '../../lead_master/lead_source/model/lead_source_model.dart';
import '../../member_master/member_goal/model/member_allgoal_model.dart';
import '../../member_master/member_group/model/member_allgroup_model.dart';
import '../../member_master/member_plan/model/member_allplan_model.dart';
import '../../member_master/member_trainingtype/model/member_alltrainingtype_model.dart';
import '../../member_master/member_triaingmode/model/member_alltraining_model.dart';
import '../model/members_model.dart';

class MemberViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  final goalRepo = GoalRepo();
  final planRepo = PlanRepo();
  final group = GroupRepo();
  final traingTypeRepo = TraingTypeRepo();
  final traingModeRepo = TraingModeRepo();
  final memberRepo = MemberRepo();
  final sources = SourceRepo();
  final paymentMode = FinancePaymentMethodRepo();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController afterdiscountAmount = TextEditingController();
  TextEditingController amountpaid = TextEditingController();
  TextEditingController balanceAmount = TextEditingController();
  TextEditingController pendingDate = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController goalListController = TextEditingController();
  TextEditingController planListController = TextEditingController();
  TextEditingController trainingModeListController = TextEditingController();
  TextEditingController trainingTypeListController = TextEditingController();
  TextEditingController healthCondition = TextEditingController();
  TextEditingController joiningDate = TextEditingController();
  TextEditingController search = TextEditingController();
  TextEditingController source = TextEditingController();
  TextEditingController alternateNumber = TextEditingController();
  TextEditingController paymentModeListController = TextEditingController();
  TextEditingController groupListController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController chestController = TextEditingController();
  TextEditingController hipsController = TextEditingController();
  TextEditingController stomachController = TextEditingController();
  TextEditingController thighController = TextEditingController();
  TextEditingController bodyAgeController = TextEditingController();
  TextEditingController breakfastController = TextEditingController();
  TextEditingController lunchController = TextEditingController();
  TextEditingController dinnerController = TextEditingController();
  TextEditingController pushUpStrengthController = TextEditingController();
  TextEditingController curlUpController = TextEditingController();
  TextEditingController mobilityController = TextEditingController();
  TextEditingController heartRateController = TextEditingController();
  TextEditingController heartRateTreadmillController = TextEditingController();
  TextEditingController sitReachController = TextEditingController();
  final List<String> genderList = ['Male', 'Female', 'Other'];
  RxList<MemberAllPlanData> planList = <MemberAllPlanData>[].obs;
  RxList<MemberAllGoalData> goalList = <MemberAllGoalData>[].obs;
  RxList<MemberAllTrainingTypeData> trainingTypeList =
      <MemberAllTrainingTypeData>[].obs;
  RxList<MemberAllTrainingData> trainingModeList =
      <MemberAllTrainingData>[].obs;
  RxList<Members> getMember = <Members>[].obs;
  RxList<LeadSourceData> sourceList = <LeadSourceData>[].obs;
  RxList<AllPaymentData> paymentList = <AllPaymentData>[].obs;
  RxList<MemberAllGroupData> groupList = <MemberAllGroupData>[].obs;
  final RxBool isMembersLoading = false.obs;
  final RxBool isDropDownLoading = false.obs;
  final RxBool isBMRClick = false.obs;
  Rx<Uint8List?> selectedImage = Rx<Uint8List?>(null);
  RxString fileName = ''.obs;

  TabController? tabController;
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

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    data();
    getPlanData();
    getGoalData();
    getSourceData();
    getTraingTypeData();
    getTraingModeData();
    getPaymentModeData();
    getGroupData();
    super.onInit();
  }

  void pickImage() {
    final html.FileUploadInputElement input = html.FileUploadInputElement();

    input.accept = 'image/*';
    input.click();

    input.onChange.listen((event) {
      final file = input.files?.first;
      if (file == null) return;

      fileName.value = file.name;

      final reader = html.FileReader();
      reader.readAsArrayBuffer(file);

      reader.onLoadEnd.listen((event) {
        selectedImage.value = reader.result as Uint8List;
      });
    });
  }

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
    memberScaffoldKey.currentState?.openEndDrawer();
  }

  void closeDrawer() {
    memberScaffoldKey.currentState?.closeEndDrawer();
  }

  void setPlanListAmount(value) {
    planListController.text = value;
    for (int i = 0; i < planList.length; i++) {
      if (value == planList[i].id) {
        amount.text = planList[i].price ?? '';
      }
    }
  }

  void discountValue() {
    final discountPercentage = int.tryParse(discount.text) ?? 0;
    Constant.customPrintLog('amount.text ${amount.text}');
    final totalPlanAmount = double.tryParse(amount.text) ?? 0;
    final discountValue = (totalPlanAmount * discountPercentage) / 100;
    final afterDiscountAmount = totalPlanAmount - discountValue;
    afterdiscountAmount.text = afterDiscountAmount.toStringAsFixed(0);
  }

  void getPlanData() async {
    isDropDownLoading.value = true;
    var res = await planRepo.getPlan();
    try {
      if (res.status == success) {
        planList.value = res.memberAllPlanData ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isDropDownLoading.value = false;
    }
  }

  void getGroupData() async {
    isDropDownLoading.value = true;
    var res = await group.getGroup();
    try {
      if (res.status == success) {
        groupList.value = res.memberAllGroupData ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isDropDownLoading.value = false;
    }
  }

  void getPaymentModeData() async {
    isDropDownLoading.value = true;
    var res = await paymentMode.getFinancePaymentMethod();
    try {
      if (res.status == success) {
        paymentList.value = res.data ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isDropDownLoading.value = false;
    }
  }

  void getSourceData() async {
    isDropDownLoading.value = true;
    try {
      var res = await sources.getSource();
      if (res.status == success) {
        sourceList.value = res.data ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isDropDownLoading.value = false;
    }
  }

  void getGoalData() async {
    isDropDownLoading.value = true;
    try {
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
    } finally {
      isDropDownLoading.value = false;
    }
  }

  void getTraingTypeData() async {
    isDropDownLoading.value = true;
    try {
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
    } finally {
      isDropDownLoading.value = false;
    }
  }

  void getTraingModeData() async {
    isDropDownLoading.value = true;
    try {
      var res = await traingModeRepo.getTraingMode();
      if (res.status == success) {
        trainingModeList.value = res.memberAllTrainingData ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isDropDownLoading.value = false;
    }
  }

  void getMemberData({required String memberStatus}) async {
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
