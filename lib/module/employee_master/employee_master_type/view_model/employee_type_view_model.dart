import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/employee_type_model.dart';

class EmployeeTypeViewModel extends GetxController {
  RxBool isdataLoading = false.obs;
  RxBool isAddLoading = false.obs;
  RxBool isDeleteLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  TextEditingController newLeadCategorieController = TextEditingController();
  RxList<EmployeeTypeData> categorieName = <EmployeeTypeData>[].obs;
  List<String> columnName = ['Group Name', 'Action'];

  clear() {
    Get.back();
    newLeadCategorieController.clear();
  }
}
