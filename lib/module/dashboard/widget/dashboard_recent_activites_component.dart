import 'package:flutter/material.dart';

import '../../../helper/svg_assetes.dart';
import '../../../utils/text_style.dart';

class DashBoardRecentActivitesComponent extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final String memberText;
  const DashBoardRecentActivitesComponent({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.memberText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 800,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue.shade50.withOpacity(0.3),
      ),
      child: ListTile(
        trailing: Text(
          memberText,
          style: customMontserrat(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
        leading: CustomImageAssets(svgAssets: image, height: 40),
        title: Text(
          title,
          style: customMontserrat(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subTitle,
          style: customMontserrat(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
