import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gymgeni/module/lead/viewmodel/lead_view_model.dart';

import '../../../helper/common_body.dart';
import '../../responsive_layout/responsive_dimension/responsive_tempate.dart';

class LeadView extends GetView<LeadViewModel> {
  const LeadView({super.key});

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
  final LeadViewModel controller;
  const Desktop({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CommonBody(
      tabBarChildren: [Text('All'), Text('follow Up'), Text('Configuration')],
      heading: 'Lead',
      subHeading: 'Manage all your leads in one place',
      buttonLabel: 'Add Lead',
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
