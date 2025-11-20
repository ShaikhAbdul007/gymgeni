import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/module/lead_master/lead_follow_type/model/lead_follow_type_model.dart';

class LeadFollowTypeViewModel extends GetxController {
  RxBool isdataLoading = false.obs;
  RxBool isAddLoading = false.obs;
  RxBool isDeleteLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  TextEditingController newLeadFollowTypeController = TextEditingController();
  RxList<LeadFollowUpTypeData> followUpName = <LeadFollowUpTypeData>[].obs;
  List<String> columnName = ['Group Name', 'Action'];

  clear() {
    Get.back();
    newLeadFollowTypeController.clear();
  }
}
