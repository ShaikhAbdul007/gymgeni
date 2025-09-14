import 'package:flutter/widgets.dart';
import 'dimension.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget tabScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout(
      {super.key,
      required this.webScreenLayout,
      required this.tabScreenLayout,
      required this.mobileScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= webScreen) {
          return webScreenLayout;
        } else if (constraints.maxWidth >= tabScreen &&
            constraints.maxWidth < webScreen) {
          return tabScreenLayout; 
        } else {
          return mobileScreenLayout; 
        }
      },
    );
  }
}


