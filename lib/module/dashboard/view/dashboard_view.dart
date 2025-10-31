import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/utils/divider.dart';
import '../../../utils/colors.dart';
import '../../../utils/sizebox.dart';
import '../../../utils/text_style.dart';
import '../../responsive_layout/responsive_dimension/responsive_tempate.dart';
import '../view_model/dashboard_view_model.dart';
import '../widget/dashboard_business_over_all_section.dart';
import '../widget/dashboard_recent_activities_section.dart';

class DashboardView extends GetView<DashboardViewModel> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(
      desktop: Desktop(controller: controller),
      mobile: Mobile(),
      tablet: Table(),
    );
  }
}

class Desktop extends StatelessWidget {
  final DashboardViewModel controller;
  const Desktop({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard',
                    style: customPoppin(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Welcome back, Abdul',
                    style: customMontserrat(color: AppColors.greyLightColor),
                  ),
                ],
              ),
              // CustomButton(
              //   height: 40,
              //   width: 120,
              //   label: 'label',
              //   onPress: () {},
              // ),
            ],
          ),
        ),
        customDivider(
          isParameterGiven: true,
          endIndent: 5,
          indent: 5,
          color: AppColors.blackColors,
        ),
        setHeight(height: 10),
        DashBoardBusinessOverAllSection(
          dashBoardBusinessOverAllListItem: controller.mainHeroList,
        ),
        setHeight(height: 10),
        WebRevenueCharts(
          colorList: controller.colorList,
          dataMap: controller.dataMap,
        ),
        setHeight(height: 10),
        WebRecentActivityComponent(),
        setHeight(height: 10),
      ],
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Mobile');
  }
}

class Tablet extends StatelessWidget {
  const Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Tablet');
  }
}
