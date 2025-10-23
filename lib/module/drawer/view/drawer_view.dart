import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gymgeni/utils/sizebox.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_style.dart';
import '../view_model/drawer_view_model.dart';
import '../widget/menu_item.dart';

class CustomDrawer extends GetView {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CustomDrawerController());
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border(
          right: BorderSide(width: 0.5, color: AppColors.greyLightColor),
        ),
      ),
      child: Column(
        children: [
          setHeight(height: 15),
          Expanded(
            child: CircleAvatar(
              radius: 50,
              child: Text('Ab', style: customNato(fontSize: 25)),
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView.builder(
              itemCount: controller.listMenuItem.length,
              itemBuilder: (context, index) {
                var menuItem = controller.listMenuItem[index];
                return Obx(
                  () => MenuItem(
                    onTap: () => controller.menuOnTap(index, menuItem.route),
                    onHover:
                        (hovering) => controller.onHovering(hovering, index),
                    isSelected: controller.selectedIndex.value == index,
                    isHovered: controller.hoverIndex.value == index,
                    icon: menuItem.icon,
                    route: menuItem.route,
                    itemName: menuItem.itemName,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
