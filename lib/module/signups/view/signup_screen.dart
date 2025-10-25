import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/module/signups/view/signuptablet.dart';
import '../../responsive_layout/responsive_dimension/responsive_layout.dart';
import '../controller/signup_controller.dart';
import 'signupdesktop.dart';

class SignupView extends GetView<SignupViewModel> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktop: SignupDesktop(controller: controller),
      tablet: SignupTablet(controller: controller),
      mobile: MobileSignupView(),
    );
  }
}

class MobileSignupView extends StatelessWidget {
  const MobileSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
