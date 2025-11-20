import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/module/lead_master/lead_categories/view/lead_categories_view.dart';
import 'package:gymgeni/module/lead_master/lead_follow_type/view/lead_follow_type_view.dart';
import 'package:gymgeni/module/lead_master/lead_source/view/lead_source_view.dart';
import 'package:gymgeni/module/lead_master/lead_status/view/lead_status_view.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/dimension.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_style.dart';
import '../view_model/lead_master_view_model.dart';

class LeadMasterView extends GetView<LeadMasterViewModel> {
  const LeadMasterView({super.key});

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
                LeadCategoriesView(),
                LeadFollowTypeView(),
                LeadSourceView(),
                LeadStatusView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
