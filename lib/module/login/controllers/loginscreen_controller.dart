import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/cachemanager/cache_manager.dart';
import 'package:gymgeni/repository/login_repo.dart';
import 'package:gymgeni/routes/routes_path.dart';
import 'package:gymgeni/utils/errorstrings.dart';
import '../../../../utils/constant.dart';

class LoginViewModel extends GetxController with CacheManager {
  final loginRepo = LoginRepo();
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
    isLoading.value = true;
    Map<String, dynamic> body = {
      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
    };
    try {
      var res = await loginRepo.login(body);
      if (res.success == success) {
        saveToken(res.loginData?.token ?? '');
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: true,
        );
        Future.delayed(Duration(seconds: 1), () {
          RoutesPaths.navigateToRoute(routeName: RoutesPaths.dashboardView);
          isLoading.value = false;
        });
      } else if (res.success == failed) {
        isLoading.value = false;
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      } else {
        isLoading.value = false;
        Constant.showSnackBar(
          context: context,
          errorMessage: res.message ?? '',
          errorStatus: false,
        );
      }
    } finally {}
  }
}
