import 'package:flutter/material.dart';
import 'package:gymgeni/helper/common_nodatafound.dart';
import 'package:gymgeni/helper/common_progress_bar.dart';
import 'package:gymgeni/module/dashboard/widget/pie_chart.dart';
import '../../../../utils/text_style.dart';
import '../../../utils/colors.dart';
import '../../../utils/container.dart';
import '../model/expiry_member_model.dart';
import '../model/recent_acitivity_model.dart';
import 'dashboard_recent_activites_component.dart';
import 'revenue_charts.dart';

class WebRecentActivityComponent extends StatelessWidget {
  final List<ExpiryMembers> expiryMembers;
  final List<RecentActivityData> recentActivityData;
  const WebRecentActivityComponent({
    super.key,
    required this.expiryMembers,
    required this.recentActivityData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: CustomContainer(
            height: 400,
            width: 600,
            margin: EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 24,
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Activites',
                        style: customMontserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'View All',
                        style: customMontserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child:
                      recentActivityData.isEmpty
                          ? CommonNoDataFound(label: 'No recent activity found')
                          : ListView.builder(
                            itemCount: recentActivityData.length,
                            itemBuilder: (context, index) {
                              var recentData = recentActivityData[index];
                              return DashBoardRecentActivitesComponent(
                                memberText: '',
                                image: recentData.imageUrl ?? '',
                                title: recentData.name ?? '',
                                subTitle: recentData.planName ?? '',
                              );
                            },
                          ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: CustomContainer(
            height: 400,
            width: 600,
            margin: EdgeInsets.only(right: 5),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 24,
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Expiry Members',
                        style: customMontserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'View All',
                        style: customMontserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  //height: 280,
                  child:
                      recentActivityData.isEmpty
                          ? CommonNoDataFound(label: 'No expiry found')
                          : ListView.builder(
                            itemCount: expiryMembers.length,
                            itemBuilder: (context, index) {
                              var expiryData = expiryMembers[index];
                              return DashBoardRecentActivitesComponent(
                                memberText: expiryData.planName ?? '',
                                image: expiryData.imageUrl ?? '',
                                title: expiryData.name ?? '',
                                subTitle: expiryData.expiryDate ?? '',
                              );
                            },
                          ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TabletRecentActivityComponent extends StatelessWidget {
  const TabletRecentActivityComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // First Container (Recent Activities)
        Expanded(
          flex: 3,
          child: CustomContainer(
            height: 400,
            width: 600,
            margin: EdgeInsets.only(left: 15, right: 5),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 24,
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Activites',
                        style: customMontserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'View All',
                        style: customMontserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return DashBoardRecentActivitesComponent(
                        memberText: '',
                        image: 'assets/employee.png',
                        title: 'Sarah',
                        subTitle: 'Prenium Plan',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        // Second Container (Upcoming Session)
        Expanded(
          flex: 3,
          child: CustomContainer(
            height: 400,
            width: 600,
            margin: EdgeInsets.only(right: 15),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 24,
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upcoming Session',
                        style: customMontserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'View All',
                        style: customMontserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return DashBoardRecentActivitesComponent(
                        memberText: '8 Members',
                        image: 'assets/cardio.png',
                        title: 'Carido',
                        subTitle: '10:00 AM - 11:00 AM',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MobileRecentActivityComponent extends StatelessWidget {
  const MobileRecentActivityComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First Container (Recent Activities)
        CustomContainer(
          height: 400,
          width: double.infinity,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 24,
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Activites',
                      style: customMontserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View All',
                      style: customMontserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: true,

                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return DashBoardRecentActivitesComponent(
                      memberText: '',
                      image: 'assets/employee.png',
                      title: 'Sarah',
                      subTitle: 'Prenium Plan',
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // Second Container (Upcoming Session)
        CustomContainer(
          height: 400,
          width: double.infinity,
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 24,
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upcoming Session',
                      style: customNunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View All',
                      style: customNunito(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return DashBoardRecentActivitesComponent(
                      memberText: '8 Members',
                      image: 'assets/cardio.png',
                      title: 'Carido',
                      subTitle: '10:00 AM - 11:00 AM',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WebRevenueCharts extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colorList;
  final bool isPieDataLoading;
  const WebRevenueCharts({
    super.key,
    required this.dataMap,
    required this.colorList,
    required this.isPieDataLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RevenueChartsComponent(),
        isPieDataLoading
            ? CommonProgressBar(circularProgressColor: AppColors.blackColor)
            : CustomPieChart(dataMap: dataMap, colorList: colorList),
      ],
    );
  }
}

class MobileRevenueCharts extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colorList;
  const MobileRevenueCharts({
    super.key,
    required this.dataMap,
    required this.colorList,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RevenueChartsMobileComponent(),
        MobileCustomPieChart(dataMap: dataMap, colorList: colorList),
      ],
    );
  }
}

class TabletRevenueCharts extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colorList;
  const TabletRevenueCharts({
    super.key,
    required this.dataMap,
    required this.colorList,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RevenueChartsTabletComponent(),
        TabletCustomPieChart(dataMap: dataMap, colorList: colorList),
      ],
    );
  }
}
