import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/helper/common_body.dart';

import '../../responsive_layout/responsive_dimension/responsive_tempate.dart';
import '../viewmodel/employee_viewmodel.dart';

class EmployeeView extends GetView<EmployeeViewmodel> {
  const EmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(
      desktop: Desktop(controller: controller),
      tablet: Table(),
      mobile: Mobile(),
    );
  }
}

class Desktop extends StatelessWidget {
  final EmployeeViewmodel controller;
  const Desktop({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CommonBody(
      tabBarChildren: [Text('All'), Text('Attendance'), Text('Configuration')],
      heading: 'Employees',
      subHeading: 'Manage all your employees in one place',
      buttonLabel: 'Add Employe',
      buttonOnPress: () {},
      tabs: controller.tabs,
      tabController: controller.tabController,
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Tablet extends StatelessWidget {
  const Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
