import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_style.dart';

class CommonRichText extends StatelessWidget {
  final String label;
  final bool isAsteriskdRequired;

  const CommonRichText({
    super.key,
    required this.label,
    required this.isAsteriskdRequired,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$label ',
        style: customNunito(
          fontSize: 14,
          color: AppColors.blackColor,
          fontWeight: FontWeight.w600,
        ),
        children: [
          isAsteriskdRequired
              ? TextSpan(
                text: '*',
                style: customNunito(fontSize: 15, color: Colors.red),
              )
              : TextSpan(),
        ],
      ),
    );
  }
}
