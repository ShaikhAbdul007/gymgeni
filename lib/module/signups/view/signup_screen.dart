// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../utils/sizebox.dart';

// class SignupView extends StatelessWidget {
//   const SignupView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveLayout(
//       mobileScreenLayout: MobileSignupView(),
//       tabScreenLayout: WebSignupView(),
//       webScreenLayout: WebSignupView(),
//     );
//   }
// }

// class WebSignupView extends GetView<SignupController> {
//   const WebSignupView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       isMobile: false,
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Flexible(
//                   flex: 2,
//                   child: Padding(
//                     padding: const EdgeInsets.only(bottom: 150.0),
//                     child: Image.asset('assets/signup.png'),
//                   ),
//                 ),
//                 Flexible(
//                   flex: 3,
//                   child: setHeightWidth(
//                     height: 900,
//                     width: 600,
//                     child: SignupBodyWidget(controller: controller),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MobileSignupView extends GetView<SignupController> {
//   const MobileSignupView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       isMobile: true,
//       body: setHeightWidth(
//         height: double.infinity,
//         width: double.infinity,
//         child: MobileSignupBodyWidget(controller: controller),
//       ),
//     );
//   }
// }
