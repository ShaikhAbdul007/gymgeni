import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/helper/common_nodatafound.dart';
import 'package:gymgeni/helper/common_progress_bar.dart';
import 'package:gymgeni/utils/sizebox.dart';
import '../../../../helper/button.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/keys.dart';
import '../../widget/common_add_widget.dart';
import '../view_model/training_mode_view_model.dart';
import '../widget/training_mode_member_table.dart';

class TrainingModeWidget extends GetView<TrainingModeViewModel> {
  const TrainingModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            setWidth(width: 10),
            CustomButton(
              height: 40,
              width: 90,
              label: 'Add',
              onPress: () {
                Constant.customShowDialog(
                  content: Obx(
                    () => CommonAddWidget(
                      errorLabel: 'Enter training mode',
                      isLoading: controller.isAddLoading.value,
                      controller: controller.newTrainingController,
                      headerLabel: 'Add Training Mode',
                      labelHintText: 'Training Mode',
                      submitOnPress: () {
                        if (traingModeKey.currentState!.validate()) {
                          controller.addTraining(context);
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
                  ? CommonProgressBar()
                  : controller.trainingModes.isEmpty
                  ? CommonNoDataFound(label: 'No data found')
                  : TrainingModeMemberTable(
                    deleteOnTap: (member) {
                      controller.deleteTraining(
                        context: context,
                        id: member.id ?? '',
                      );
                    },
                    editOnTap: (member) {
                      controller.setData(traingName: member.name ?? '');

                      Constant.customShowDialog(
                        content: Obx(
                          () => CommonAddWidget(
                            errorLabel: 'Enter training mode',
                            isLoading: controller.isUpdateLoading.value,
                            controller: controller.newTrainingController,
                            headerLabel: 'Edit Training Mode',
                            labelHintText: 'Training Mode',
                            submitOnPress: () {
                              if (traingModeKey.currentState!.validate()) {
                                controller.updateTraining(
                                  context: context,
                                  id: member.id ?? '',
                                );
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
                    columnNames: controller.columnName,
                    members: controller.trainingModes,
                  ),
        ),
      ],
    );
  }
}
