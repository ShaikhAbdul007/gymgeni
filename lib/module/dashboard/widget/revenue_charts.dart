import 'package:flutter/material.dart';
import '../../../../utils/container.dart';
import '../../../../utils/sizebox.dart';
import '../../../../utils/text_style.dart';

class RevenueChartsComponent extends StatelessWidget {
  const RevenueChartsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: CustomContainer(
        height: 400,
        width: 750,
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
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
                    'Members',
                    style: styleNunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '',
                    style: styleNunito(
                      fontSize: 8,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            setHeight(height: 30),
            SizedBox(height: 300, width: 200, child: Container()),
          ],
        ),
      ),
    );
  }
}

class RevenueChartsTabletComponent extends StatelessWidget {
  const RevenueChartsTabletComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: CustomContainer(
        height: 400,
        width: 750,
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
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
                    'Members',
                    style: styleNunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '',
                    style: styleNunito(
                      fontSize: 8,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            setHeight(height: 30),
            SizedBox(height: 300, width: 200, child: Container()),
          ],
        ),
      ),
    );
  }
}

class RevenueChartsMobileComponent extends StatelessWidget {
  const RevenueChartsMobileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: CustomContainer(
        height: 350,
        width: double.infinity, // Mobile view: full width
        margin: EdgeInsets.symmetric(horizontal: 5),
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
                    'Members',
                    style: styleNunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '',
                    style: styleNunito(
                      fontSize: 8,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            setHeight(height: 30),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Container(),
            ), // Adjusted for mobile view
          ],
        ),
      ),
    );
  }
}
