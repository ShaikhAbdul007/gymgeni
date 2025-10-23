// import 'package:flutter/material.dart';

// import '../../../../utils/colors.dart';

// class SignupTextFeild extends StatelessWidget {
//   final Widget? suffixIcon;
//   final TextEditingController controller;
//   final bool obscureText;
//   final int minLines;
//   final int maxLines;
//   final String? Function(String?)? validator;
//   const SignupTextFeild({
//     super.key,
//     this.suffixIcon,
//     required this.controller,
//     this.obscureText = false,
//     this.validator,
//     this.minLines = 1,
//     this.maxLines = 1,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(width: 0.5, color: Colors.grey.shade100),
//       ),
//       child: TextFormField(
//         minLines: minLines,
//         maxLines: maxLines,
//         validator: validator,
//         obscuringCharacter: '*',
//         obscureText: obscureText,
//         controller: controller,
//         style: styleInter(fontSize: 12),
//         cursorColor: AppColors.blackColor,
//         cursorHeight: 15,
//         decoration: InputDecoration(
//           suffixIcon: suffixIcon,
//           border: InputBorder.none,
//           fillColor: Colors.grey.shade100,
//           filled: true,
//           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
//           errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide(color: Colors.red),
//           ),
//         ),
//       ),
//     );
//   }
// }
