// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SignupController extends GetxController with FirebaseAuthService {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController userNameController = TextEditingController();
//   TextEditingController gymNameController = TextEditingController();
//   TextEditingController phoneNoController = TextEditingController();
//   TextEditingController gymImageController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController roleController = TextEditingController();
//   TextEditingController locationController = TextEditingController();
//   RxBool isPasswordVisible = true.obs;
//   RxBool isSignUpLoading = false.obs;
//   RxBool isTermAndConditionSelect = false.obs;
//   final ImagePicker imagePicker = ImagePicker();

//   showPassword() {
//     isPasswordVisible.value = !isPasswordVisible.value;
//   }

//   isTermAndConditionSelected(bool value) {
//     isTermAndConditionSelect.value = value;
//   }

//   pickImageFormGallery() async {
//     var res = await imagePicker.pickImage(source: ImageSource.gallery);
//     gymImageController.text = res!.name;
//     print(res?.name);
//     print(res?.path);
//   }

//   signUp(BuildContext context) async {
//     isSignUpLoading.value = true;
//     var res = await auth
//         .createUserWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim(),
//         )
//         .then((value) {
//           isSignUpLoading.value = false;

//           Routes.navigateToRoute(routeName: Routes.loginScreen);
//           UserCredential user = value;
//           print('value is $value');
//         })
//         .onError((error, stackTrace) {
//           Constant.showCustomLAlert(
//             errorMessage: error.toString(),
//             context: context,
//           );
//           isSignUpLoading.value = false;
//         });
//   }
// }
