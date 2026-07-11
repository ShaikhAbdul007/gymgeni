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
import '../model/add_lead_model.dart';
import '../model/all_lead_model.dart';
import 'package:gymgeni/repository/finance_payment_method_repo.dart';
import '../../finance_master/finance_payment_method/model/all_payment_method_model.dart';
import 'package:gymgeni/cachemanager/cache_manager.dart';

class LeadViewModel extends GetxController
    with GetSingleTickerProviderStateMixin, CacheManager {
  final allLeadRepo = LeadRepo();
  final source = SourceRepo();
  final followupType = LeadMasterFollowTypeRepo();
  final category = LeadMasterCategoryRepo();
  final status = LeadStatusRepo();
  final plan = PlanRepo();
  final paymentModeRepo = FinancePaymentMethodRepo();
  RxBool isEditMode = false.obs;
  RxString selectedLeadId = ''.obs;
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
  RxList<AllPaymentData> paymentList = <AllPaymentData>[].obs;
  RxBool isAllLeaLoading = false.obs;
  RxBool isCreateNewLead = false.obs;
  RxBool isdataLoading = false.obs;
  RxBool isConvertLoading = false.obs;
  @override
  void onInit() {
    checkAuthGuard();
    tabController = TabController(length: tabs.length, vsync: this);
    getAllLeadData();
    getCategoryData();
    getFollowUpTypeData();
    getPlanData();
    getSourceData();
    getStatusData();
    getPaymentModeData();
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

  void getPaymentModeData() async {
    isdataLoading.value = true;
    var res = await paymentModeRepo.getFinancePaymentMethod();
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
      isdataLoading.value = false;
    }
  }

  void onCreateNewLeadTap() {
    isEditMode.value = false;
    selectedLeadId.value = '';
    firstname.clear();
    lastname.clear();
    contactNo.clear();
    selectedGender.clear();
    expectedDate.clear();
    email.clear();
    address.clear();
    description.clear();
    sourceListId.clear();
    followUpListId.clear();
    statusListId.clear();
    categorieListId.clear();
    planListId.clear();
    webImage.value = Uint8List(0);
    resImage = null;
    openDrawer();
  }

  void onEditLeadTap(Leads lead) {
    isEditMode.value = true;
    selectedLeadId.value = lead.id ?? '';
    firstname.text = lead.name?.split(' ').first ?? '';
    lastname.text = (lead.name?.split(' ').length ?? 0) > 1 ? lead.name!.split(' ').sublist(1).join(' ') : '';
    selectedGender.text = lead.gender ?? '';
    contactNo.text = lead.mobile ?? '';
    email.text = lead.email ?? '';
    expectedDate.text = lead.expectedDate ?? '';
    description.text = lead.description ?? '';
    address.text = lead.address ?? '';
    sourceListId.text = lead.leadsourceId ?? '';
    followUpListId.text = lead.leadfollowtypeId ?? '';
    statusListId.text = lead.leadstatusId ?? '';
    categorieListId.text = lead.leadcategoryId ?? '';
    planListId.text = lead.planId ?? '';
    webImage.value = Uint8List(0);
    resImage = null;
    openDrawer();
  }

  void submitNewLead(Map<String, String> body) async {
    isCreateNewLead.value = true;
    try {
      AddLeadModel res;
      if (isEditMode.value) {
        body["id"] = selectedLeadId.value;
        res = await allLeadRepo.updateLeadData(
          body: body,
          fileBytes: webImage.value.isNotEmpty ? webImage.value : null,
          fileField: webImage.value.isNotEmpty ? 'image' : null,
          fileName: (resImage?.name ?? '').isNotEmpty ? resImage!.name : null,
        );
      } else {
        res = await allLeadRepo.addNewLeadData(
          body: body,
          fileBytes: webImage.value.isNotEmpty ? webImage.value : null,
          fileField: webImage.value.isNotEmpty ? 'image' : null,
          fileName: (resImage?.name ?? '').isNotEmpty ? resImage!.name : null,
        );
      }
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

  void convertLeadToMember(Map<String, dynamic> body) async {
    if (Get.context == null) return;
    isConvertLoading.value = true;
    try {
      var res = await allLeadRepo.convertLeadToMember(body: body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? 'Lead converted to member successfully',
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
    } catch (e) {
      Constant.showSnackBar(
        context: Get.context!,
        errorMessage: e.toString(),
        errorStatus: false,
      );
    } finally {
      isConvertLoading.value = false;
    }
  }
}
