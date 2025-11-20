import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../helper/button.dart';
import '../../../../helper/common_nodatafound.dart';
import '../../../../helper/common_progress_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/keys.dart';
import '../../../../utils/sizebox.dart';
import '../../widget/common_add_widget.dart';
import '../view_model/training_type_viewmodel.dart';
import '../widget/training_type_member_table.dart';

class TrainingTypeWidget extends GetView<TrainingTypeViewmodel> {
  const TrainingTypeWidget({super.key});

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
                      errorLabel: 'Enter training type',
                      isLoading: controller.isAddLoading.value,
                      controller: controller.newTrainingController,
                      headerLabel: 'Add Training type',
                      labelHintText: 'Training Type',
                      submitOnPress: () {
                        if (traingModeKey.currentState!.validate()) {
                          controller.addTrainingType(context);
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
                  : controller.trainingType.isEmpty
                  ? CommonNoDataFound(label: 'No data found')
                  : TrainingTypeMemberTable(
                    columnNames: controller.columnName,
                    traingType: controller.trainingType,
                    deleteOnTap: (type) {
                      controller.deleteTrainingType(
                        context: context,
                        id: type.id ?? '',
                      );
                    },
                    editOnTap: (type) {
                      controller.setData(traingName: type.name ?? '');
                      Constant.customShowDialog(
                        content: Obx(
                          () => CommonAddWidget(
                            errorLabel: 'Enter training type',
                            isLoading: controller.isUpdateLoading.value,
                            controller: controller.newTrainingController,
                            headerLabel: 'Edit Training Type',
                            labelHintText: 'Training Type',
                            submitOnPress: () {
                              if (traingModeKey.currentState!.validate()) {
                                controller.updateTrainingType(
                                  context: context,
                                  id: type.id ?? '',
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
                  ),
        ),
      ],
    );
  }
}
