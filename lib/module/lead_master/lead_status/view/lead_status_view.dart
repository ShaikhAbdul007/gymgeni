import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../helper/button.dart';
import '../../../../helper/common_nodatafound.dart';
import '../../../../helper/common_progress_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/keys.dart';
import '../../../../helper/common_add_widget.dart';
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
                        if (commonAddWidgetKey.currentState!.validate()) {
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
                  : controller.status.isEmpty
                  ? const CommonNoDataFound(label: 'No status found')
                  : LeadStatusTable(
                    columnNames: controller.columnName,
                    statusName: controller.status,

                    editOnTap: (statusNames) {
                      controller.setData(statusName: statusNames.name ?? '');

                      Constant.customShowDialog(
                        context: context,
                        content: Obx(
                          () => CommonAddWidget(
                            errorLabel: 'Enter status',
                            isLoading: controller.isAddLoading.value,
                            controller: controller.newLeadSourceController,
                            headerLabel: 'Edit status',
                            labelHintText: 'Status',
                            submitOnPress: () {
                              if (commonAddWidgetKey.currentState!.validate()) {
                                controller.updateLeadStatus(
                                  context: context,
                                  id: statusNames.id ?? '',
                                );
                              }
                            },
                            cancelOnPress: () {
                              controller.clear();
                            },
                          ),
                        ),
                      );
                    },

                    deleteOnTap: (statusNames) {
                      controller.deleteLeadSource(
                        context: context,
                        id: statusNames.id ?? '',
                      );
                    },
                  ),
        ),
      ],
    );
  }
}
