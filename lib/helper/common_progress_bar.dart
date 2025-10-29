import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CommonProgressBar extends StatelessWidget {
  const CommonProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: AppColors.whiteColor,
        color: AppColors.blackColor,
      ),
    );
  }
}
