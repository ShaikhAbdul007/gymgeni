import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../model/lead_categories_model.dart';

class LeadCategoriesViewModel extends GetxController {
  RxBool isdataLoading = false.obs;
  RxBool isAddLoading = false.obs;
  RxBool isDeleteLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  TextEditingController newLeadCategorieController = TextEditingController();
  RxList<LeadCategoryData> categorieName = <LeadCategoryData>[].obs;
  List<String> columnName = ['Group Name', 'Action'];

  clear() {
    Get.back();
    newLeadCategorieController.clear();
  }
}
