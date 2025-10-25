import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/responsive_layout.dart';
import '../controllers/loginscreen_controller.dart';
import 'logindesktop_view.dart';
import 'loginmobile_view.dart';
import 'logintablet_view.dart';

class LoginView extends GetView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktop: LoginDeskTop(controller: controller),
      mobile: LoginMobile(),
      tablet: LoginTablet(controller: controller),
    );
  }
}
