import 'package:flutter/material.dart';
import '../../../helper/button.dart';

class LoginButton extends StatelessWidget {
  final void Function() onPress;
  final bool isLoading;
  const LoginButton({super.key, required this.onPress, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      isLoading: isLoading,

      height: 40,
      width: 500,
      label: 'Login',
      onPress: onPress,
    );
  }
}
