// import 'package:flutter/material.dart';
// import 'signup_textfeild.dart';

// class SignupTextFeildWithLabel extends StatelessWidget {
//   final String label;
//   final int maxLines;
//   final int minLines;
//   final TextEditingController tcontroller;
//   final String? Function(String?)? validator;
//   final bool obscureText;
//   final Widget? suffixIcon;
//   const SignupTextFeildWithLabel({
//     super.key,
//     this.maxLines = 1,
//     this.minLines = 1,
//     required this.label,
//     required this.tcontroller,
//     this.suffixIcon,
//     this.obscureText = false,
//     this.validator,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: stylePoppin(fontSize: 14)),
//         SignupTextFeild(
//           obscureText: obscureText,
//           suffixIcon: suffixIcon,
//           maxLines: maxLines,
//           minLines: minLines,
//           controller: tcontroller,
//           validator: validator,
//         ),
//       ],
//     );
//   }
// }
