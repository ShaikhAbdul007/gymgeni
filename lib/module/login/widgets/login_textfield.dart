// import 'package:flutter/material.dart';
// import 'package:gymgeni/utils/text_style.dart';

// import '../../../../utils/colors.dart';

// class LoginTextFeild extends StatelessWidget {
//   final TextEditingController controller;
//   final Widget? suffixIcon;
//   final bool obscureText;
//   final String? Function(String?)? validator;
//   const LoginTextFeild({
//     super.key,
//     this.suffixIcon,
//     required this.controller,
//     this.obscureText = false,
//     this.validator,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(width: 0.5, color: Colors.grey.shade100),
//       ),
//       child: TextFormField(
//         validator: validator,
//         obscureText: obscureText,
//         obscuringCharacter: '*',
//         controller: controller,
//         style: customPoppin(fontSize: 12),
//         cursorColor: AppColors.blackColor,
//         cursorHeight: 15,
//         decoration: InputDecoration(
//           suffixIcon: suffixIcon,
//           border: InputBorder.none,
//           fillColor: Colors.grey.shade100,
//           filled: true,
//           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide(color: Colors.red),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide(color: Colors.red),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide(color: Colors.transparent),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide(color: Colors.transparent),
//           ),
//         ),
//       ),
//     );
//   }
// }
