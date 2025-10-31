import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/repository/member_master_goal_repo.dart';
import 'package:gymgeni/utils/constant.dart';
import 'package:gymgeni/utils/errorstrings.dart';
import '../model/member_allgoal_model.dart';

class GoalViewmodel extends GetxController {
  final goalRepo = GoalRepo();
  TextEditingController newTrainingController = TextEditingController();
  List<String> columnName = ['Goal Name', 'Action'];
  RxBool isAddLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  RxBool isDeleteLoading = false.obs;
  RxBool isdataLoading = false.obs;
  RxList<MemberAllGoalData> goalName = <MemberAllGoalData>[].obs;

  @override
  void onInit() {
    getGoalName();
    super.onInit();
  }

  clear() {
    newTrainingController.clear();
    Get.back();
  }

  setData({required String traingName}) {
    newTrainingController.text = traingName;
  }

  getGoalName() async {
    isdataLoading.value = true;
    try {
      var res = await goalRepo.getGoal();
      if (res.status == success) {
        goalName.value = res.memberAllGoalData ?? [];
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

  addGoalName(BuildContext context) async {
    isAddLoading.value = true;
    Map<String, dynamic> body = {"name": newTrainingController.text.trim()};
    try {
      var res = await goalRepo.addNewGroup(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getGoalName();
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

  updateGoalName({required BuildContext context, required String id}) async {
    isUpdateLoading.value = true;
    Map<String, dynamic> body = {
      "name": newTrainingController.text.trim(),
      "id": id,
    };
    try {
      var res = await goalRepo.updateGroup(body);
      print(res);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getGoalName();
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

  deleteGoalName({required BuildContext context, required String id}) async {
    isDeleteLoading.value = true;
    Map<String, dynamic> body = {"id": id};
    try {
      var res = await goalRepo.deleteGroup(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        getGoalName();
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
