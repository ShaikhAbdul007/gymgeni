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

  clear() {
    newTrainingController.clear();
    amountController.clear();
    Get.back();
  }

  setData({required String traingName, required dynamic planAmount}) {
    newTrainingController.text = traingName;
    amountController.text = planAmount;
  }

  getPlan() async {
    isdataLoading.value = true;
    try {
      var res = await planRepo.getPlan();
      if (res.status == success) {
        planName.value = res.memberAllPlanData ?? [];
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

  addPlan(BuildContext context) async {
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
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getPlan();
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

  updatePlan({required BuildContext context, required String id}) async {
    isUpdateLoading.value = true;
    Map<String, dynamic> body = {
      "name": newTrainingController.text.trim(),
      "id": id,
    };
    try {
      var res = await planRepo.updatePlan(body);
      print(res);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getPlan();
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

  deletePlan({required BuildContext context, required String id}) async {
    isDeleteLoading.value = true;
    Map<String, dynamic> body = {"id": id};
    try {
      var res = await planRepo.deletePlan(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        getPlan();
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
    amountController.dispose();
    super.dispose();
  }
}
