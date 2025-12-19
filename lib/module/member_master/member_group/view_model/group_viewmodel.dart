import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/repository/member_master_group_repo.dart';
import 'package:gymgeni/utils/constant.dart';
import 'package:gymgeni/utils/errorstrings.dart';
import '../model/member_allgroup_model.dart';

class GroupViewmodel extends GetxController {
  final groupRepo = GroupRepo();
  TextEditingController newTrainingController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  List<String> columnName = ['Name', 'Action'];
  RxBool isAddLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  RxBool isDeleteLoading = false.obs;
  RxBool isdataLoading = false.obs;
  RxList<MemberAllGroupData> groupName = <MemberAllGroupData>[].obs;

  @override
  void onInit() {
    getGroupName();
    super.onInit();
  }

  clear() {
    newTrainingController.clear();
    Get.back();
  }

  setData({required String traingName}) {
    newTrainingController.text = traingName;
  }

  void getGroupName() async {
    isdataLoading.value = true;
    try {
      var res = await groupRepo.getGroup();
      if (res.status == success) {
        groupName.value = res.memberAllGroupData ?? [];
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

  void addGroup(BuildContext context) async {
    isAddLoading.value = true;
    Map<String, dynamic> body = {"name": newTrainingController.text.trim()};
    try {
      var res = await groupRepo.addNewGroup(body);
      if (res.status == success) {
        Constant.showSnackBar(
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
        getGroupName();
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

  void updateGroup({required BuildContext context, required String id}) async {
    isUpdateLoading.value = true;
    Map<String, dynamic> body = {
      "name": newTrainingController.text.trim(),
      "id": id,
    };
    try {
      var res = await groupRepo.updateGroup(body);
      Constant.customPrintLog(res);
      if (res.status == success) {
        Constant.showSnackBar(
          errorMessage: res.message ?? '',
          errorStatus: true,
        );

        getGroupName();
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

  void deleteGroup({required BuildContext context, required String id}) async {
    isDeleteLoading.value = true;
    Map<String, dynamic> body = {"id": id};
    try {
      var res = await groupRepo.deleteGroup(body);
      if (res.status == success) {
        Constant.showSnackBar(
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        getGroupName();
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
    super.dispose();
  }
}
