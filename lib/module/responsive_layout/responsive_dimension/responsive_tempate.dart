import 'package:flutter/material.dart';
import '../screens/desktop.dart';
import '../screens/mobile.dart';
import '../screens/tablet.dart';
import 'responsive_layout.dart';

class ResponsiveTemplate extends StatelessWidget {
  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;
  final Widget? endDrawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const ResponsiveTemplate({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
    this.endDrawer,
    this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        desktop: Desktop(
          body: desktop,
          endDrawer: endDrawer ?? Container(),
          scaffoldKey: scaffoldKey,
        ),
        tablet: Tablet(body: tablet ?? desktop),
        mobile: Mobile(body: mobile ?? desktop),
      ),
    );
  }
}
