import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/module/lead_master/lead_source/view_model/lead_source_view_model.dart';
import '../../../../helper/button.dart';
import '../../../../helper/common_nodatafound.dart';
import '../../../../helper/common_progress_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/keys.dart';
import '../../../../helper/common_add_widget.dart';
import '../widget/lead_source_table.dart';

class LeadSourceView extends GetView<LeadSourceViewModel> {
  const LeadSourceView({super.key});

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
              label: 'Add Source',
              onPress: () {
                Constant.customShowDialog(
                  context: context,
                  content: Obx(
                    () => CommonAddWidget(
                      errorLabel: 'Enter Source',
                      isLoading: controller.isAddLoading.value,
                      controller: controller.newLeadSourceController,
                      headerLabel: 'Add Source',
                      labelHintText: 'Source',
                      submitOnPress: () {
                        if (commonAddWidgetKey.currentState!.validate()) {
                          controller.addLeadSource(context);
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
                  : controller.source.isEmpty
                  ? const CommonNoDataFound(label: 'No source found')
                  : LeadSourceTable(
                    columnNames: controller.columnName,
                    sourceName: controller.source,
                    editOnTap: (sourceNames) {
                      controller.setData(sourceName: sourceNames.name ?? '');
                      Constant.customShowDialog(
                        context: context,
                        content: Obx(
                          () => CommonAddWidget(
                            errorLabel: 'Enter Source',
                            isLoading: controller.isAddLoading.value,
                            controller: controller.newLeadSourceController,
                            headerLabel: 'Add Source',
                            labelHintText: 'Source',
                            submitOnPress: () {
                              if (commonAddWidgetKey.currentState!.validate()) {
                                controller.updateLeadSource(
                                  context: context,
                                  id: sourceNames.id ?? '',
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

                    deleteOnTap: (sourceNames) {
                      controller.deleteLeadSource(
                        context: context,
                        id: sourceNames.id ?? '',
                      );
                    },
                  ),
        ),
      ],
    );
  }
}
