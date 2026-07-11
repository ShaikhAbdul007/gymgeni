import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/helper/date_formatter.dart';
import 'package:gymgeni/repository/finance_payment_method_repo.dart';
import 'package:gymgeni/repository/member_master_goal_repo.dart';
import 'package:gymgeni/repository/member_master_group_repo.dart';
import 'package:gymgeni/repository/member_master_plan_repo.dart';
import 'package:gymgeni/repository/member_master_trainingtype_repo.dart';
import 'package:gymgeni/repository/member_repo.dart';
import 'package:gymgeni/repository/source_repo.dart';
import 'package:gymgeni/utils/errorstrings.dart';
import 'package:web/web.dart' as webk;
import '../../../repository/member_master_trainingmode_repo.dart';
import '../../../utils/constant.dart';
import '../../../utils/keys.dart';
import 'package:gymgeni/repository/member_attendance_repo.dart';
import 'package:gymgeni/cachemanager/cache_manager.dart';
import '../../../utils/sizebox.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_style.dart';
import '../model/member_attandence_model.dart';
import '../../finance_master/finance_payment_method/model/all_payment_method_model.dart';
import '../../lead_master/lead_source/model/lead_source_model.dart';
import '../../member_master/member_goal/model/member_allgoal_model.dart';
import '../../member_master/member_group/model/member_allgroup_model.dart';
import '../../member_master/member_plan/model/member_allplan_model.dart';
import '../../member_master/member_trainingtype/model/member_alltrainingtype_model.dart';
import '../../member_master/member_triaingmode/model/member_alltraining_model.dart';
import '../model/members_model.dart';

