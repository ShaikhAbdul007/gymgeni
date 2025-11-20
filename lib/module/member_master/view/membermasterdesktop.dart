import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/dimension.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_style.dart';
import '../member_goal/view/goal_widget.dart';
import '../member_group/view/group_widget.dart';
import '../member_plan/view/plan_widget.dart';
import '../member_trainingtype/view/training_type_widget.dart';
import '../member_triaingmode/view/training_mode_widget.dart';
import '../view_model/member_master_viewmodel.dart';

class MemberMasterDesktop extends GetView<MemberMasterViewModel> {
  const MemberMasterDesktop({super.key});

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
              children: [
                TrainingModeWidget(),
                TrainingTypeWidget(),
                PlanWidget(),
                GoalWidget(),
                GroupWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
