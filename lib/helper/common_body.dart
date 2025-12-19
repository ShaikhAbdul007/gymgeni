import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_style.dart';
import 'button.dart';

class CommonBody extends StatelessWidget {
  final String heading;
  final String buttonLabel;
  final void Function() buttonOnPress;
  final String subHeading;
  final List<Widget> tabBarChildren;
  final List<Widget> tabs;
  final TabController? tabController;
  const CommonBody({
    super.key,
    required this.tabBarChildren,
    required this.heading,
    required this.buttonLabel,
    required this.buttonOnPress,
    required this.subHeading,
    required this.tabs,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading,
                    style: customPoppin(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subHeading,
                    style: customMontserrat(color: AppColors.greyLightColor),
                  ),
                ],
              ),
              CustomButton(
                height: 40,
                width: 150,
                label: buttonLabel,
                color: AppColors.blackColor,
                onPress: buttonOnPress,
              ),
            ],
          ),
        ),
        TabBar(
          dividerColor: Colors.transparent,
          controller: tabController,
          isScrollable: true,
          labelColor: AppColors.whiteColor,
          unselectedLabelColor: AppColors.blackColor,
          labelStyle: customPoppin(fontWeight: FontWeight.w400),
          unselectedLabelStyle: customPoppin(fontWeight: FontWeight.w400),
          indicator: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.blackColor,
            borderRadius: BorderRadius.circular(4),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorAnimation: TabIndicatorAnimation.linear,
          indicatorPadding: EdgeInsetsGeometry.all(5),
          padding: EdgeInsets.only(top: 5),
          tabs: tabs,
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: tabBarChildren,
            ),
          ),
        ),
      ],
    );
  }
}
