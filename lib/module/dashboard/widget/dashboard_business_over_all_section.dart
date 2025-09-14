import 'package:flutter/material.dart';
import '../model/dashboard_business_overall_componenet_model.dart';
import 'dashboard_business_over_all_componenet_container.dart';

class DashBoardBusinessOverAllSection extends StatelessWidget {
  final List<DashBoardBusinessOverAllComponenetModel>
      dashBoardBusinessOverAllListItem;

  const DashBoardBusinessOverAllSection({
    super.key,
    required this.dashBoardBusinessOverAllListItem,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 3.2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 5),
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

  const MobileDashBoardBusinessOverAllSection({
    super.key,
    required this.dashBoardBusinessOverAllListItem,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio:2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 0),
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

  const TabletDashBoardBusinessOverAllSection({
    super.key,
    required this.dashBoardBusinessOverAllListItem,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
