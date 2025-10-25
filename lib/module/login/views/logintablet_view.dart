import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/helper/textfield.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/dimension.dart';
import 'package:gymgeni/utils/constant.dart';
import 'package:gymgeni/utils/divider.dart';
import 'package:gymgeni/utils/keys.dart';
import '../../../helper/svg_assetes.dart';
import '../../../utils/colors.dart';
import '../controllers/loginscreen_controller.dart';
import 'package:gymgeni/routes/routes_path.dart';
import 'package:gymgeni/utils/text_style.dart';
import '../../../../utils/sizebox.dart';
import '../widgets/login_button.dart';

class LoginTablet extends StatelessWidget {
  final LoginViewModel controller;
  const LoginTablet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double screenHeight = height(context);
    double screenWidth = width(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: loginKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 70),
                height: screenHeight / 1.5,
                width: screenWidth,
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
                            style: customNunito(
                              fontSize: 15,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    setHeight(height: 2),
                    CustomTextField(
                      hintText: 'Email',
                      controller: controller.emailController,
                      suffixIcon: const Icon(Icons.email),
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
                            return 'Password should be atleast 6 characters';
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
                    setHeight(height: 2),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password ?",
                        style: customMontserrat(
                          fontSize: 15,
                          color: AppColors.blueColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    setHeight(height: 10),
                    Obx(
                      () => LoginButton(
                        isLoading: controller.isLoading.value,
                        onPress: () async {
                          if (loginKey.currentState!.validate()) {
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
                            text: 'Do not have account?',
                            style: customNunito(
                              fontSize: 14,
                              color: AppColors.greyLightColor,
                            ),
                            children: [
                              TextSpan(
                                text: ' Create account',
                                style: customMontserrat(
                                  fontSize: 16,
                                  color: AppColors.blueColor,
                                  fontWeight: FontWeight.w700,
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
                margin: const EdgeInsets.symmetric(horizontal: 70),
                height: screenHeight / 1.5,
                width: screenWidth,
                child: CustomImageAssets(
                  svgAssets: 'assets/login1.png',
                  height: 500,
                  width: 500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

 // Obx(
                  //   () => CheckboxListTile(
                  //     contentPadding: EdgeInsets.zero,
                  //     activeColor: Colors.black,
                  //     controlAffinity: ListTileControlAffinity.leading,
                  //     value: controller.isTermAndConditionSelect.value,
                  //     onChanged:
                  //         (value) => controller.isTermAndConditionSelected(
                  //           value ?? false,
                  //         ),
                  //     title: RichText(
                  //       text: TextSpan(
                  //         text: 'I agree to ',
                  //         style: customNunito(
                  //           fontSize: 15,
                  //           color: AppColors.greyLightColor,
                  //         ),
                  //         children: [
                  //           TextSpan(
                  //             text: 'Term & Condition',
                  //             style: customNunito(
                  //               fontSize: 16,
                  //               color: Colors.red,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
