import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/repository/employee_attendance_repo.dart';
import 'package:gymgeni/repository/employee_repo.dart';

import '../../../repository/employee_master_employee_type_repo.dart';
import '../../../repository/member_master_group_repo.dart';
import '../../../utils/constant.dart';
import '../../../utils/errorstrings.dart';
import '../../../utils/keys.dart';
import '../../employee_master/employee_master_type/model/employee_type_model.dart';
import '../../member_master/member_group/model/member_allgroup_model.dart';
import '../model/all_employee_model.dart';
import '../model/employee_attendance_model.dart';

class EmployeeViewmodel extends GetxController
    with GetSingleTickerProviderStateMixin {
  final emmployeeRepo = EmployeeRepo();
  final employeeMasterEmployeeTypeRepo = EmployeeMasterEmployeeTypeRepo();
  final emmployeeAttendanceRepo = EmployeeAttendanceRepo();
  final groupRepo = GroupRepo();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController alternateContactNo = TextEditingController();
  TextEditingController joiningDate = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController search = TextEditingController();
  TextEditingController anniversaryDate = TextEditingController();
  RxList<bool> permissionSelected = <bool>[].obs;
  TabController? tabController;
  List<Tab> tabs = [
    Tab(child: Text('All')),
    Tab(child: Text('Attendance')),
    Tab(child: Text('Configuration')),
  ];
  List<String> employeeColumns = [
    'Name',
    'Gender',
    'Type',
    'Contact',
    'UserName',
    'Action',
  ];
  List<String> radioList = [
    'Name',
    'Gender',
    'Type',
    'Contact',
    'UserName',
    'Action',
    'Clock In',
    'Clock Out',
  ];
  List<String> employeeAttendanceColumns = [
    'Name',
    'Clock In',
    'Clock Out',
    'Group',
    'Action',
  ];
  List<String> genderList = ['Male', 'Female', 'Other'];
  RxList<Employees> employeeList = <Employees>[].obs;
  RxList<EmployeeAttendanceData> employeeAttendanceList =
      <EmployeeAttendanceData>[].obs;
  RxBool isEmployeeLoading = false.obs;
  RxBool isdataLoading = false.obs;
  RxBool isEmployeeAttendanceLoading = false.obs;
  RxList<EmployeeTypeData> employeeTypeeName = <EmployeeTypeData>[].obs;
  RxList<MemberAllGroupData> groupName = <MemberAllGroupData>[].obs;

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    permissionSelected.value = List.generate(
      radioList.length,
      (index) => false,
    );
    getEmployeeTypeData();
    getGroupName();
    getEmpolyeeData();
    super.onInit();
  }

  void openDrawer() {
    employeeScaffoldKey.currentState?.openEndDrawer();
  }

  bool isPermissionSelected(int index) {
    return permissionSelected[index];
  }

  void updatePermission(int index, bool value) {
    permissionSelected[index] = value;
  }

  void getEmployeeTypeData() async {
    isdataLoading.value = true;
    try {
      var res = await employeeMasterEmployeeTypeRepo.getEmployeeType();
      if (res.status == success) {
        employeeTypeeName.value = res.employeeTypeData ?? [];
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

  void getGroupName() async {
    isdataLoading.value = true;
    try {
      var res = await groupRepo.getGroup();
      if (res.status == success) {
        groupName.value = res.memberAllGroupData ?? [];
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

  void getEmpolyeeData() async {
    isEmployeeLoading.value = true;
    try {
      var res = await emmployeeRepo.getEmployee();
      if (res.status == success) {
        employeeList.value = res.data?.employees ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isEmployeeLoading.value = false;
    }
  }

  void getEmpolyeeAttendanceData() async {
    isEmployeeAttendanceLoading.value = true;
    try {
      var res = await emmployeeAttendanceRepo.getEmployeeAttendance();
      if (res.status == success) {
        employeeAttendanceList.value = res.data ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isEmployeeAttendanceLoading.value = false;
    }
  }
}
