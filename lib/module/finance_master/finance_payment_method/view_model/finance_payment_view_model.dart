import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/repository/finance_payment_method_repo.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/errorstrings.dart';
import '../model/all_payment_method_model.dart';

class FinanceMasterPaymentViewModel extends GetxController {
  final financePaymentMethodRepo = FinancePaymentMethodRepo();
  RxBool isdataLoading = false.obs;
  RxBool isAddLoading = false.obs;
  RxBool isDeleteLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  TextEditingController newPaymentTypeController = TextEditingController();
  TextEditingController searchEmpolyeeTypeController = TextEditingController();
  RxList<AllPaymentData> paymentList = <AllPaymentData>[].obs;

  List<String> columnName = ['Name', 'Action'];

  @override
  void onInit() {
    getFinancePaymentData();
    super.onInit();
  }

  void setData({required String employeeType}) {
    newPaymentTypeController.text = employeeType;
  }

  void getFinancePaymentData() async {
    isdataLoading.value = true;
    try {
      var res = await financePaymentMethodRepo.getFinancePaymentMethod();
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

  void addFinancePaymentData(BuildContext context) async {
    isAddLoading.value = true;
    Map<String, dynamic> body = {"name": newPaymentTypeController.text.trim()};
    try {
      var res = await financePaymentMethodRepo.addFinancePaymentMethod(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getFinancePaymentData();
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

  void updateFinancePaymentData({
    required BuildContext context,
    required String id,
  }) async {
    isUpdateLoading.value = true;
    Map<String, dynamic> body = {
      "name": newPaymentTypeController.text.trim(),
      "id": id,
    };
    try {
      var res = await financePaymentMethodRepo.updateFinancePaymentMethod(body);
      print(res);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getFinancePaymentData();
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

  void deleteFinancePaymentData({
    required BuildContext context,
    required String id,
  }) async {
    isDeleteLoading.value = true;
    Map<String, dynamic> body = {"id": id};
    try {
      var res = await financePaymentMethodRepo.deletFinancePaymentMethod(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        getFinancePaymentData();
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
    newPaymentTypeController.clear();
  }
}
