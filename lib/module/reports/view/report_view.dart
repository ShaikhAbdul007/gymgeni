import 'package:flutter/material.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/responsive_tempate.dart';

import '../../../utils/colors.dart';
import '../../../utils/sizebox.dart';
import '../../../utils/text_style.dart';
import '../widget/report_widget.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(
      desktop: Desktop(),
      tablet: Table(),
      mobile: Mobile(),
    );
  }
}

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView(
        children: [
          Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reports',
                style: customPoppin(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              Text(
                'Download all your report in one place',
                style: customMontserrat(color: AppColors.greyLightColor),
              ),
            ],
          ),
          setHeight(height: 10),
          Row(
            children: [
              Expanded(
                child: ReportContainer(
                  height: 200,
                  label: 'Today Collection',
                  note:
                      'Membership Wise Collection showcases the funds collected from various memberships, calculated from corresponding invoices.',
                ),
              ),
              setWidth(width: 15),
              Expanded(
                child: ReportContainer(
                  height: 200,
                  label: 'Transaction Date Wise Collection',
                  note:
                      'Membership Wise Collection showcases the funds collected from various memberships, calculated from corresponding invoices.',
                ),
              ),
            ],
          ),
          setHeight(height: 10),
          Row(
            children: [
              Expanded(
                child: ReportContainer(
                  height: 200,
                  label: 'Gender Wise Collection',
                  note:
                      'Membership Wise Collection showcases the funds collected from various memberships, calculated from corresponding invoices.',
                ),
              ),
              setWidth(width: 15),
              Expanded(
                child: ReportContainer(
                  height: 200,
                  label: 'Membership Wise Collection',
                  note:
                      'Membership Wise Collection showcases the funds collected from various memberships, calculated from corresponding invoices.',
                ),
              ),
            ],
          ),
        ],
      ),
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
