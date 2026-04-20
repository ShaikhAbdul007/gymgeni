import 'package:flutter/material.dart';
import 'package:gymgeni/utils/constant.dart';
import 'dimension.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget desktop;
  final Widget tablet;
  final Widget mobile;
  const ResponsiveLayout({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
     Constant.   customPrintLog(' Screen width: ${constraints.maxWidth}');
        if (constraints.maxWidth >= destopSize) {
          return desktop;
        } else if (constraints.maxWidth >= tabletSize &&
            constraints.maxWidth < destopSize) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
