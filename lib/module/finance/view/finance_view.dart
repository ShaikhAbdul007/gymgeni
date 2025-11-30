import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/responsive_tempate.dart';

import '../../../helper/common_body.dart';
import '../../finance_master/view/finance_master_payment_method_view.dart';
import '../viewmodel/finance_viewmodel.dart';
import '../widget/finance_pending_payment.dart';

class FinanceView extends GetView<FinanceViewmodel> {
  const FinanceView({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(
      desktop: Desktop(controller: controller),
      tablet: Tablet(),
      mobile: Mobile(),
    );
  }
}

class Desktop extends StatelessWidget {
  final FinanceViewmodel controller;
  const Desktop({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CommonBody(
      tabBarChildren: [
        Text('All'),
        Text('Sale'),
        FinancePendingPayment(columnNames: [], isDataLoading: false),
        FinanceMasterPaymentMethodView(),
      ],
      heading: 'Finance',
      subHeading: 'Manage all your finances in one place',
      buttonLabel: 'Add Payment',
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
