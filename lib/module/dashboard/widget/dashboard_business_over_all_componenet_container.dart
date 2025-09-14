import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizebox.dart';
import '../../../helper/svg_assetes.dart';
import '../../../utils/container.dart';
import '../../../utils/text_style.dart';
import '../model/dashboard_business_overall_componenet_model.dart';

class DashBoardBusinessOverAllComponenetContainer extends StatelessWidget {
  final DashBoardBusinessOverAllComponenetModel mainHeroListItem;
  const DashBoardBusinessOverAllComponenetContainer({
    super.key,
    required this.mainHeroListItem,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 30,
      width: 280,
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    mainHeroListItem.label,
                    style: customMontserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: AppColors.greyColor,
                    ),
                  ),
                  setHeight(height: 10),
                  Text(
                    mainHeroListItem.amount,
                    style: customMontserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: mainHeroListItem.color,
                radius: 25,
                child: CustomImageAssets(
                  svgAssets: mainHeroListItem.image,
                  height: 24,
                ),
              ),
            ],
          ),
          setHeight(height: 5),
          Row(
            children: [
              Icon(
                mainHeroListItem.icons,
                size: 12,
                color: mainHeroListItem.iconsColor,
              ),
              setWidth(width: 5),
              RichText(
                text: TextSpan(
                  text: mainHeroListItem.percentage,
                  style: customMontserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: mainHeroListItem.iconsColor,
                  ),
                  children: [
                    TextSpan(
                      text: ' vs last month',
                      style: customPoppin(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MobileDashBoardBusinessOverAllComponenetContainer
    extends StatelessWidget {
  final DashBoardBusinessOverAllComponenetModel mainHeroListItem;
  const MobileDashBoardBusinessOverAllComponenetContainer({
    super.key,
    required this.mainHeroListItem,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 40,
      width: 50,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    mainHeroListItem.label,
                    style: customMontserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: AppColors.greyColor,
                    ),
                  ),
                  setHeight(height: 10),
                  Text(
                    mainHeroListItem.amount,
                    style: customMontserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: mainHeroListItem.color,
                radius: 25,
                child: CustomImageAssets(
                  svgAssets: mainHeroListItem.image,
                  height: 24,
                ),
              ),
            ],
          ),
          setHeight(height: 5),
          Row(
            children: [
              Icon(
                mainHeroListItem.icons,
                size: 12,
                color: mainHeroListItem.iconsColor,
              ),
              setWidth(width: 5),
              RichText(
                text: TextSpan(
                  text: mainHeroListItem.percentage,
                  style: customMontserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: mainHeroListItem.iconsColor,
                  ),
                  children: [
                    TextSpan(
                      text: ' vs last month',
                      style: customMontserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TabletDashBoardBusinessOverAllComponenetContainer
    extends StatelessWidget {
  final DashBoardBusinessOverAllComponenetModel mainHeroListItem;
  const TabletDashBoardBusinessOverAllComponenetContainer({
    super.key,
    required this.mainHeroListItem,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 40,
      // width: 50,
      // margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      // padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    mainHeroListItem.label,
                    style: customMontserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: AppColors.greyColor,
                    ),
                  ),
                  setHeight(height: 10),
                  Text(
                    mainHeroListItem.amount,
                    style: customMontserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: mainHeroListItem.color,
                radius: 25,
                child: CustomImageAssets(
                  svgAssets: mainHeroListItem.image,
                  height: 24,
                ),
              ),
            ],
          ),
          setHeight(height: 5),
          Row(
            children: [
              Icon(
                mainHeroListItem.icons,
                size: 12,
                color: mainHeroListItem.iconsColor,
              ),
              setWidth(width: 5),
              RichText(
                text: TextSpan(
                  text: mainHeroListItem.percentage,
                  style: customMontserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: mainHeroListItem.iconsColor,
                  ),
                  children: [
                    TextSpan(
                      text: ' vs last month',
                      style: customMontserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
