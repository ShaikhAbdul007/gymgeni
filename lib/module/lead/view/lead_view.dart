import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gymgeni/module/lead/viewmodel/lead_view_model.dart';
import 'package:gymgeni/module/lead_master/view/lead_master_view.dart';

import '../../../helper/common_body.dart';
import '../../../utils/constant.dart';
import '../../../utils/keys.dart';
import '../../responsive_layout/responsive_dimension/responsive_tempate.dart';
import '../widget/all_lead.dart';
import '../widget/create_new_lead.dart';
import '../widget/follow_up_type.dart';

class LeadView extends GetView<LeadViewModel> {
  const LeadView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(
      desktop: Desktop(controller: controller),
      tablet: Table(),
      mobile: Mobile(),
      scaffoldKey: leadScaffoldKey,
      endDrawer: CreateNewLead(controller: controller),
    );
  }
}

class Desktop extends StatelessWidget {
  final LeadViewModel controller;
  const Desktop({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CommonBody(
      tabBarChildren: [
        Obx(
          () => AllLead(
            columnNames: controller.columns,
            isDataLoading: controller.isAllLeaLoading.value,
            leads: controller.allleadList,
          ),
        ),
        FollowUpType(),
        LeadMasterView(),
      ],
      heading: 'Lead',
      subHeading: 'Manage all your leads in one place',
      buttonLabel: 'Add Lead',
      buttonOnPress: () {
        Constant.customPrintLog('lead new ');
        controller.openDrawer();
      },
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
