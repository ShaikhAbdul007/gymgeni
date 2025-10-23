import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

import '../../../../utils/text_style.dart';
import '../../../utils/colors.dart';
import '../../../utils/container.dart';

class CustomPieChart extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colorList;
  const CustomPieChart({
    super.key,
    required this.dataMap,
    required this.colorList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CustomContainer(
        height: 400,
        width: 500,
        margin: EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 24,
                bottom: 10,
                left: 10,
                right: 10,
              ),
              child: Text(
                'Member Disrtubtion',
                style: customNunito(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 300,
              child: PieChart(
                dataMap: dataMap,
                animationDuration: Duration(seconds: 1),
                chartRadius: 200,
                colorList: colorList,
                ringStrokeWidth: 40,
                chartType: ChartType.ring,
                centerText: "Members",
                centerTextStyle: customNunito(
                  color: AppColors.whiteColor,
                  fontSize: 15,
                ),
                chartLegendSpacing: 40,
                chartValuesOptions: ChartValuesOptions(
                  showChartValues: true,
                  showChartValuesOutside: false,
                  showChartValuesInPercentage: false,
                  decimalPlaces: 0,
                  showChartValueBackground: true,
                  chartValueBackgroundColor: AppColors.blackColor,
                  chartValueStyle: customNunito(
                    color: AppColors.whiteColor,
                    fontSize: 10,
                  ),
                ),
                legendOptions: LegendOptions(
                  showLegends: true,
                  showLegendsInRow: true,
                  legendShape: BoxShape.circle,
                  legendPosition: LegendPosition.bottom,
                  legendTextStyle: customNunito(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabletCustomPieChart extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colorList;
  const TabletCustomPieChart({
    super.key,
    required this.dataMap,
    required this.colorList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CustomContainer(
        height: 400,
        width: 500,
        margin: EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 24,
                bottom: 10,
                left: 10,
                right: 10,
              ),
              child: Text(
                'Member Disrtubtion',
                style: customNunito(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 300,
              child: PieChart(
                dataMap: dataMap,
                animationDuration: Duration(seconds: 1),
                chartRadius: 200,
                colorList: colorList,
                ringStrokeWidth: 40,
                chartType: ChartType.ring,
                centerText: "Members",
                centerTextStyle: customNunito(
                  color: AppColors.whiteColor,
                  fontSize: 15,
                ),
                chartLegendSpacing: 40,
                chartValuesOptions: ChartValuesOptions(
                  showChartValues: true,
                  showChartValuesOutside: false,
                  showChartValuesInPercentage: false,
                  decimalPlaces: 0,
                  showChartValueBackground: true,
                  chartValueBackgroundColor: AppColors.blackColor,
                  chartValueStyle: customNunito(
                    color: AppColors.whiteColor,
                    fontSize: 10,
                  ),
                ),
                legendOptions: LegendOptions(
                  showLegends: true,
                  showLegendsInRow: true,
                  legendShape: BoxShape.circle,
                  legendPosition: LegendPosition.bottom,
                  legendTextStyle: customNunito(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MobileCustomPieChart extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colorList;
  const MobileCustomPieChart({
    super.key,
    required this.dataMap,
    required this.colorList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: CustomContainer(
        height: 350,
        width: double.infinity,
        margin: EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 24,
                bottom: 10,
                left: 10,
                right: 10,
              ),
              child: Text(
                'Member Disrtubtion',
                style: customNunito(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 300,
              child: PieChart(
                dataMap: dataMap,
                animationDuration: Duration(seconds: 1),
                chartRadius: 90,
                colorList: colorList,
                ringStrokeWidth: 20,
                chartType: ChartType.ring,
                centerText: "Members",
                centerTextStyle: customNunito(
                  color: AppColors.whiteColor,
                  fontSize: 8,
                ),
                chartLegendSpacing: 40,
                chartValuesOptions: ChartValuesOptions(
                  showChartValues: true,
                  showChartValuesOutside: false,
                  showChartValuesInPercentage: false,
                  decimalPlaces: 0,
                  showChartValueBackground: true,
                  chartValueBackgroundColor: AppColors.blackColor,
                  chartValueStyle: customNunito(
                    color: AppColors.whiteColor,
                    fontSize: 10,
                  ),
                ),
                legendOptions: LegendOptions(
                  showLegends: true,
                  showLegendsInRow: true,
                  legendShape: BoxShape.circle,
                  legendPosition: LegendPosition.bottom,
                  legendTextStyle: customNunito(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