class MemberViewModel extends GetxController
    with GetSingleTickerProviderStateMixin, CacheManager {
  final goalRepo = GoalRepo();
  final planRepo = PlanRepo();
  final group = GroupRepo();
  final traingTypeRepo = TraingTypeRepo();
  final traingModeRepo = TraingModeRepo();
  final memberRepo = MemberRepo();
  final sources = SourceRepo();
  final paymentMode = FinancePaymentMethodRepo();
  final memberAttendanceRepo = MemberAttendanceRepo();
  RxList<MemberAttendanceData> memberAttendanceList =
      <MemberAttendanceData>[].obs;
  RxBool isMemberAttendanceLoading = false.obs;
  List<String> attendanceColumns = [
    'Member Name',
    'Clock In',
    'Clock Out',
    'Group',
    'Action',
  ];
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController afterdiscountAmount = TextEditingController();
  TextEditingController amountpaid = TextEditingController();
  TextEditingController balanceAmount = TextEditingController();
  TextEditingController pendingDate = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController goalListController = TextEditingController();
  TextEditingController planListController = TextEditingController();
  TextEditingController trainingModeListController = TextEditingController();
  TextEditingController trainingTypeListController = TextEditingController();
  TextEditingController healthCondition = TextEditingController();
  TextEditingController joiningDate = TextEditingController();
  TextEditingController search = TextEditingController();
  TextEditingController source = TextEditingController();
  TextEditingController alternateNumber = TextEditingController();
  TextEditingController paymentModeListController = TextEditingController();
  TextEditingController groupListController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController chestController = TextEditingController();
  TextEditingController hipsController = TextEditingController();
  TextEditingController stomachController = TextEditingController();
  TextEditingController thighController = TextEditingController();
  TextEditingController bodyAgeController = TextEditingController();
  TextEditingController breakfastController = TextEditingController();
  TextEditingController lunchController = TextEditingController();
  TextEditingController dinnerController = TextEditingController();
  TextEditingController pushUpStrengthController = TextEditingController();
  TextEditingController curlUpController = TextEditingController();
  TextEditingController mobilityController = TextEditingController();
  TextEditingController heartRateController = TextEditingController();
  TextEditingController heartRateTreadmillController = TextEditingController();
  TextEditingController sitReachController = TextEditingController();
  final List<String> genderList = ['Male', 'Female', 'Other'];
  RxList<MemberAllPlanData> planList = <MemberAllPlanData>[].obs;
  RxList<MemberAllGoalData> goalList = <MemberAllGoalData>[].obs;
  RxList<MemberAllTrainingTypeData> trainingTypeList =
      <MemberAllTrainingTypeData>[].obs;
  RxList<MemberAllTrainingData> trainingModeList =
      <MemberAllTrainingData>[].obs;
  RxList<Members> getMember = <Members>[].obs;
  RxList<LeadSourceData> sourceList = <LeadSourceData>[].obs;
  RxList<AllPaymentData> paymentList = <AllPaymentData>[].obs;
  RxList<MemberAllGroupData> groupList = <MemberAllGroupData>[].obs;
  final RxBool isMembersLoading = false.obs;
  final RxBool isDeleteMembersLoading = false.obs;
  final RxBool isDropDownLoading = false.obs;
  final RxBool isBMRClick = false.obs;
  final RxBool isCreateMembersLoading = false.obs;
  final RxBool isActionLoading = false.obs;
  Rx<Uint8List?> selectedImage = Rx<Uint8List?>(null);
  RxString fileName = ''.obs;
  RxBool isEditMode = false.obs;
  RxString selectedMemberId = ''.obs;
  RxString selectedMemberStatus = 'All'.obs;

  //Rx<CameraController?> cam = Rx<CameraController?>(null);
  RxBool isInitialized = false.obs;
  Rx<Uint8List?> capturedImage = Rx<Uint8List?>(null);

  TabController? tabController;
  final List<String> columnNames = [
    'Member',
    'Plan',
    'Amount',
    'Balance',
    'Status',
    'Join Date',
    'Expire Date',
    'Action',
  ];
  List<Tab> tabs = [
    Tab(child: Text('All')),
    Tab(child: Text('Active')),
    Tab(child: Text('Inactive')),
    Tab(child: Text('Pending')),
    Tab(child: Text('Freezed')),
    Tab(child: Text('Attendence')),
    Tab(child: Text('Configuration')),
  ];

  @override
  void onInit() {
    checkAuthGuard();
    tabController = TabController(length: tabs.length, vsync: this);
    data();
    getPlanData();
    getGoalData();
    getSourceData();
    getTraingTypeData();
    getTraingModeData();
    getPaymentModeData();
    getGroupData();
    getMemberAttendanceData();
    super.onInit();
  }

  // Future<void> initCamera() async {
  //   final cameras = await availableCameras();

  //   final camera = cameras.first; // front/back jo bhi pehla mile

  //   cam.value = CameraController(
  //     camera,
  //     ResolutionPreset.medium,
  //     enableAudio: false,
  //   );

  //   await cam.value!.initialize();
  //   isInitialized.value = true;
  // }

  // Future<void> takePhoto() async {
  //   final file = await cam.value!.takePicture();

  //   capturedImage.value = await file.readAsBytes();
  // }

  @override
  void onClose() {
    // cam.value?.dispose();
    super.onClose();
  }

  Future<void> pickFromGallery() async {
    await _pickImage(captureFromCamera: false);
  }

  Future<void> pickFromCamera() async {
    await _pickImage(captureFromCamera: true);
  }

  Future<void> _pickImage({required bool captureFromCamera}) async {
    final input =
        webk.HTMLInputElement()
          ..type = 'file'
          ..accept = 'image/*';

    if (captureFromCamera) {
      input.capture = "environment"; // or "user"
    }

    input.click();

    final completer = Completer<Uint8List?>();

    input.onChange.listen((event) {
      final file = input.files?.item(0);

      if (file == null) {
        completer.complete(null);
        return;
      }

      fileName.value = file.name;

      final reader = webk.FileReader();
      reader.readAsArrayBuffer(file);

      reader.onLoadEnd.listen((event) {
        final buffer = reader.result as ByteBuffer?;

        if (buffer == null) {
          completer.complete(null);
          return;
        }

        completer.complete(buffer.asUint8List());
      });
    });
    Get.back();
    selectedImage.value = await completer.future;
  }

  data() {
    tabController!.addListener(() {
      if (tabController!.indexIsChanging) return;
      switch (tabController!.index) {
        case 0:
          getMemberData(memberStatus: 'All');
          break;
        case 1:
          getMemberData(memberStatus: 'Active');
          break;
        case 2:
          getMemberData(memberStatus: 'Inactive');
          break;
        case 3:
          getMemberData(memberStatus: 'Pending');
          break;
        case 4:
          getMemberData(memberStatus: 'Freezed');
          break;
      }
    });
    getMemberData(memberStatus: 'All');
  }

  void openDrawer() {
    memberScaffoldKey.currentState?.openEndDrawer();
  }

  void closeDrawer() {
    memberScaffoldKey.currentState?.closeEndDrawer();
  }

  void openCreateDrawer() {
    isEditMode.value = false;
    selectedMemberId.value = '';
    clearMemberForm();
    openDrawer();
  }

  void closeMemberDrawer() {
    closeDrawer();
    isBMRClick.value = false;
  }

  void clearMemberForm() {
    final allControllers = <TextEditingController>[
      firstname,
      lastname,
      age,
      address,
      email,
      amount,
      discount,
      afterdiscountAmount,
      amountpaid,
      balanceAmount,
      pendingDate,
      mobileNumber,
      genderController,
      goalListController,
      planListController,
      trainingModeListController,
      trainingTypeListController,
      healthCondition,
      joiningDate,
      search,
      source,
      alternateNumber,
      paymentModeListController,
      groupListController,
      weightController,
      heightController,
      professionController,
      chestController,
      hipsController,
      stomachController,
      thighController,
      bodyAgeController,
      breakfastController,
      lunchController,
      dinnerController,
      pushUpStrengthController,
      curlUpController,
      mobilityController,
      heartRateController,
      heartRateTreadmillController,
      sitReachController,
    ];
    for (final c in allControllers) {
      c.clear();
    }
    selectedImage.value = null;
    fileName.value = '';
  }

  void onEditMemberTap(Members member) {
    isEditMode.value = true;
    selectedMemberId.value = member.id ?? '';
    clearMemberForm();

    final fullName = (member.name ?? '').trim();
    final nameParts = fullName.split(RegExp(r'\s+'));
    firstname.text = nameParts.isNotEmpty ? nameParts.first : '';
    lastname.text = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

    mobileNumber.text = member.mobileNumber ?? '';
    email.text = member.email ?? '';
    address.text = member.address ?? '';
    amount.text = member.amount ?? '';
    amountpaid.text = member.amount ?? '';
    balanceAmount.text = member.balanceAmount ?? '';
    joiningDate.text = member.joiningDate ?? '';
    pendingDate.text = member.balanceDate ?? '';
    genderController.text = member.gender ?? '';
    healthCondition.text = '';

    // Keep IDs/text for API payload usage where available.
    planListController.text = member.planName ?? '';
    goalListController.text = member.goalName ?? '';
    source.text = member.sourceName ?? '';
    trainingModeListController.text = member.trainingModeName ?? '';
    trainingTypeListController.text = member.trainingTypeName ?? '';

    openDrawer();
  }

  void setPlanListAmount(value) {
    planListController.text = value;
    for (int i = 0; i < planList.length; i++) {
      if (value == planList[i].id) {
        amount.text = planList[i].price ?? '';
      }
    }
  }

  void discountValue() {
    final discountPercentage = int.tryParse(discount.text) ?? 0;
    Constant.customPrintLog('amount.text ${amount.text}');
    final totalPlanAmount = double.tryParse(amount.text) ?? 0;
    final discountValue = (totalPlanAmount * discountPercentage) / 100;
    final afterDiscountAmount = totalPlanAmount - discountValue;
    afterdiscountAmount.text = afterDiscountAmount.toStringAsFixed(0);
  }

  void getPlanData() async {
    isDropDownLoading.value = true;
    var res = await planRepo.getPlan();
    try {
      if (res.status == success) {
        planList.value = res.memberAllPlanData ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isDropDownLoading.value = false;
    }
  }

  void getGroupData() async {
    isDropDownLoading.value = true;
    var res = await group.getGroup();
    try {
      if (res.status == success) {
        groupList.value = res.memberAllGroupData ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isDropDownLoading.value = false;
    }
  }

  void getMemberAttendanceData() async {
    isMemberAttendanceLoading.value = true;
    try {
      var res = await memberAttendanceRepo.getMemberAttendance();
      if (res.status == true) {
        memberAttendanceList.value = res.data ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isMemberAttendanceLoading.value = false;
    }
  }

  void getPaymentModeData() async {
    isDropDownLoading.value = true;
    var res = await paymentMode.getFinancePaymentMethod();
    try {
      if (res.status == success) {
        paymentList.value = res.data ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isDropDownLoading.value = false;
    }
  }

  void getSourceData() async {
    isDropDownLoading.value = true;
    try {
      var res = await sources.getSource();
      if (res.status == success) {
        sourceList.value = res.data ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isDropDownLoading.value = false;
    }
  }

  void getGoalData() async {
    isDropDownLoading.value = true;
    try {
      var res = await goalRepo.getGoal();
      if (res.status == success) {
        goalList.value = res.memberAllGoalData ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isDropDownLoading.value = false;
    }
  }

  void getTraingTypeData() async {
    isDropDownLoading.value = true;
    try {
      var res = await traingTypeRepo.getTraingTypeMode();
      if (res.status == success) {
        trainingTypeList.value = res.memberAllTrainingTypeData ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isDropDownLoading.value = false;
    }
  }

  void getTraingModeData() async {
    isDropDownLoading.value = true;
    try {
      var res = await traingModeRepo.getTraingMode();
      if (res.status == success) {
        trainingModeList.value = res.memberAllTrainingData ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isDropDownLoading.value = false;
    }
  }

  void getMemberData({required String memberStatus}) async {
    selectedMemberStatus.value = memberStatus;
    isMembersLoading.value = true;
    try {
      var res = await memberRepo.getMemberData(memberStatus: memberStatus);
      if (res.status == success) {
        getMember.value = res.data?.members ?? [];
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isMembersLoading.value = false;
    }
  }

  void onDeleteMemberTap(Members member) {
    if ((member.id ?? '').isEmpty) {
      if (Get.context != null) {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: 'Member id not found',
          errorStatus: false,
        );
      }
      return;
    }
    deleteMember(memberId: member.id!);
  }

  void deleteMember({required String memberId}) async {
    if (Get.context == null) return;
    isDeleteMembersLoading.value = true;
    try {
      final body = {"id": memberId};
      var res = await memberRepo.deleteMemberData(body: body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        getMemberData(memberStatus: selectedMemberStatus.value);
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {
      isDeleteMembersLoading.value = false;
    }
  }

  Future<void> submitMemberForm(BuildContext context) async {
    isCreateMembersLoading.value = true;
    try {
      final name = "${firstname.text.trim()} ${lastname.text.trim()}".trim();
      final body = {
        "name": name,
        "gender": genderController.text.trim().toLowerCase(),
        "mobile_number": mobileNumber.text.trim(),
        "alternate_mobile": alternateNumber.text.trim(),
        "email": email.text.trim(),
        "age": age.text.trim(),
        "plan_id": planListController.text.trim(),
        "training_mode_id": trainingModeListController.text.trim(),
        "training_type_id": trainingTypeListController.text.trim(),
        "goal_id": goalListController.text.trim(),
        "source_id": source.text.trim(),
        "group_id": groupListController.text.trim(),
        "health_condition": healthCondition.text.trim(),
        "address": address.text.trim(),
        "joining_date": DateFormatter.convertDisplayToApi(joiningDate.text.trim()),
        "amount": amountpaid.text.trim(),
        "balance_date": DateFormatter.convertDisplayToApi(pendingDate.text.trim()),
        "payment_mode": paymentModeListController.text.trim(),
        "discount": discount.text.isEmpty ? '0' : discount.text.trim(),
      };

      final bmrMap = {
        "gender": genderController.text.trim().toLowerCase(),
        "age": int.tryParse(age.text.trim()) ?? 0,
        "weight": weightController.text.trim(),
        "height": int.tryParse(heightController.text.trim()) ?? 0,
        "heart_rate_rest": heartRateController.text.trim(),
        "heart_rate_treadmill": heartRateTreadmillController.text.trim(),
        "push_up": pushUpStrengthController.text.trim(),
        "curl_up": curlUpController.text.trim(),
        "mobility": mobilityController.text.trim(),
        "sit_reach": sitReachController.text.trim(),
        "profession": professionController.text.trim(),
        "aims": "",
        "chest": int.tryParse(chestController.text.trim()) ?? 0,
        "hips": int.tryParse(hipsController.text.trim()) ?? 0,
        "stomach": int.tryParse(stomachController.text.trim()) ?? 0,
        "thigh": int.tryParse(thighController.text.trim()) ?? 0,
        "body_age": int.tryParse(bodyAgeController.text.trim()) ?? 0,
      };
      if (isEditMode.value) {
        bmrMap["member_id"] = selectedMemberId.value;
      }
      body["bmr_data"] = jsonEncode(bmrMap);

      dynamic res;
      if (isEditMode.value) {
        body["id"] = selectedMemberId.value;
        res = await memberRepo.updateMemberData(
          body: body,
          fileField: selectedImage.value != null ? 'image' : null,
          fileBytes: selectedImage.value,
          fileName: fileName.value.isNotEmpty ? fileName.value : null,
        );
      } else {
        res = await memberRepo.createMemberData(
          body: body,
          fileField: selectedImage.value != null ? 'image' : null,
          fileBytes: selectedImage.value,
          fileName: fileName.value.isNotEmpty ? fileName.value : null,
        );
      }

      if (!context.mounted) return;

      if (res.status == success) {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        closeMemberDrawer();
        getMemberData(memberStatus: selectedMemberStatus.value);
      } else {
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } catch (e) {
      if (context.mounted) {
        Constant.showSnackBar(
          context: context,
          errorMessage: e.toString(),
          errorStatus: false,
        );
      }
    } finally {
      isCreateMembersLoading.value = false;
    }
  }

  void freezeMember({required String memberId}) async {
    if (Get.context == null) return;
    isActionLoading.value = true;
    try {
      final body = {"member_id": memberId};
      var res = await memberRepo.freezeMember(body: body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? 'Member frozen successfully',
          errorStatus: true,
        );
        getMemberData(memberStatus: selectedMemberStatus.value);
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } catch (e) {
      Constant.showSnackBar(
        context: Get.context!,
        errorMessage: e.toString(),
        errorStatus: false,
      );
    } finally {
      isActionLoading.value = false;
    }
  }

  void unfreezeMember({required String memberId}) async {
    if (Get.context == null) return;
    isActionLoading.value = true;
    try {
      final body = {"member_id": memberId};
      var res = await memberRepo.unFreezeMember(body: body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? 'Member unfrozen successfully',
          errorStatus: true,
        );
        getMemberData(memberStatus: selectedMemberStatus.value);
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } catch (e) {
      Constant.showSnackBar(
        context: Get.context!,
        errorMessage: e.toString(),
        errorStatus: false,
      );
    } finally {
      isActionLoading.value = false;
    }
  }

  void transferMember({
    required String fromMemberId,
    required String toMemberId,
  }) async {
    if (Get.context == null) return;
    isActionLoading.value = true;
    try {
      final body = {"from_member_id": fromMemberId, "to_member_id": toMemberId};
      var res = await memberRepo.transferMember(body: body);
      if (res.status == success) {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? 'Member transferred successfully',
          errorStatus: true,
        );
        getMemberData(memberStatus: selectedMemberStatus.value);
      } else {
        Constant.showSnackBar(
          context: Get.context!,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } catch (e) {
      Constant.showSnackBar(
        context: Get.context!,
        errorMessage: e.toString(),
        errorStatus: false,
      );
    } finally {
      isActionLoading.value = false;
    }
  }

  void showTransferDialog(Members fromMember) {
    if (Get.context == null) return;
    final otherMembers = getMember.where((m) => m.id != fromMember.id).toList();
    if (otherMembers.isEmpty) {
      Constant.showSnackBar(
        context: Get.context!,
        errorMessage: 'No other members found to transfer to.',
        errorStatus: false,
      );
      return;
    }

    String? selectedToMemberId = otherMembers.first.id;

    Constant.customShowDialog(
      context: Get.context!,
      content: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transfer Membership',
                style: customNunito(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              setHeight(height: 15),
              Text(
                'Transfer from: ${fromMember.name}',
                style: customNunito(fontSize: 14),
              ),
              setHeight(height: 15),
              Text(
                'Select target member:',
                style: customNunito(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              setHeight(height: 5),
              DropdownButtonFormField<String>(
                value: selectedToMemberId,
                items:
                    otherMembers.map((m) {
                      return DropdownMenuItem<String>(
                        value: m.id,
                        child: Text(m.name ?? ''),
                      );
                    }).toList(),
                onChanged: (val) {
                  setState(() {
                    selectedToMemberId = val;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                ),
              ),
              setHeight(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      'Cancel',
                      style: customNunito(color: Colors.red),
                    ),
                  ),
                  setWidth(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedToMemberId != null) {
                        Get.back();
                        transferMember(
                          fromMemberId: fromMember.id!,
                          toMemberId: selectedToMemberId!,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blackColor,
                    ),
                    child: Text(
                      'Transfer',
                      style: customNunito(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
