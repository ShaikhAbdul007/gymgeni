import 'package:flutter/material.dart';
import 'package:gymgeni/utils/colors.dart';
import '../../../utils/text_style.dart';

class MenuItem extends StatelessWidget {
  final String route;
  final String itemName;
  final IconData icon;
  final void Function()? onTap;
  final void Function(bool)? onHover;
  final bool isSelected;
  final bool isHovered;
  const MenuItem({
    super.key,
    required this.route,
    required this.itemName,
    required this.icon,
    this.onTap,
    this.onHover,
    required this.isSelected,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover!(true),
      onExit: (_) => onHover!(false),
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color:
                !isSelected && isHovered
                    ? AppColors.greyLighterShadeColor
                    : isSelected
                    ? AppColors.blackColor
                    : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8),
          ),

          child: ListTile(
            leading: Icon(
              icon,
              color: isSelected ? AppColors.whiteColor : AppColors.blackColor,
              size: 20,
            ),
            title: Text(
              itemName,
              style: customMontserrat(
                color: isSelected ? AppColors.whiteColor : AppColors.blackColor,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
