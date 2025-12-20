import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/cachemanager/cache_manager.dart';
import 'package:gymgeni/repository/signup_repo.dart';
import 'package:gymgeni/routes/routes_path.dart';
import 'package:gymgeni/utils/constant.dart';
import 'package:gymgeni/utils/errorstrings.dart';
import 'package:image_picker/image_picker.dart';

class SignupViewModel extends GetxController with CacheManager {
  final signupReo = SignupRepo();
  TextEditingController emailController = TextEditingController();
  TextEditingController confrimpasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController gymNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController gymImageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isSignUpLoading = false.obs;
  RxBool isTermAndConditionSelect = false.obs;
  final ImagePicker imagePicker = ImagePicker();
  Rx<Uint8List> webImage = Uint8List(0).obs;
  XFile? resImage;

  Rx<File>? imageFilePath;

  showPassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  isTermAndConditionSelected(bool value) {
    isTermAndConditionSelect.value = value;
  }

  pickImageFormGallery() async {
    resImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (resImage != null) {
      if (kIsWeb) {
        final Uint8List image = await resImage!.readAsBytes();
        webImage.value = image;

        if (webImage.value.isNotEmpty) {
          gymImageController.text = 'image Selected';
        }
      } else {
        var imageFile = File(resImage!.path);
        imageFilePath!.value = imageFile;
      }
    }
  }

  void clearImage() {
    webImage.value = Uint8List(0);
    gymImageController.clear();
  }

  signUp(BuildContext context) async {
    isSignUpLoading.value = true;
    Map<String, String> body = {
      'user_name': userNameController.text.trim(),
      'gym_name': gymNameController.text.trim(),
      'phone_number': phoneNoController.text.trim(),
      'email': emailController.text.trim(),
      'role': roleController.text.trim(),
      'address':
          '${addressController.text.trim()}${pincodeController.text.trim()}',
      'location': stateController.text.trim(),
      'password': confrimpasswordController.text.trim(),
    };
    try {
      var response = await signupReo.signUpFun(
        body: body,
        fileBytes: webImage.value,
        fileField: 'gym_image',
        fileName: resImage?.name ?? '',
      );
      if (response.status == success) {
        Constant.showSnackBar(
          context: context,

          errorMessage: response.message ?? '',
          errorStatus: true,
        );
        Future.delayed(Duration(seconds: 1), () {
          RoutesPaths.navigateToRoute(routeName: RoutesPaths.loginView);
        });
        isSignUpLoading.value = false;
      } else if (response.status == failed) {
        isSignUpLoading.value = false;
        Constant.showSnackBar(
          context: context,

          errorMessage: response.message ?? '',
          errorStatus: false,
        );
      } else {
        isSignUpLoading.value = false;
        Constant.showSnackBar(
          context: context,

          errorMessage: response.message ?? '',
          errorStatus: false,
        );
      }
    } finally {}
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    confrimpasswordController.dispose();
    emailController.dispose();
    pincodeController.dispose();
    stateController.dispose();
    phoneNoController.dispose();
    roleController.dispose();
    gymNameController.dispose();
    gymImageController.dispose();
    addressController.dispose();
    super.dispose();
  }
}
