import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/repository/source_repo.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/errorstrings.dart';
import '../model/lead_source_model.dart';

class LeadSourceViewModel extends GetxController {
  final sourceRepo = SourceRepo();
  RxBool isdataLoading = false.obs;
  RxBool isAddLoading = false.obs;
  RxBool isDeleteLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  TextEditingController newLeadSourceController = TextEditingController();
  RxList<LeadSourceData> source = <LeadSourceData>[].obs;
  List<String> columnName = ['Name', 'Action'];

  @override
  void onInit() {
    getLeadSource();
    super.onInit();
  }

  void setData({required String sourceName}) {
    newLeadSourceController.text = sourceName;
  }

  void getLeadSource() async {
    isdataLoading.value = true;
    try {
      var res = await sourceRepo.getSource();
      if (res.status == success) {
        source.value = res.data ?? [];
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

  void addLeadSource(BuildContext context) async {
    isAddLoading.value = true;
    Map<String, dynamic> body = {"name": newLeadSourceController.text.trim()};
    try {
      var res = await sourceRepo.addSource(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getLeadSource();
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

  void updateLeadSource({
    required BuildContext context,
    required String id,
  }) async {
    isUpdateLoading.value = true;
    Map<String, dynamic> body = {
      "name": newLeadSourceController.text.trim(),
      "id": id,
    };
    try {
      var res = await sourceRepo.updateSource(body);
      print(res);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getLeadSource();
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
      var res = await sourceRepo.deletSource(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        getLeadSource();
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

  clear() {
    Get.back();
    newLeadSourceController.clear();
  }
}
