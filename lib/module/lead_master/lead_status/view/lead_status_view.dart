import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../helper/button.dart';
import '../../../../helper/common_nodatafound.dart';
import '../../../../helper/common_progress_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/keys.dart';
import '../../../member_master/widget/common_add_widget.dart';
import '../view_model/lead_status_view_model.dart';
import '../widget/lead_status_table.dart';

class LeadStatusView extends GetView<LeadStatusViewModel> {
  const LeadStatusView({super.key});

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
              width: 120,
              label: 'Add Status',
              onPress: () {
                Constant.customShowDialog(
                  context: context,
                  content: Obx(
                    () => CommonAddWidget(
                      errorLabel: 'Enter Status',
                      isLoading: controller.isAddLoading.value,
                      controller: controller.newLeadSourceController,
                      headerLabel: 'Add Status',
                      labelHintText: 'Status',
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
                  : LeadStatusTable(
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
                            controller: controller.newLeadSourceController,
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
