import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/button.dart';
import '../../../../helper/common_nodatafound.dart';
import '../../../../helper/common_progress_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/keys.dart';
import '../../../member_master/widget/common_add_widget.dart';
import '../view_model/lead_categories_view_model.dart';
import '../widget/lead_categorie_table.dart';

class LeadCategoriesView extends GetView<LeadCategoriesViewModel> {
  const LeadCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            CustomButton(
              height: 40,
              width: 150,
              label: 'Add Categorie',
              onPress: () {
                Constant.customShowDialog(
                  content: Obx(
                    () => CommonAddWidget(
                      errorLabel: 'Enter Categorie',
                      isLoading: controller.isAddLoading.value,
                      controller: controller.newLeadCategorieController,
                      headerLabel: 'Add Categorie',
                      labelHintText: 'Categorie',
                      submitOnPress: () {
                        if (leadCategorieKey.currentState!.validate()) {
                          //controller.addGroup(context);
                        }
                      },
                      cancelOnPress: () {
                        controller.clear();
                      },
                    ),
                  ),
                  context: context,
                );
              },
            ),
          ],
        ),
        Obx(
          () =>
              controller.isdataLoading.value || controller.isDeleteLoading.value
                  ? CommonProgressBar(
                    circularProgressColor: AppColors.blackColor,
                  )
                  : controller.categorieName.isEmpty
                  ? CommonNoDataFound(label: 'No data found')
                  : LeadCategorieTable(
                    editOnTap: (group) {
                      // controller.setData(traingName: group.name ?? '');
                      Constant.customShowDialog(
                        content: Obx(
                          () => CommonAddWidget(
                            errorLabel: 'Enter Categorie',
                            isLoading: controller.isAddLoading.value,
                            controller: controller.newLeadCategorieController,
                            headerLabel: 'Add Categorie',
                            labelHintText: 'Categorie',
                            submitOnPress: () {
                              // if (traingModeKey.currentState!.validate()) {
                              //   controller.updateGroup(
                              //     context: context,
                              //     id: group.id ?? '',
                              //   );
                              // }
                            },
                            cancelOnPress: () {
                              controller.clear();
                            },
                          ),
                        ),
                        context: context,
                      );
                    },
                    deleteOnTap: (group) {
                      // controller.deleteGroup(
                      //   context: context,
                      //   id: group.id ?? '',
                      // );
                    },
                    columnNames: controller.columnName,
                    groupType: controller.categorieName,
                  ),
        ),
      ],
    );
  }
}
