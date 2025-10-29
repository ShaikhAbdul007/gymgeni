import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/utils/constant.dart';
import 'package:gymgeni/utils/errorstrings.dart';
import '../../../../repository/member_master_trainingtype_repo.dart';
import '../../model/member_master_model.dart';

class TrainingTypeViewmodel extends GetxController {
  final memberTraingTypeRepo = TraingTypeRepo();
  TextEditingController newTrainingController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  RxBool isLoading = false.obs;
  List<String> columnName = ['Trainig Mode', 'Action'];
  final List<MemberMasterModel> trainingModes = [
    MemberMasterModel(group: 'Normal Training', value: false),
    MemberMasterModel(group: 'Cardio Only', value: false),
    MemberMasterModel(group: 'Strength Only', value: false),
    MemberMasterModel(group: 'Zumba', value: false),
    MemberMasterModel(group: 'CrossFit', value: false),
    MemberMasterModel(
      group: 'HIIT (High-Intensity Interval Training)',
      value: false,
    ),
    MemberMasterModel(group: 'Yoga', value: false),
    MemberMasterModel(group: 'Pilates', value: false),
    MemberMasterModel(group: 'Functional Training', value: false),
    MemberMasterModel(group: 'Mixed Training', value: false),
  ];
  addTrainingType(BuildContext context) async {
    isLoading.value = true;
    Map<String, dynamic> body = {"name": newTrainingController.text.trim()};
    try {
      var res = await memberTraingTypeRepo.addNewTraingTypeMode(body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        clear();
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
      isLoading.value = false;
    }
  }

  getTraingMode() {}

  clear() {
    newTrainingController.clear();
    Get.back();
  }

  @override
  void dispose() {
    newTrainingController.dispose();
    super.dispose();
  }
}
