import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/repository/lead_status_repo.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/errorstrings.dart';
import '../model/lead_status_model.dart';

class LeadStatusViewModel extends GetxController {
  final leadStatusRepo = LeadStatusRepo();
  RxBool isdataLoading = false.obs;
  RxBool isAddLoading = false.obs;
  RxBool isDeleteLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  TextEditingController newLeadSourceController = TextEditingController();
  RxList<LeadStatusData> status = <LeadStatusData>[].obs;
  List<String> columnName = ['Name', 'Action'];

  @override
  void onInit() {
    getLeadStatus();
    super.onInit();
  }

  void setData({required String statusName}) {
    newLeadSourceController.text = statusName;
  }

  void getLeadStatus() async {
    isdataLoading.value = true;
    try {
      var res = await leadStatusRepo.getLeadStatus();
      if (res.status == success) {
        status.value = res.data ?? [];
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

  void addLeadStatus(BuildContext context) async {
    isAddLoading.value = true;
    Map<String, dynamic> body = {"name": newLeadSourceController.text.trim()};
    try {
      var res = await leadStatusRepo.addLeadStatus(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getLeadStatus();
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

  void updateLeadStatus({
    required BuildContext context,
    required String id,
  }) async {
    isUpdateLoading.value = true;
    Map<String, dynamic> body = {
      "name": newLeadSourceController.text.trim(),
      "id": id,
    };
    try {
      var res = await leadStatusRepo.updateLeadStatus(body);
      print(res);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getLeadStatus();
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

  void deleteLeadSource({
    required BuildContext context,
    required String id,
  }) async {
    isDeleteLoading.value = true;
    Map<String, dynamic> body = {"id": id};
    try {
      var res = await leadStatusRepo.deletLeadStatus(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        getLeadStatus();
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
    newLeadSourceController.clear();
  }
}
