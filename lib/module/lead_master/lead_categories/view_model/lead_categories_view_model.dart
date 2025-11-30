import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../repository/lead_master_category_repo.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/errorstrings.dart';
import '../model/lead_categories_model.dart';

class LeadCategoriesViewModel extends GetxController {
  final leadMasterCategoryRepo = LeadMasterCategoryRepo();
  RxBool isdataLoading = false.obs;
  RxBool isAddLoading = false.obs;
  RxBool isDeleteLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  TextEditingController newLeadCategorieController = TextEditingController();
  RxList<LeadCategoryData> categorieName = <LeadCategoryData>[].obs;
  List<String> columnName = ['Name', 'Action'];

  @override
  void onInit() {
    getLeadCategories();
    super.onInit();
  }

  void setData({required String leadCategorie}) {
    newLeadCategorieController.text = leadCategorie;
  }

  void getLeadCategories() async {
    isdataLoading.value = true;
    try {
      var res = await leadMasterCategoryRepo.getLeadMasterCategory();
      if (res.status == success) {
        categorieName.value = res.data ?? [];
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

  void addLeadCategories(BuildContext context) async {
    isAddLoading.value = true;
    Map<String, dynamic> body = {
      "name": newLeadCategorieController.text.trim(),
    };
    try {
      var res = await leadMasterCategoryRepo.addLeadMasterCategory(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getLeadCategories();
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

  void updateLeadCategories({
    required BuildContext context,
    required String id,
  }) async {
    isUpdateLoading.value = true;
    Map<String, dynamic> body = {
      "name": newLeadCategorieController.text.trim(),
      "id": id,
    };
    try {
      var res = await leadMasterCategoryRepo.updateLeadMasterCategory(body);
      print(res);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getLeadCategories();
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

  void deleteLeadCategories({
    required BuildContext context,
    required String id,
  }) async {
    isDeleteLoading.value = true;
    Map<String, dynamic> body = {"id": id};
    try {
      var res = await leadMasterCategoryRepo.deletLeadMasterCategory(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        getLeadCategories();
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

  void clear() {
    Get.back();
    newLeadCategorieController.clear();
  }
}
