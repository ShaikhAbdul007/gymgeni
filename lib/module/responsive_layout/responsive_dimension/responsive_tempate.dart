import 'package:flutter/material.dart';
import '../screens/desktop.dart';
import '../screens/mobile.dart';
import '../screens/tablet.dart';
import 'responsive_layout.dart';

class ResponsiveTemplate extends StatelessWidget {
  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;
  const ResponsiveTemplate({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        desktop: Desktop(body: desktop),
        tablet: Tablet(body: tablet ?? desktop),
        mobile: Mobile(body: mobile ?? desktop),
      ),
    );
  }
}
