import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../module/lead_master/lead_follow_type/view_model/lead_follow_type_view_model.dart';
import '../../../../module/lead_master/lead_follow_type/widget/lead_follow_type_table.dart';

import '../../../../helper/button.dart';
import '../../../../helper/common_nodatafound.dart';
import '../../../../helper/common_progress_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/keys.dart';
import '../../../member_master/widget/common_add_widget.dart';

class LeadFollowTypeView extends GetView<LeadFollowTypeViewModel> {
  const LeadFollowTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              height: 40,
              width: 150,
              label: 'Add Follow Type',
              onPress: () {
                Constant.customShowDialog(
                  context: context,
                  content: Obx(
                    () => CommonAddWidget(
                      errorLabel: 'Enter Lead Follow Type',
                      isLoading: controller.isAddLoading.value,
                      controller: controller.newLeadFollowTypeController,
                      headerLabel: 'Add Lead Follow Type',
                      labelHintText: 'Lead Follow Type',
                      submitOnPress: () {
                        if (leadFollowTypeKey.currentState!.validate()) {
                          // controller.addLeadFollowType(context);
                        }
                      },
                      cancelOnPress: () {
                        controller.clear();
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),

        /// MAIN LIST
        Obx(
          () =>
              controller.isdataLoading.value || controller.isDeleteLoading.value
                  ? CommonProgressBar(
                    circularProgressColor: AppColors.blackColor,
                  )
                  : controller.followUpName.isEmpty
                  ? const CommonNoDataFound(label: 'No Lead Follow Types Found')
                  : LeadFollowTypeTable(
                    columnNames: controller.columnName,
                    groupType: controller.followUpName,

                    editOnTap: (item) {
                      // controller.setEditData(name: item.name ?? '');

                      Constant.customShowDialog(
                        context: context,
                        content: Obx(
                          () => CommonAddWidget(
                            errorLabel: 'Enter Lead Follow Type',
                            isLoading: controller.isAddLoading.value,
                            controller: controller.newLeadFollowTypeController,
                            headerLabel: 'Edit Lead Follow Type',
                            labelHintText: 'Lead Follow Type',
                            submitOnPress: () {
                              // if (leadFollowTypeKey.currentState!.validate()) {
                              //   controller.updateLeadFollowType(
                              //     context: context,
                              //     id: item.id ?? '',
                              //   );
                              // }
                            },
                            cancelOnPress: () {
                              controller.clear();
                            },
                          ),
                        ),
                      );
                    },

                    deleteOnTap: (item) {
                      // controller.deleteLeadFollowType(
                      //   context: context,
                      //   id: item.id ?? '',
                      // );
                    },
                  ),
        ),
      ],
    );
  }
}
