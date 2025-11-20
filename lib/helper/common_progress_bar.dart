import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/colors.dart';

class CommonProgressBar extends StatelessWidget {
  final Color circularProgressColor;
  const CommonProgressBar({
    super.key,
    this.circularProgressColor = AppColors.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(color: circularProgressColor, size: 40.0),
    );
  }
}
