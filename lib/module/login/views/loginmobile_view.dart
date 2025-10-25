import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/loginscreen_controller.dart';

class LoginMobile extends GetView<LoginViewModel> {
  const LoginMobile({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}

// class MobileLoginBodyWidget extends StatelessWidget {
//   final LoginScreenController controller;
//   const MobileLoginBodyWidget({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//       child: ListView(
//         children: [
//           setHeight(height: 50),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 'Log in to your Account',
//                 maxLines: 2,
//                 style: stylePoppin(fontSize: 25, latterspacing: 2),
//               ),
//               setHeight(height: 8),
//               Text(
//                 '📊 See what is going on with your business',
//                 style: styleInter(fontSize: 15),
//               ),
//             ],
//           ),
//           setHeight(height: 30),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             child: Form(
//               key: loginKey,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text('Email', style: stylePoppin(fontSize: 14)),
//                   LoginTextFeild(
//                     validator: (email) {
//                       if (email == null || email.isEmpty) {
//                         return 'Please enter email';
//                       } else if (!email.contains('@')) {
//                         return 'Please enter valid email eg "youremail@gmail.com"';
//                       }
//                       return null;
//                     },
//                     controller: controller.emailController,
//                   ),
//                   setHeight(height: 22),
//                   Text('Password', style: stylePoppin(fontSize: 14)),
//                   Obx(
//                     () => LoginTextFeild(
//                       obscureText: controller.isPasswordVisible.value,
//                       validator: (password) {
//                         if (password == null || password.isEmpty) {
//                           return 'Please enter password';
//                         } else if (password.length <= 6) {
//                           return 'Password should be atleast 6 charachter';
//                         }
//                         return null;
//                       },
//                       controller: controller.passwordController,
//                       suffixIcon: IconButton(
//                         onPressed: () => controller.showPassword(),
//                         icon: Icon(
//                           controller.isPasswordVisible.value
//                               ? Icons.visibility_off_outlined
//                               : Icons.visibility_outlined,
//                           color: AppColors.blackColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                   CheckboxListTile(
//                     contentPadding: EdgeInsets.all(0),
//                     activeColor: Colors.black,
//                     controlAffinity: ListTileControlAffinity.leading,
//                     value: false,
//                     onChanged: (value) {},
//                     title: Text(
//                       'keep me logged in',
//                       style: styleNunito(fontSize: 16),
//                     ),
//                   ),
//                   CheckboxListTile(
//                     contentPadding: EdgeInsets.all(0),
//                     activeColor: Colors.black,
//                     controlAffinity: ListTileControlAffinity.leading,
//                     value: controller.isTermAndConditionSelect.value,
//                     onChanged:
//                         (value) => controller.isTermAndConditionSelected(
//                           value ?? false,
//                         ),
//                     title: RichText(
//                       text: TextSpan(
//                         text: 'I agree to ',
//                         style: styleNunito(
//                           fontSize: 15,
//                           color: AppColors.greyColor,
//                         ),
//                         children: [
//                           TextSpan(
//                             text: 'Term & Condition',
//                             style: styleNunito(fontSize: 16, color: Colors.red),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           setHeight(height: 30),
//           Obx(
//             () => LoginButton(
//               isLoading: controller.isLoading.value,
//               onPress: () async {
//                 if (!controller.isTermAndConditionSelect.value) {
//                   Constant.showCustomLAlert(
//                     context: context,
//                     errorMessage: 'Select term and condtion',
//                   );
//                 } else {
//                   await controller.login(context);
//                 }
//               },
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               Routes.navigateToRoute(routeName: Routes.signupScreen);
//             },
//             child: RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 text: 'Do not have account ? ',
//                 style: styleNunito(fontSize: 15, color: AppColors.greyColor),
//                 children: [
//                   TextSpan(text: ' Sign Up', style: styleRoboto(fontSize: 16)),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
