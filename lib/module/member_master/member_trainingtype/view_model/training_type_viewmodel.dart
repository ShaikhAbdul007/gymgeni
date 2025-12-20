import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/utils/constant.dart';
import 'package:gymgeni/utils/errorstrings.dart';
import '../../../../repository/member_master_trainingtype_repo.dart';
import '../model/member_alltrainingtype_model.dart';

class TrainingTypeViewmodel extends GetxController {
  final memberTraingTypeRepo = TraingTypeRepo();
  TextEditingController newTrainingController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  RxBool isAddLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  RxBool isDeleteLoading = false.obs;
  RxBool isdataLoading = false.obs;
  List<String> columnName = ['Trainig Type', 'Action'];
  RxList<MemberAllTrainingTypeData> trainingType =
      <MemberAllTrainingTypeData>[].obs;

  @override
  void onInit() {
    getTraingMode();
    super.onInit();
  }

  clear() {
    newTrainingController.clear();
    Get.back();
  }

  setData({required String traingName}) {
    newTrainingController.text = traingName;
  }

  getTraingMode() async {
    isdataLoading.value = true;
    try {
      var res = await memberTraingTypeRepo.getTraingTypeMode();
      if (res.status == success) {
        trainingType.value = res.memberAllTrainingTypeData ?? [];
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

  addTrainingType(BuildContext context) async {
    isAddLoading.value = true;
    Map<String, dynamic> body = {"name": newTrainingController.text.trim()};
    try {
      var res = await memberTraingTypeRepo.addNewTraingTypeMode(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,

          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getTraingMode();
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

  updateTrainingType({
    required BuildContext context,
    required String id,
  }) async {
    isUpdateLoading.value = true;
    Map<String, dynamic> body = {
      "name": newTrainingController.text.trim(),
      "id": id,
    };
    try {
      var res = await memberTraingTypeRepo.updateTraingTypeMode(body);
      Constant.customPrintLog(res);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,

          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getTraingMode();
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

  deleteTrainingType({
    required BuildContext context,
    required String id,
  }) async {
    isDeleteLoading.value = true;
    Map<String, dynamic> body = {"id": id};
    try {
      var res = await memberTraingTypeRepo.deleteTraingTypeMode(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,

          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        getTraingMode();
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

  @override
  void dispose() {
    newTrainingController.dispose();
    super.dispose();
  }
}
