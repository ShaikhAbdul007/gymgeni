import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../color/colors.dart';
import '../utils/sizebox.dart';
import '../utils/text_style.dart';

class Footer extends StatelessWidget {
  final bool isMobile;
  const Footer({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    bool isKweb = kIsWeb;

    return Row(
      mainAxisAlignment:
          isKweb && isMobile
              ? MainAxisAlignment.end
              : isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.end,
      children: [
        Text(
          'powered by',
          style: customMontserrat(
            fontSize: 14,

            fontWeight: FontWeight.bold,
            color: AppColors.greyColor,
          ),
        ),
        setWidth(width: 5),
        Text('GYM MATE', style: customMontserrat(fontSize: 18)),
      ],
    );
  }
}
