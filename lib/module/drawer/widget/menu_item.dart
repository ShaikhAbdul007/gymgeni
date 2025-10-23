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
    return InkWell(
      onTap: onTap,
      onHover: onHover,
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? AppColors.greyLighterShadeColor : Colors.black,
          size: 20,
        ),
        title: Text(
          itemName,
          style: customMontserrat(
            color: isSelected ? AppColors.greyLighterShadeColor : Colors.black,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
