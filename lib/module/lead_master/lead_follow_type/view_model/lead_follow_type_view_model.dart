import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/module/lead_master/lead_follow_type/model/lead_follow_type_model.dart';

import '../../../../repository/lead_master_follow_type_repo.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/errorstrings.dart';

class LeadFollowTypeViewModel extends GetxController {
  final leadFollowTypeRepo = LeadMasterFollowTypeRepo();
  RxBool isdataLoading = false.obs;
  RxBool isAddLoading = false.obs;
  RxBool isDeleteLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  TextEditingController newLeadFollowTypeController = TextEditingController();
  RxList<LeadFollowUpTypeData> followUpName = <LeadFollowUpTypeData>[].obs;
  List<String> columnName = ['Name', 'Action'];

  @override
  void onInit() {
    getLeadFollowType();
    super.onInit();
  }

  void setData({required String leadfollowUpType}) {
    newLeadFollowTypeController.text = leadfollowUpType;
  }

  void getLeadFollowType() async {
    isdataLoading.value = true;
    try {
      var res = await leadFollowTypeRepo.getLeadMasterFollowType();
      if (res.status == success) {
        followUpName.value = res.data ?? [];
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
      isdataLoading.value = false;
    }
  }

  void addLeadFollowType(BuildContext context) async {
    isAddLoading.value = true;
    Map<String, dynamic> body = {
      "name": newLeadFollowTypeController.text.trim(),
    };
    try {
      var res = await leadFollowTypeRepo.addLeadMasterFollowType(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getLeadFollowType();
      } else if (res.status == failed) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      } else {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isAddLoading.value = false;
    }
  }

  void updateLeadFollowType({
    required BuildContext context,
    required String id,
  }) async {
    isUpdateLoading.value = true;
    Map<String, dynamic> body = {
      "name": newLeadFollowTypeController.text.trim(),
      "id": id,
    };
    try {
      var res = await leadFollowTypeRepo.updateLeadMasterFollowType(body);
      print(res);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getLeadFollowType();
      } else if (res.status == failed) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      } else {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isUpdateLoading.value = false;
    }
  }

  void deleteLeadFollowType({
    required BuildContext context,
    required String id,
  }) async {
    isDeleteLoading.value = true;
    Map<String, dynamic> body = {"id": id};
    try {
      var res = await leadFollowTypeRepo.deletLeadMasterFollowType(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        getLeadFollowType();
      } else if (res.status == failed) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      } else {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isDeleteLoading.value = false;
    }
  }

  void clear() {
    Get.back();
    newLeadFollowTypeController.clear();
  }
}
