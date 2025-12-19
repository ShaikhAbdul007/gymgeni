import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/repository/member_master_plan_repo.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/errorstrings.dart';
import '../model/member_allplan_model.dart';

class PlanViewmodel extends GetxController {
  final planRepo = PlanRepo();
  TextEditingController newTrainingController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  List<String> columnName = ['Plan Name', 'Action'];
  RxBool isAddLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  RxBool isDeleteLoading = false.obs;
  RxBool isdataLoading = false.obs;
  RxList<MemberAllPlanData> planName = <MemberAllPlanData>[].obs;

  @override
  void onInit() {
    getPlan();
    super.onInit();
  }

  void clear() {
    newTrainingController.clear();
    amountController.clear();
    durationController.clear();
    Get.back();
  }

  void setData({
    required String traingName,
    required dynamic planAmount,
    required dynamic duration,
  }) {
    newTrainingController.text = traingName;
    amountController.text = planAmount;
    durationController.text = duration.toString();
  }

  void getPlan() async {
    isdataLoading.value = true;
    try {
      var res = await planRepo.getPlan();
      if (res.status == success) {
        planName.value = res.memberAllPlanData ?? [];
      } else if (res.status == failed) {
        Constant.showSnackBar(
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      } else {
        Constant.showSnackBar(
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isdataLoading.value = false;
    }
  }

  void addPlan(BuildContext context) async {
    isAddLoading.value = true;
    Map<String, dynamic> body = {
      "name": newTrainingController.text.trim(),
      "price": amountController.text.trim(),
      "duration_months": durationController.text.trim(),
    };
    try {
      var res = await planRepo.addNewPlan(body);
      if (res.status == success) {
        Constant.showSnackBar(
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getPlan();
      } else if (res.status == failed) {
        Constant.showSnackBar(
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      } else {
        Constant.showSnackBar(
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isAddLoading.value = false;
    }
  }

  void updatePlan({required BuildContext context, required String id}) async {
    isUpdateLoading.value = true;
    Map<String, dynamic> body = {
      "name": newTrainingController.text.trim(),
      "id": id,
      "price": amountController.text.trim(),
      "duration_months": durationController.text.trim(),
    };
    try {
      var res = await planRepo.updatePlan(body);
      Constant.customPrintLog(res);
      if (res.status == success) {
        Constant.showSnackBar(
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getPlan();
      } else if (res.status == failed) {
        Constant.showSnackBar(
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      } else {
        Constant.showSnackBar(
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isUpdateLoading.value = false;
    }
  }

  void deletePlan({required BuildContext context, required String id}) async {
    isDeleteLoading.value = true;
    Map<String, dynamic> body = {"id": id};
    try {
      var res = await planRepo.deletePlan(body);
      if (res.status == success) {
        Constant.showSnackBar(
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        getPlan();
      } else if (res.status == failed) {
        Constant.showSnackBar(
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      } else {
        Constant.showSnackBar(
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
    amountController.dispose();
    super.dispose();
  }
}
