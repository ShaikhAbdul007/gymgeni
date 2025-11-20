import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/lead_source_model.dart';

class LeadSourceViewModel extends GetxController {
  RxBool isdataLoading = false.obs;
  RxBool isAddLoading = false.obs;
  RxBool isDeleteLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  TextEditingController newLeadSourceController = TextEditingController();
  RxList<LeadSourceData> followUpName = <LeadSourceData>[].obs;
  List<String> columnName = ['Group Name', 'Action'];

  clear() {
    Get.back();
    newLeadSourceController.clear();
  }
}
