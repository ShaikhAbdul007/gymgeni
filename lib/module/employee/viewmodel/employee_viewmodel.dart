import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/repository/employee_attendance_repo.dart';
import 'package:gymgeni/repository/employee_repo.dart';

import '../../../repository/employee_master_employee_type_repo.dart';
import '../../../repository/member_master_group_repo.dart';
import '../../../utils/constant.dart';
import '../../../utils/errorstrings.dart';
import '../../../utils/keys.dart';
import 'package:gymgeni/cachemanager/cache_manager.dart';
import '../../employee_master/employee_master_type/model/employee_type_model.dart';
import '../../member_master/member_group/model/member_allgroup_model.dart';
import '../model/all_employee_model.dart';
import '../model/employee_attendance_model.dart';
import '../../../helper/date_formatter.dart';

class EmployeeViewmodel extends GetxController
    with GetSingleTickerProviderStateMixin, CacheManager {
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
  TextEditingController genderController = TextEditingController();
  TextEditingController employeeTypeIdController = TextEditingController();
  TextEditingController groupIdController = TextEditingController();
  RxBool isEditMode = false.obs;
  RxString selectedEmployeeId = ''.obs;
  RxBool isCreateEmployeeLoading = false.obs;
  RxBool isDeleteEmployeeLoading = false.obs;
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
    checkAuthGuard();
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

  void onAddEmployeeTap() {
    isEditMode.value = false;
    selectedEmployeeId.value = '';
    clearEmployeeForm();
    openDrawer();
  }

  void onEditEmployeeTap(Employees employee) {
    isEditMode.value = true;
    selectedEmployeeId.value = employee.id ?? '';
    clearEmployeeForm();

    final fullName = (employee.name ?? '').trim();
    final nameParts = fullName.split(RegExp(r'\s+'));
    firstname.text = nameParts.isNotEmpty ? nameParts.first : '';
    lastname.text = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
    contactNo.text = employee.contactNo ?? '';
    genderController.text = employee.gender ?? '';
    email.text = employee.createdByEmail ?? '';
    address.text = employee.address ?? '';
    dob.text = employee.dateOfBirth ?? '';
    joiningDate.text = employee.joiningDate ?? '';
    anniversaryDate.text = employee.dateOfAnniversary ?? '';

    // Bind Type and Group IDs if matching found
    for (var type in employeeTypeeName) {
      if (type.name == employee.employeeTypeName) {
        employeeTypeIdController.text = type.id ?? '';
        break;
      }
    }
    // Set group ID
    groupIdController.text = '';

    openDrawer();
  }

  void clearEmployeeForm() {
    firstname.clear();
    lastname.clear();
    contactNo.clear();
    alternateContactNo.clear();
    email.clear();
    age.clear();
    salary.clear();
    dob.clear();
    joiningDate.clear();
    anniversaryDate.clear();
    address.clear();
    genderController.clear();
    employeeTypeIdController.clear();
    groupIdController.clear();
    permissionSelected.value = List.generate(
      radioList.length,
      (index) => false,
    );
  }

  void submitEmployee(BuildContext context) async {
    isCreateEmployeeLoading.value = true;
    try {
      final name = "${firstname.text.trim()} ${lastname.text.trim()}".trim();
      final username = email.text.trim().split('@').first;
      final body = {
        "name": name,
        "email": email.text.trim(),
        "gender": genderController.text.trim().toLowerCase(),
        "employee_type_id": employeeTypeIdController.text.trim(),
        "group_id": groupIdController.text.trim(),
        "contact_no": contactNo.text.trim(),
        "date_of_birth": DateFormatter.convertDisplayToApi(dob.text.trim()),
        "date_of_anniversary": DateFormatter.convertDisplayToApi(anniversaryDate.text.trim()),
        "joining_date": DateFormatter.convertDisplayToApi(joiningDate.text.trim()),
        "address": address.text.trim(),
      };
      if (!isEditMode.value) {
        body["username"] = username;
      }

      dynamic res;
      if (isEditMode.value) {
        body["id"] = selectedEmployeeId.value;
        res = await emmployeeRepo.updateEmployeeData(body: body);
      } else {
        res = await emmployeeRepo.signUpFun(body: body);
      }

      if (res.status == success) {
        Get.back();
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? 'Employee saved successfully',
          errorStatus: true,
        );
        getEmpolyeeData();
      } else {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } catch (e) {
      Constant.showSnackBar(
        context: context,
        errorMessage: e.toString(),
        errorStatus: false,
      );
    } finally {
      isCreateEmployeeLoading.value = false;
    }
  }

  void deleteEmployee(BuildContext context, String id) async {
    isDeleteEmployeeLoading.value = true;
    try {
      var res = await emmployeeRepo.deleteEmployeeData(id: id);
      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? 'Employee deleted successfully',
          errorStatus: true,
        );
        getEmpolyeeData();
      } else {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } catch (e) {
      Constant.showSnackBar(
        context: context,
        errorMessage: e.toString(),
        errorStatus: false,
      );
    } finally {
      isDeleteEmployeeLoading.value = false;
    }
  }
}
