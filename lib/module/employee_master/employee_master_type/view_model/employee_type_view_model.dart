import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/repository/employee_master_employee_type_repo.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/errorstrings.dart';
import '../model/employee_type_model.dart';

class EmployeeTypeViewModel extends GetxController {
  final employeeTypeRepo = EmployeeMasterEmployeeTypeRepo();
  RxBool isdataLoading = false.obs;
  RxBool isAddLoading = false.obs;
  RxBool isDeleteLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  TextEditingController newEmpolyeeTypeController = TextEditingController();
  TextEditingController searchEmpolyeeTypeController = TextEditingController();
  RxList<EmployeeTypeData> employeeTypeeName = <EmployeeTypeData>[].obs;
  RxList<EmployeeTypeData> originalList = <EmployeeTypeData>[].obs;
  List<String> columnName = ['Name', 'Action'];

  @override
  void onInit() {
    getEmployeeTypeData();
    super.onInit();
  }

  void searchEmployeeType(String query) {
    query = query.toLowerCase();

    if (query.isEmpty) {
      employeeTypeeName.value = originalList; // full reset
    } else {
      employeeTypeeName.value =
          originalList // <<< YAHAN FIX
              .where((e) => e.name!.toLowerCase().contains(query))
              .toList();
    }
  }

  void setData({required String employeeType}) {
    newEmpolyeeTypeController.text = employeeType;
  }

  void getEmployeeTypeData() async {
    isdataLoading.value = true;
    try {
      var res = await employeeTypeRepo.getEmployeeType();
      if (res.status == success) {
        employeeTypeeName.value = res.employeeTypeData ?? [];
        originalList.value = employeeTypeeName;
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

  void addEmployeeType(BuildContext context) async {
    isAddLoading.value = true;
    Map<String, dynamic> body = {"name": newEmpolyeeTypeController.text.trim()};
    try {
      var res = await employeeTypeRepo.addEmployeeType(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getEmployeeTypeData();
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

  void updateEmployeeType({
    required BuildContext context,
    required String id,
  }) async {
    isUpdateLoading.value = true;
    Map<String, dynamic> body = {
      "name": newEmpolyeeTypeController.text.trim(),
      "id": id,
    };
    try {
      var res = await employeeTypeRepo.updateEmployeeType(body);
      print(res);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getEmployeeTypeData();
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

  void deleteEmployeeType({
    required BuildContext context,
    required String id,
  }) async {
    isDeleteLoading.value = true;
    Map<String, dynamic> body = {"id": id};
    try {
      var res = await employeeTypeRepo.deletemployeeType(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        getEmployeeTypeData();
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
    newEmpolyeeTypeController.clear();
  }
}
