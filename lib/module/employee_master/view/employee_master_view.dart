import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gymgeni/module/employee_master/employee_master_type/view/employee_type_view.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_style.dart';
import '../../responsive_layout/responsive_dimension/dimension.dart';
import '../view_model/employee_master_view_model.dart';

class EmployeeMasterView extends GetView<EmployeeMasterViewModel> {
  const EmployeeMasterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: TabBar(
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              controller: controller.tabController,
              isScrollable: true,
              labelColor: AppColors.blackColor,
              physics: NeverScrollableScrollPhysics(),
              unselectedLabelColor: AppColors.blackColor,
              labelStyle: customPoppin(fontWeight: FontWeight.w400),
              unselectedLabelStyle: customPoppin(fontWeight: FontWeight.w400),
              indicatorAnimation: TabIndicatorAnimation.linear,
              padding: EdgeInsets.only(top: 5),
              tabs: controller.tabs,
            ),
          ),
          Flexible(
            flex: 8,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.tabController,
              children: [EmployeeTypeView()],
            ),
          ),
        ],
      ),
    );
  }
}
