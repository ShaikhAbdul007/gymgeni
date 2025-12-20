import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizebox.dart';
import '../../../../utils/text_style.dart';
import '../../../helper/svg_assetes.dart';
import '../../../routes/routes_path.dart';
import '../../../utils/constant.dart';
import '../../../utils/keys.dart';
import '../../responsive_layout/responsive_dimension/dimension.dart';
import '../controller/signup_controller.dart';
import '../widget/signup_button.dart';
import '../widget/gym_imageview_widget.dart';
import '../widget/signup_textfeild_with_label.dart';

class SignupDesktop extends StatelessWidget {
  final SignupViewModel controller;
  const SignupDesktop({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double h = screenHeight(context);
    double w = screenWidth(context);
    return Scaffold(
      body: Form(
        key: signUpKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: h,
              width: w / 2,
              child: CustomNetworkOrAssetImage(
                svgAssets: 'assets/signup.png',
                height: 500,
                width: 500,
              ),
            ),
            SizedBox(
              height: h,
              width: w / 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      setHeight(height: 15),
                      Text(
                        "Welcome to Gym Geni - Let's Create Your Account",
                        style: customPoppin(fontSize: 20),
                      ),
                      setHeight(height: 2),
                      Text(
                        'Take the first step towards seamless management!',
                        style: customPoppin(fontSize: 15),
                      ),
                      setHeight(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: SignupTextFeildWithLabel(
                              label: 'User Name',
                              tcontroller: controller.userNameController,
                              validator: (username) {
                                if (username == null || username.isEmpty) {
                                  return 'Please enter name';
                                }
                                return null;
                              },
                            ),
                          ),
                          setWidth(width: 10),
                          Flexible(
                            child: SignupTextFeildWithLabel(
                              label: 'Email',
                              tcontroller: controller.emailController,
                              validator: (email) {
                                if (email == null || email.isEmpty) {
                                  return 'Please enter email';
                                } else if (!email.contains('@')) {
                                  return 'Please enter valid email eg "youremail@gmail.com"';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      setHeight(height: 2),
                      Row(
                        children: [
                          Flexible(
                            child: SignupTextFeildWithLabel(
                              maxInputLength: 10,
                              label: 'Phone Number',
                              tcontroller: controller.phoneNoController,
                              filteringTextInputFormatterRequired: true,
                              keyboardType: TextInputType.phone,
                              validator: (number) {
                                if (number == null || number.isEmpty) {
                                  return 'Please enter phone number';
                                } else if (number.length < 10) {
                                  return 'Password should be atleast 10 digit';
                                }
                                return null;
                              },
                            ),
                          ),
                          setWidth(width: 10),
                          Flexible(
                            child: SignupTextFeildWithLabel(
                              label: 'Role',
                              tcontroller: controller.roleController,
                              validator: (role) {
                                if (role == null || role.isEmpty) {
                                  return 'Please enter role';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      setHeight(height: 2),
                      Row(
                        children: [
                          Flexible(
                            child: SignupTextFeildWithLabel(
                              label: 'Gym Name',
                              tcontroller: controller.gymNameController,
                              validator: (gynName) {
                                if (gynName == null || gynName.isEmpty) {
                                  return 'Please enter gym name';
                                }
                                return null;
                              },
                            ),
                          ),
                          setWidth(width: 10),
                          Flexible(
                            child: SignupTextFeildWithLabel(
                              readOnly: true,
                              isAsteriskdRequired: false,
                              label: 'Gym Image',
                              suffixIcon: Obx(
                                () => InkWell(
                                  onTap: () {
                                    controller.webImage.value.isEmpty
                                        ? controller.pickImageFormGallery()
                                        : Constant.customShowDialog(
                                          context: context,
                                          content: GymImageViewWidget(
                                            image: controller.webImage.value,
                                            okOnPress: () {
                                              Get.back();
                                            },
                                            clearOnPress: () {
                                              Get.back();
                                              controller.clearImage();
                                            },
                                          ),
                                        );
                                  },
                                  child:
                                      controller.webImage.value.isEmpty
                                          ? Icon(
                                            Icons.folder_copy_outlined,
                                            color: AppColors.blackColor,
                                          )
                                          : Icon(
                                            Icons.remove_red_eye,
                                            color: AppColors.blueColor,
                                          ),
                                ),
                              ),
                              tcontroller: controller.gymImageController,
                            ),
                          ),
                        ],
                      ),
                      setHeight(height: 2),
                      Row(
                        children: [
                          Flexible(
                            child: SignupTextFeildWithLabel(
                              label: 'Password',
                              obscureText: true,
                              tcontroller: controller.passwordController,
                              validator: (password) {
                                if (password == null || password.isEmpty) {
                                  return 'Please enter password';
                                } else if (password.length <= 6) {
                                  return 'Password should be atleast 6 charachter';
                                }
                                return null;
                              },
                            ),
                          ),
                          setWidth(width: 10),
                          Obx(
                            () => Flexible(
                              child: SignupTextFeildWithLabel(
                                label: 'Confirm Password',
                                tcontroller:
                                    controller.confrimpasswordController,
                                obscureText: controller.isPasswordVisible.value,
                                validator: (cPassword) {
                                  if (cPassword == null || cPassword.isEmpty) {
                                    return 'Please enter password';
                                  } else if (controller
                                          .passwordController
                                          .text !=
                                      cPassword) {
                                    return 'Confirm password is not matching with password';
                                  }
                                  return null;
                                },
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
                          ),
                        ],
                      ),
                      setHeight(height: 2),
                      SignupTextFeildWithLabel(
                        label: 'Address',
                        tcontroller: controller.addressController,
                        validator: (address) {
                          if (address == null || address.isEmpty) {
                            return 'Please enter address';
                          }
                          return null;
                        },
                      ),
                      setHeight(height: 2),
                      Row(
                        children: [
                          Flexible(
                            child: SignupTextFeildWithLabel(
                              label: 'State',
                              tcontroller: controller.stateController,
                              validator: (state) {
                                if (state == null || state.isEmpty) {
                                  return 'Please enter state';
                                }
                                return null;
                              },
                            ),
                          ),
                          setWidth(width: 10),
                          Flexible(
                            child: SignupTextFeildWithLabel(
                              label: 'Pincode',
                              maxInputLength: 6,
                              tcontroller: controller.pincodeController,
                              filteringTextInputFormatterRequired: true,
                              keyboardType: TextInputType.number,

                              validator: (pincode) {
                                if (pincode == null || pincode.isEmpty) {
                                  return 'Please enter pincode';
                                } else if (pincode.length != 6) {
                                  return 'Password should be atleast 6 charachter';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
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
                              style: customNato(
                                fontSize: 15,
                                color: AppColors.greyLightColor,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Term & Condition',
                                  style: customNato(
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
                        () => Center(
                          child: SignupButton(
                            isLoading: controller.isSignUpLoading.value,
                            onPress: () async {
                              if (signUpKey.currentState!.validate()) {
                                if (!controller
                                    .isTermAndConditionSelect
                                    .value) {
                                  Constant.showSnackBar(
                                    context: context,

                                    errorMessage: 'Select term and condtion',
                                    errorStatus: null,
                                  );
                                } else {
                                  await controller.signUp(context);
                                }
                              }
                            },
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          RoutesPaths.navigateToRoute(
                            routeName: RoutesPaths.loginView,
                          );
                        },
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have a account ?',
                              style: customNunito(
                                fontSize: 14,
                                color: AppColors.greyLightColor,
                              ),
                              children: [
                                TextSpan(
                                  text: ' Login',
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
                      // setHeight(height: 10),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text('Term of Use', style: styleRoboto(fontSize: 14)),
                      //     setWidth(width: 8),
                      //     CustomVerticalDivider(
                      //       height: 25,
                      //       width: 0.5,
                      //     ),
                      //     setWidth(width: 8),
                      //     Text('Privacy Policy', style: styleRoboto(fontSize: 14)),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
