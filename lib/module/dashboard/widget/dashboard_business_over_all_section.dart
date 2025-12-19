import 'package:flutter/material.dart';
import 'package:gymgeni/helper/common_progress_bar.dart';
import '../../../utils/colors.dart';
import '../model/dashboard_business_overall_componenet_model.dart';
import 'dashboard_business_over_all_componenet_container.dart';

class DashBoardBusinessOverAllSection extends StatelessWidget {
  final List<DashBoardBusinessOverAllComponenetModel>
  dashBoardBusinessOverAllListItem;

  final bool isDataLoading;

  const DashBoardBusinessOverAllSection({
    super.key,
    required this.dashBoardBusinessOverAllListItem,
    required this.isDataLoading,
  });

  @override
  Widget build(BuildContext context) {
    return isDataLoading
        ? CommonProgressBar(circularProgressColor: AppColors.blackColor)
        : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 3.2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 5,
          ),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: dashBoardBusinessOverAllListItem.length,
          itemBuilder: (context, index) {
            return MobileDashBoardBusinessOverAllComponenetContainer(
              mainHeroListItem: dashBoardBusinessOverAllListItem[index],
            );
          },
        );
  }
}

class MobileDashBoardBusinessOverAllSection extends StatelessWidget {
  final List<DashBoardBusinessOverAllComponenetModel>
  dashBoardBusinessOverAllListItem;
  final bool isDataLoading;
  const MobileDashBoardBusinessOverAllSection({
    super.key,
    required this.dashBoardBusinessOverAllListItem,
    required this.isDataLoading,
  });

  @override
  Widget build(BuildContext context) {
    return isDataLoading
        ? CommonProgressBar(circularProgressColor: AppColors.blackColor)
        : GridView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 0,
          ),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: dashBoardBusinessOverAllListItem.length,
          itemBuilder: (context, index) {
            return MobileDashBoardBusinessOverAllComponenetContainer(
              mainHeroListItem: dashBoardBusinessOverAllListItem[index],
            );
          },
        );
  }
}

class TabletDashBoardBusinessOverAllSection extends StatelessWidget {
  final List<DashBoardBusinessOverAllComponenetModel>
  dashBoardBusinessOverAllListItem;
  final bool isDataLoading;
  const TabletDashBoardBusinessOverAllSection({
    super.key,
    required this.dashBoardBusinessOverAllListItem,
    required this.isDataLoading,
  });

  @override
  Widget build(BuildContext context) {
    return isDataLoading
        ? CommonProgressBar(circularProgressColor: AppColors.blackColor)
        : GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two columns in tablet view
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 4, // Adjusted for better UI on tablet
          ),
          itemCount: dashBoardBusinessOverAllListItem.length,
          itemBuilder: (context, index) {
            return DashBoardBusinessOverAllComponenetContainer(
              mainHeroListItem: dashBoardBusinessOverAllListItem[index],
            );
          },
        );
  }
}
