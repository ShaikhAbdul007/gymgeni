import 'package:flutter/material.dart';
import '../../../helper/button.dart';

class SignupButton extends StatelessWidget {
  final bool isLoading;
  final void Function() onPress;

  const SignupButton({
    super.key,
    required this.onPress,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      isLoading: isLoading,
      height: 40,
      width: 500,
      label: 'Sign Up',
      onPress: onPress,
    );
  }
}
