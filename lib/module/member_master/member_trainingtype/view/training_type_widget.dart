import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../helper/button.dart';
import '../../../../helper/common_data_table.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/keys.dart';
import '../../../../utils/sizebox.dart';
import '../../widget/common_add_widget.dart';
import '../view_model/training_type_viewmodel.dart';

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
                      isLoading: controller.isLoading.value,
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
        CommonMasterMemberDataTable(
          columnNames: controller.columnName,
          members: controller.trainingModes,
        ),
      ],
    );
  }
}
