import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constant.dart';

class LoginViewModel extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isLoading = false.obs;
  RxBool isTermAndConditionSelect = false.obs;
  RxBool isKeepMeLoggedInSelect = false.obs;

  showPassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  isTermAndConditionSelected(bool value) {
    isTermAndConditionSelect.value = value;
  }

  isKeepMeLoggedInSelectd(bool value) {
    isKeepMeLoggedInSelect.value = value;
  }

  login(BuildContext context) async {
    // isLoading.value = true;
    // await auth
    //     .signInWithEmailAndPassword(
    //         email: emailController.text.trim(),
    //         password: passwordController.text.trim())
    //     .then((login) {
    //   Routes.navigateToRoute(routeName: Routes.mainScreen);
    //   isLoading.value = false;
    // }).onError((error, stackTrace) {
    //   Constant.showCustomLAlert(
    //       errorMessage: error.toString(), context: context);
    //   isLoading.value = false;
    // });
  }
}
