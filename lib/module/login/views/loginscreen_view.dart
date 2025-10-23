import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/helper/textfield.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/responsive_layout.dart';
import 'package:gymgeni/utils/divider.dart';
import '../../../helper/svg_assetes.dart';
import '../../../utils/colors.dart';
import '../controllers/loginscreen_controller.dart';
import 'package:gymgeni/routes/routes_path.dart';
import 'package:gymgeni/utils/text_style.dart';
import '../../../../utils/sizebox.dart';

import '../../../utils/constant.dart';
import '../widgets/login_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktop: DeskTop(),
      mobile: Mobile(),
      tablet: Tablet(),
    );
  }
}

class DeskTop extends GetView<LoginViewModel> {
  const DeskTop({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 70),
              height: 500,
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Get Started', style: customPoppin(fontSize: 20)),
                  setHeight(height: 5),
                  Text(
                    "Welcome to Gym Geni - Let's Login Your Account",
                    style: customPoppin(fontSize: 15),
                  ),
                  setHeight(height: 10),
                  customDivider(
                    color: AppColors.darkBackground,
                    isParameterGiven: true,
                    indent: 5,
                  ),
                  setHeight(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Email ',
                      style: customNunito(
                        fontSize: 14,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: '*',
                          style: customNunito(fontSize: 15, color: Colors.red),
                        ),
                      ],
                    ),
                  ),

                  setHeight(height: 2),
                  CustomTextField(
                    hintText: 'Email',
                    controller: controller.emailController,
                    suffixIcon: Icon(Icons.email),
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Please enter email';
                      } else if (!email.contains('@')) {
                        return 'Please enter valid email eg "youremail@gmail.com"';
                      }
                      return null;
                    },
                  ),
                  setHeight(height: 15),
                  Text(
                    'Password',
                    style: customPoppin(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  setHeight(height: 2),
                  Obx(
                    () => CustomTextField(
                      hintText: 'Password',
                      obscureText: controller.isPasswordVisible.value,
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Please enter password';
                        } else if (password.length <= 6) {
                          return 'Password should be atleast 6 charachter';
                        }
                        return null;
                      },
                      controller: controller.passwordController,
                      suffixIcon: IconButton(
                        onPressed: () => controller.showPassword(),
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ),
                  // Obx(
                  //   () => CheckboxListTile(
                  //     contentPadding: EdgeInsets.all(0),
                  //     activeColor: Colors.black,
                  //     controlAffinity: ListTileControlAffinity.leading,
                  //     value: controller.isKeepMeLoggedInSelect.value,
                  //     onChanged:
                  //         (value) =>
                  //             controller.isKeepMeLoggedInSelect(value ?? false),
                  //     title: Text(
                  //       'keep me logged in',
                  //       style: customNunito(fontSize: 16),
                  //     ),
                  //   ),
                  // ),
                  Obx(
                    () => CheckboxListTile(
                      contentPadding: EdgeInsets.all(0),
                      activeColor: Colors.black,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: controller.isTermAndConditionSelect.value,
                      onChanged:
                          (value) => controller.isTermAndConditionSelected(
                            value ?? false,
                          ),
                      title: RichText(
                        text: TextSpan(
                          text: 'I agree to ',
                          style: customNunito(
                            fontSize: 15,
                            color: AppColors.greyLightColor,
                          ),
                          children: [
                            TextSpan(
                              text: 'Term & Condition',
                              style: customNunito(
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => LoginButton(
                      isLoading: controller.isLoading.value,
                      onPress: () async {
                        if (!controller.isTermAndConditionSelect.value) {
                          Constant.showCustomLAlert(
                            context: context,
                            errorMessage: 'Select term and condtion',
                          );
                        } else {
                          await controller.login(context);
                        }
                      },
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        RoutesPaths.navigateToRoute(
                          routeName: RoutesPaths.signUpView,
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Do not have account ?',
                          style: customNunito(
                            fontSize: 15,
                            color: AppColors.greyLightColor,
                          ),
                          children: [
                            TextSpan(
                              text: ' Create account',
                              style: customMontserrat(
                                fontSize: 16,
                                color: AppColors.blueColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 70),
              height: 500,
              width: 500,
              child: CustomImageAssets(
                svgAssets: 'assets/login1.png',
                height: 500,
                width: 500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Mobile extends GetView<LoginViewModel> {
  const Mobile({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}

class Tablet extends StatelessWidget {
  const Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
