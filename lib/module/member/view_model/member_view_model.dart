import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/repository/finance_payment_method_repo.dart';
import 'package:gymgeni/repository/member_master_goal_repo.dart';
import 'package:gymgeni/repository/member_master_group_repo.dart';
import 'package:gymgeni/repository/member_master_plan_repo.dart';
import 'package:gymgeni/repository/member_master_trainingtype_repo.dart';
import 'package:gymgeni/repository/member_repo.dart';
import 'package:gymgeni/repository/source_repo.dart';
import 'package:gymgeni/utils/errorstrings.dart';
import 'package:image_picker/image_picker.dart';
import '../../../repository/member_master_trainingmode_repo.dart';
import '../../../utils/constant.dart';
import '../../../utils/keys.dart';
import '../../finance_master/finance_payment_method/model/all_payment_method_model.dart';
import '../../lead_master/lead_source/model/lead_source_model.dart';
import '../../member_master/member_goal/model/member_allgoal_model.dart';
import '../../member_master/member_group/model/member_allgroup_model.dart';
import '../../member_master/member_plan/model/member_allplan_model.dart';
import '../../member_master/member_trainingtype/model/member_alltrainingtype_model.dart';
import '../../member_master/member_triaingmode/model/member_alltraining_model.dart';
import '../model/members_model.dart';

class MemberViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  final goalRepo = GoalRepo();
  final planRepo = PlanRepo();
  final group = GroupRepo();
  final trainingTypeRepo = TrainingTypeRepo();
  final trainingModeRepo = TraingModeRepo();
  final memberRepo = MemberRepo();
  final sources = SourceRepo();
  final paymentMode = FinancePaymentMethodRepo();
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
  final RxBool isDropDownLoading = false.obs;
  final RxBool isBMRClick = false.obs;
  final RxBool isCreateMembersLoading = false.obs;
  final RxBool isEditMode = false.obs;
  Rx<Uint8List?> selectedImage = Rx<Uint8List?>(null);
  Rxn<Members> editingMember = Rxn<Members>();
  RxnString selectedGender = RxnString();
  RxnString selectedPlanId = RxnString();
  RxnString selectedGoalId = RxnString();
  RxnString selectedTrainingModeId = RxnString();
  RxnString selectedTrainingTypeId = RxnString();
  RxnString selectedSourceId = RxnString();
  RxnString selectedPaymentModeId = RxnString();
  RxnString selectedGroupId = RxnString();
  RxString fileName = ''.obs;
  final ImagePicker imagePicker = ImagePicker();
  XFile? pickedImageFile;

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
    tabController = TabController(length: tabs.length, vsync: this);
    data();
    getPlanData();
    getGoalData();
    getSourceData();
    getTrainingTypeData();
    getTrainingModeData();
    getPaymentModeData();
    getGroupData();
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
    pickedImageFile = await imagePicker.pickImage(
      source: captureFromCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (pickedImageFile == null) {
      return;
    }

    fileName.value = pickedImageFile!.name;
    final bytes = await pickedImageFile!.readAsBytes();
    selectedImage.value = bytes;

    if (Get.isDialogOpen ?? false) {
      Get.back();
    }

    if (!kIsWeb) {
      Constant.customPrintLog('Selected image path: ${pickedImageFile!.path}');
    }
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

  void startCreateMember() {
    isEditMode.value = false;
    editingMember.value = null;
    resetMemberForm();
    openDrawer();
  }

  void startEditMember(Members member) {
    resetMemberForm();
    isEditMode.value = true;
    editingMember.value = member;
    _populateMemberForm(member);
    openDrawer();
  }

  void resetMemberForm() {
    firstname.clear();
    lastname.clear();
    age.clear();
    address.clear();
    email.clear();
    amount.clear();
    discount.clear();
    afterdiscountAmount.clear();
    amountpaid.clear();
    balanceAmount.clear();
    pendingDate.clear();
    mobileNumber.clear();
    genderController.clear();
    goalListController.clear();
    planListController.clear();
    trainingModeListController.clear();
    trainingTypeListController.clear();
    healthCondition.clear();
    joiningDate.clear();
    source.clear();
    alternateNumber.clear();
    paymentModeListController.clear();
    groupListController.clear();
    weightController.clear();
    heightController.clear();
    professionController.clear();
    chestController.clear();
    hipsController.clear();
    stomachController.clear();
    thighController.clear();
    bodyAgeController.clear();
    breakfastController.clear();
    lunchController.clear();
    dinnerController.clear();
    pushUpStrengthController.clear();
    curlUpController.clear();
    mobilityController.clear();
    heartRateController.clear();
    heartRateTreadmillController.clear();
    sitReachController.clear();
    selectedImage.value = null;
    fileName.value = '';
    isBMRClick.value = false;
    selectedGender.value = null;
    selectedPlanId.value = null;
    selectedGoalId.value = null;
    selectedTrainingModeId.value = null;
    selectedTrainingTypeId.value = null;
    selectedSourceId.value = null;
    selectedPaymentModeId.value = null;
    selectedGroupId.value = null;
  }

  void _populateMemberForm(Members member) {
    final fullName = (member.name ?? '').trim();
    final nameParts =
        fullName.isEmpty ? <String>[] : fullName.split(RegExp(r'\s+'));

    firstname.text = nameParts.isNotEmpty ? nameParts.first : '';
    lastname.text =
        nameParts.length > 1 ? nameParts.skip(1).join(' ') : '';
    email.text = member.email ?? '';
    mobileNumber.text = member.mobileNumber ?? '';
    address.text = member.address ?? '';
    joiningDate.text = member.joiningDate ?? '';
    pendingDate.text = member.balanceDate ?? '';
    amount.text = member.amount ?? '';
    amountpaid.text = member.amount ?? '';
    balanceAmount.text = member.balanceAmount ?? '';
    final normalizedGender = _findMatchingString(
      items: genderList,
      targetValue: member.gender,
    );
    genderController.text = normalizedGender ?? '';
    selectedGender.value = normalizedGender;

    _setSelectedValueByName<MemberAllPlanData>(
      items: planList,
      targetName: member.planName,
      getId: (item) => item.id,
      getName: (item) => item.name,
      onSelected: (id) {
        selectedPlanId.value = id;
        planListController.text = id ?? '';
        if (id != null) {
          setPlanListAmount(id);
        }
      },
    );
    _setSelectedValueByName<MemberAllGoalData>(
      items: goalList,
      targetName: member.goalName,
      getId: (item) => item.id,
      getName: (item) => item.name,
      onSelected: (id) {
        selectedGoalId.value = id;
        goalListController.text = id ?? '';
      },
    );
    _setSelectedValueByName<MemberAllTrainingData>(
      items: trainingModeList,
      targetName: member.trainingModeName,
      getId: (item) => item.id,
      getName: (item) => item.name,
      onSelected: (id) {
        selectedTrainingModeId.value = id;
        trainingModeListController.text = id ?? '';
      },
    );
    _setSelectedValueByName<MemberAllTrainingTypeData>(
      items: trainingTypeList,
      targetName: member.trainingTypeName,
      getId: (item) => item.id,
      getName: (item) => item.name,
      onSelected: (id) {
        selectedTrainingTypeId.value = id;
        trainingTypeListController.text = id ?? '';
      },
    );
    _setSelectedValueByName<LeadSourceData>(
      items: sourceList,
      targetName: member.sourceName,
      getId: (item) => item.id,
      getName: (item) => item.name,
      onSelected: (id) {
        selectedSourceId.value = id;
        source.text = id ?? '';
      },
    );
  }

  String? _findMatchingString({
    required List<String> items,
    required String? targetValue,
  }) {
    final normalizedTarget = targetValue?.trim().toLowerCase();
    if (normalizedTarget == null || normalizedTarget.isEmpty) {
      return null;
    }

    for (final item in items) {
      if (item.trim().toLowerCase() == normalizedTarget) {
        return item;
      }
    }

    return null;
  }

  void _setSelectedValueByName<T>({
    required List<T> items,
    required String? targetName,
    required String? Function(T item) getId,
    required String? Function(T item) getName,
    required void Function(String? id) onSelected,
  }) {
    final normalizedTarget = targetName?.trim().toLowerCase();
    if (normalizedTarget == null || normalizedTarget.isEmpty) {
      onSelected(null);
      return;
    }

    T? selectedItem;
    for (final item in items) {
      final itemName = getName(item)?.trim().toLowerCase();
      if (itemName == normalizedTarget) {
        selectedItem = item;
        break;
      }
    }

    onSelected(selectedItem != null ? getId(selectedItem) : null);
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

  void getTrainingTypeData() async {
    isDropDownLoading.value = true;
    try {
      var res = await trainingTypeRepo.getTrainingTypeMode();
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

  void getTrainingModeData() async {
    isDropDownLoading.value = true;
    try {
      var res = await trainingModeRepo.getTrainingMode();
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

  void createMemberData({required String memberStatus}) async {
    isCreateMembersLoading.value = true;
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
      isCreateMembersLoading.value = false;
    }
  }
}
