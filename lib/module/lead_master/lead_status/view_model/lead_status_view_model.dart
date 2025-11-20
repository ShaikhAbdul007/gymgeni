import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/lead_status_model.dart';

class LeadStatusViewModel extends GetxController {
  RxBool isdataLoading = false.obs;
  RxBool isAddLoading = false.obs;
  RxBool isDeleteLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  TextEditingController newLeadSourceController = TextEditingController();
  RxList<LeadStatusData> followUpName = <LeadStatusData>[].obs;
  List<String> columnName = ['Group Name', 'Action'];

  clear() {
    Get.back();
    newLeadSourceController.clear();
  }
}
