import 'package:flutter/material.dart';

import '../../../../utils/text_style.dart';
import '../../../utils/colors.dart';
import '../../../helper/button.dart';

class LoginButton extends StatelessWidget {
  final void Function() onPress;
  final bool isLoading;
  const LoginButton({super.key, required this.onPress, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      isLoading: isLoading,
      style: customPoppin(color: AppColors.whiteColor, fontSize: 16),
      height: 40,
      width: 500,
      label: 'Login',
      onPress: onPress,
    );
  }
}
