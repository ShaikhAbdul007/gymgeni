// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../utils/colors.dart';
// import '../../../../utils/sizebox.dart';
// import '../../../../utils/text_style.dart';
// import 'signup_button.dart';

// class SignupBodyWidget extends StatelessWidget {
//   final SignupController controller;
//   const SignupBodyWidget({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 30),
//       child: ListView(
//         children: [
//           Text(
//             'Sign up to create your Account',
//             maxLines: 2,
//             style: stylePoppin(fontSize: 20),
//           ),
//           setHeight(height: 5),
//           Text(
//             'Take the first step towards seamless management! 🚀',
//             style: styleInter(fontSize: 15),
//           ),
//           setHeight(height: 30),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             child: Form(
//               key: signUpKey,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                         child: SignupTextFeildWithLabel(
//                           label: 'User Name',
//                           tcontroller: controller.userNameController,
//                           validator: (password) {
//                             if (password == null || password.isEmpty) {
//                               return 'Please enter user name';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       setWidth(width: 10),
//                       Flexible(
//                         child: SignupTextFeildWithLabel(
//                           label: 'Gym Name',
//                           tcontroller: controller.passwordController,
//                           validator: (password) {
//                             if (password == null || password.isEmpty) {
//                               return 'Please enter gym name';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                   setHeight(height: 8),
//                   Row(
//                     children: [
//                       Flexible(
//                         child: SignupTextFeildWithLabel(
//                           label: 'Phone Number',
//                           tcontroller: controller.phoneNoController,
//                           validator: (password) {
//                             if (password == null || password.isEmpty) {
//                               return 'Please enter phone number';
//                             } else if (password.length < 10) {
//                               return 'Password should be atleast 10 digit';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       setWidth(width: 10),
//                       Flexible(
//                         child: SignupTextFeildWithLabel(
//                           label: 'Email',
//                           tcontroller: controller.emailController,
//                           validator: (email) {
//                             if (email == null || email.isEmpty) {
//                               return 'Please enter email';
//                             } else if (!email.contains('@')) {
//                               return 'Please enter valid email eg "youremail@gmail.com"';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                   setHeight(height: 8),
//                   Row(
//                     children: [
//                       Flexible(
//                         child: SignupTextFeildWithLabel(
//                           label: 'Gym Image',
//                           suffixIcon: InkWell(
//                             onTap: () {
//                               controller.pickImageFormGallery();
//                             },
//                             child: Icon(
//                               Icons.folder_copy_outlined,
//                               color: AppColors.blackColor,
//                             ),
//                           ),
//                           tcontroller: controller.gymImageController,
//                         ),
//                       ),
//                       setWidth(width: 10),
//                       Flexible(
//                         child: SignupTextFeildWithLabel(
//                           label: 'Role',
//                           tcontroller: controller.roleController,
//                           validator: (email) {
//                             if (email == null || email.isEmpty) {
//                               return 'Please enter role';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                   setHeight(height: 8),
//                   Row(
//                     children: [
//                       Flexible(
//                         child: SignupTextFeildWithLabel(
//                           label: 'Location',
//                           tcontroller: controller.locationController,
//                           validator: (password) {
//                             if (password == null || password.isEmpty) {
//                               return 'Please enter location';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       setWidth(width: 10),
//                       Obx(
//                         () => Flexible(
//                           child: SignupTextFeildWithLabel(
//                             label: 'Password',
//                             tcontroller: controller.passwordController,
//                             obscureText: controller.isPasswordVisible.value,
//                             validator: (password) {
//                               if (password == null || password.isEmpty) {
//                                 return 'Please enter password';
//                               } else if (password.length <= 6) {
//                                 return 'Password should be atleast 6 charachter';
//                               }
//                               return null;
//                             },
//                             suffixIcon: IconButton(
//                               onPressed: () => controller.showPassword(),
//                               icon: Icon(
//                                 controller.isPasswordVisible.value
//                                     ? Icons.visibility_off_outlined
//                                     : Icons.visibility_outlined,
//                                 color: AppColors.blackColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   setHeight(height: 8),
//                   SignupTextFeildWithLabel(
//                     maxLines: 8,
//                     minLines: 5,
//                     label: 'Address',
//                     tcontroller: controller.addressController,
//                     validator: (password) {
//                       if (password == null || password.isEmpty) {
//                         return 'Please enter address';
//                       }
//                       return null;
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Obx(
//             () => CheckboxListTile(
//               contentPadding: EdgeInsets.all(0),
//               activeColor: Colors.black,
//               controlAffinity: ListTileControlAffinity.leading,
//               value: controller.isTermAndConditionSelect.value,
//               onChanged:
//                   (value) =>
//                       controller.isTermAndConditionSelected(value ?? false),
//               title: RichText(
//                 text: TextSpan(
//                   text: 'I agree to ',
//                   style: styleNunito(fontSize: 15, color: AppColors.greyColor),
//                   children: [
//                     TextSpan(
//                       text: 'Term & Condition',
//                       style: styleNunito(fontSize: 16, color: Colors.red),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Obx(
//             () => SignupButton(
//               isLoading: controller.isSignUpLoading.value,
//               onPress: () async {
//                 if (signUpKey.currentState!.validate()) {
//                   await controller.signUp(context);
//                 }
//               },
//             ),
//           ),

//           InkWell(
//             onTap: () {
//               Routes.navigateToRoute(routeName: Routes.loginScreen);
//             },
//             child: RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 text: 'Already have a account ?',
//                 style: styleNunito(fontSize: 15, color: AppColors.greyColor),
//                 children: [
//                   TextSpan(text: ' Login', style: styleRoboto(fontSize: 16)),
//                 ],
//               ),
//             ),
//           ),
//           // setHeight(height: 10),
//           // Row(
//           //   crossAxisAlignment: CrossAxisAlignment.center,
//           //   mainAxisAlignment: MainAxisAlignment.center,
//           //   children: [
//           //     Text('Term of Use', style: styleRoboto(fontSize: 14)),
//           //     setWidth(width: 8),
//           //     CustomVerticalDivider(
//           //       height: 25,
//           //       width: 0.5,
//           //     ),
//           //     setWidth(width: 8),
//           //     Text('Privacy Policy', style: styleRoboto(fontSize: 14)),
//           //   ],
//           // )
//         ],
//       ),
//     );
//   }
// }

// class MobileSignupBodyWidget extends StatelessWidget {
//   final SignupController controller;
//   const MobileSignupBodyWidget({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 8.0, left: 8, top: 25),
//       child: ListView(
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Sign up to Create your Account',
//                 maxLines: 2,
//                 style: stylePoppin(fontSize: 18, latterspacing: 2),
//               ),
//               Text(
//                 'Take the first step towards seamless management! 🚀',
//                 style: styleInter(fontSize: 15),
//               ),
//             ],
//           ),
//           setHeight(height: 30),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             child: Form(
//               key: signUpKey,
//               autovalidateMode: AutovalidateMode.onUnfocus,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                         child: SignupTextFeildWithLabel(
//                           label: 'User Name',
//                           tcontroller: controller.userNameController,
//                           validator: (password) {
//                             if (password == null || password.isEmpty) {
//                               return 'Please enter user name';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       setWidth(width: 10),
//                       Flexible(
//                         child: SignupTextFeildWithLabel(
//                           label: 'Gym Name',
//                           tcontroller: controller.passwordController,
//                           validator: (password) {
//                             if (password == null || password.isEmpty) {
//                               return 'Please enter gym name';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                   setHeight(height: 8),
//                   Row(
//                     children: [
//                       Flexible(
//                         child: SignupTextFeildWithLabel(
//                           label: 'Phone Number',
//                           tcontroller: controller.phoneNoController,
//                           validator: (password) {
//                             if (password == null || password.isEmpty) {
//                               return 'Please enter phone number';
//                             } else if (password.length < 10) {
//                               return 'Password should be atleast 10 digit';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       setWidth(width: 10),
//                       Flexible(
//                         child: SignupTextFeildWithLabel(
//                           label: 'Email',
//                           tcontroller: controller.emailController,
//                           validator: (email) {
//                             if (email == null || email.isEmpty) {
//                               return 'Please enter email';
//                             } else if (!email.contains('@')) {
//                               return 'Please enter valid email eg "youremail@gmail.com"';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                   setHeight(height: 8),
//                   Row(
//                     children: [
//                       Flexible(
//                         child: SignupTextFeildWithLabel(
//                           label: 'Gym Image',
//                           suffixIcon: InkWell(
//                             onTap: () {
//                               controller.pickImageFormGallery();
//                             },
//                             child: Icon(
//                               Icons.folder_copy_outlined,
//                               color: AppColors.blackColor,
//                             ),
//                           ),
//                           tcontroller: controller.gymImageController,
//                         ),
//                       ),
//                       setWidth(width: 10),
//                       Flexible(
//                         child: SignupTextFeildWithLabel(
//                           label: 'Role',
//                           tcontroller: controller.roleController,
//                           validator: (email) {
//                             if (email == null || email.isEmpty) {
//                               return 'Please enter role';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                   setHeight(height: 8),
//                   Row(
//                     children: [
//                       Flexible(
//                         child: SignupTextFeildWithLabel(
//                           label: 'Location',
//                           tcontroller: controller.locationController,
//                           validator: (password) {
//                             if (password == null || password.isEmpty) {
//                               return 'Please enter location';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       setWidth(width: 10),
//                       Obx(
//                         () => Flexible(
//                           child: SignupTextFeildWithLabel(
//                             label: 'Password',
//                             tcontroller: controller.passwordController,
//                             obscureText: controller.isPasswordVisible.value,
//                             validator: (password) {
//                               if (password == null || password.isEmpty) {
//                                 return 'Please enter password';
//                               } else if (password.length <= 6) {
//                                 return 'Password should be atleast 6 charachter';
//                               }
//                               return null;
//                             },
//                             suffixIcon: IconButton(
//                               onPressed: () => controller.showPassword(),
//                               icon: Icon(
//                                 controller.isPasswordVisible.value
//                                     ? Icons.visibility_off_outlined
//                                     : Icons.visibility_outlined,
//                                 color: AppColors.blackColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   setHeight(height: 8),
//                   SignupTextFeildWithLabel(
//                     maxLines: 8,
//                     minLines: 5,
//                     label: 'Address',
//                     tcontroller: controller.addressController,
//                     validator: (password) {
//                       if (password == null || password.isEmpty) {
//                         return 'Please enter address';
//                       }
//                       return null;
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Obx(
//             () => CheckboxListTile(
//               contentPadding: EdgeInsets.all(0),
//               activeColor: Colors.black,
//               controlAffinity: ListTileControlAffinity.leading,
//               value: controller.isTermAndConditionSelect.value,
//               onChanged:
//                   (value) =>
//                       controller.isTermAndConditionSelected(value ?? false),
//               title: RichText(
//                 text: TextSpan(
//                   text: 'I agree to ',
//                   style: styleNunito(fontSize: 15, color: AppColors.greyColor),
//                   children: [
//                     TextSpan(
//                       text: 'Term & Condition',
//                       style: styleNunito(fontSize: 16, color: Colors.red),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Obx(
//             () => SignupButton(
//               isLoading: controller.isSignUpLoading.value,
//               onPress: () async {
//                 if (signUpKey.currentState!.validate()) {
//                   await controller.signUp(context);
//                 }
//               },
//             ),
//           ),

//           InkWell(
//             onTap: () {
//               Routes.navigateToRoute(routeName: Routes.loginScreen);
//             },
//             child: RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 text: 'Already have a account ? ',
//                 style: styleNunito(fontSize: 15, color: AppColors.greyColor),
//                 children: [
//                   TextSpan(text: ' Login', style: styleRoboto(fontSize: 16)),
//                 ],
//               ),
//             ),
//           ),
//           // setHeight(height: 10),
//           // Row(
//           //   crossAxisAlignment: CrossAxisAlignment.center,
//           //   mainAxisAlignment: MainAxisAlignment.center,
//           //   children: [
//           //     Text('Term of Use', style: styleRoboto(fontSize: 14)),
//           //     setWidth(width: 8),
//           //     CustomVerticalDivider(
//           //       height: 25,
//           //       width: 0.5,
//           //     ),
//           //     setWidth(width: 8),
//           //     Text('Privacy Policy', style: styleRoboto(fontSize: 14)),
//           //   ],
//           // )
//         ],
//       ),
//     );
//   }
// }
