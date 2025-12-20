import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/module/lead_master/lead_source/model/lead_source_model.dart';
import 'package:gymgeni/repository/lead_master_category_repo.dart';
import 'package:gymgeni/repository/lead_master_follow_type_repo.dart';
import 'package:gymgeni/repository/lead_repo.dart';
import 'package:gymgeni/repository/lead_status_repo.dart';
import 'package:gymgeni/repository/source_repo.dart';
import 'package:gymgeni/utils/keys.dart';
import 'package:image_picker/image_picker.dart';

import '../../../repository/member_master_plan_repo.dart';
import '../../../utils/constant.dart';
import '../../../utils/errorstrings.dart';
import '../../lead_master/lead_categories/model/lead_categories_model.dart';
import '../../lead_master/lead_follow_type/model/lead_follow_type_model.dart';
import '../../lead_master/lead_status/model/lead_status_model.dart';
import '../../member_master/member_plan/model/member_allplan_model.dart';
import '../model/all_lead_model.dart';

class LeadViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  final allLeadRepo = LeadRepo();
  final source = SourceRepo();
  final followupType = LeadMasterFollowTypeRepo();
  final category = LeadMasterCategoryRepo();
  final status = LeadStatusRepo();
  final plan = PlanRepo();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController selectedGender = TextEditingController();
  TextEditingController expectedDate = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController sourceListId = TextEditingController();
  TextEditingController followUpListId = TextEditingController();
  TextEditingController statusListId = TextEditingController();
  TextEditingController categorieListId = TextEditingController();
  TextEditingController planListId = TextEditingController();
  TabController? tabController;
  Rx<Uint8List> webImage = Uint8List(0).obs;
  XFile? resImage;

  List<Tab> tabs = [
    Tab(child: Text('All')),
    Tab(child: Text('Follow History')),
    Tab(child: Text('Configuration')),
  ];
  List<String> columns = [
    'Member Name',
    'Plan',
    'Description',
    'Status',
    'Date',
    'Action',
  ];
  List<String> genderList = ['Male', 'Female', 'Other'];
  RxList<Leads> allleadList = <Leads>[].obs;
  RxList<MemberAllPlanData> planList = <MemberAllPlanData>[].obs;
  RxList<LeadCategoryData> categoryList = <LeadCategoryData>[].obs;
  RxList<LeadStatusData> statusList = <LeadStatusData>[].obs;
  RxList<LeadSourceData> sourceList = <LeadSourceData>[].obs;
  RxList<LeadFollowUpTypeData> followUpTypeList = <LeadFollowUpTypeData>[].obs;
  RxBool isAllLeaLoading = false.obs;
  RxBool isCreateNewLead = false.obs;
  RxBool isdataLoading = false.obs;
  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    getAllLeadData();
    getCategoryData();
    getFollowUpTypeData();
    getPlanData();
    getSourceData();
    getStatusData();
    super.onInit();
  }

  void openDrawer() {
    leadScaffoldKey.currentState?.openEndDrawer();
  }

  void getAllLeadData() async {
    isAllLeaLoading.value = true;
    try {
      var res = await allLeadRepo.getALlLeadData();
      if (res.status == success) {
        allleadList.value = res.data?.leads ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,

          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isAllLeaLoading.value = false;
    }
  }

  void getPlanData() async {
    isAllLeaLoading.value = true;
    try {
      var res = await plan.getPlan();
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
      isAllLeaLoading.value = false;
    }
  }

  void getCategoryData() async {
    isAllLeaLoading.value = true;
    try {
      var res = await category.getLeadMasterCategory();
      if (res.status == success) {
        categoryList.value = res.data ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,

          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isAllLeaLoading.value = false;
    }
  }

  void getStatusData() async {
    isAllLeaLoading.value = true;
    try {
      var res = await status.getLeadStatus();
      if (res.status == success) {
        statusList.value = res.data ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,

          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isAllLeaLoading.value = false;
    }
  }

  void getSourceData() async {
    isAllLeaLoading.value = true;
    try {
      var res = await source.getSource();
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
      isAllLeaLoading.value = false;
    }
  }

  void getFollowUpTypeData() async {
    isAllLeaLoading.value = true;
    try {
      var res = await followupType.getLeadMasterFollowType();
      if (res.status == success) {
        followUpTypeList.value = res.data ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,

          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isAllLeaLoading.value = false;
    }
  }

  void submitNewLead(dynamic body) async {
    isCreateNewLead.value = true;
    try {
      var res = await allLeadRepo.addNewLeadData(
        body: body,
        fileBytes: webImage.value,
        fileField: 'image',
        fileName: resImage?.name ?? '',
      );
      if (res.status == success) {
        Get.back();
        Constant.showSnackBar(
          context: Get.context!,

          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        getAllLeadData();
      } else {
        Constant.showSnackBar(
          context: Get.context!,

          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isCreateNewLead.value = false;
    }
  }
}
