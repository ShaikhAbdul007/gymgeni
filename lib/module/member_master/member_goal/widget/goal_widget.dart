import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/button.dart';
import '../../../../helper/common_data_table.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/keys.dart';
import '../../../../utils/text_style.dart';
import '../../widget/common_add_widget.dart';
import '../view_model/goal_viewmodel.dart';

class GoalWidget extends GetView<GoalViewmodel> {
  const GoalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Training Mode', style: customPoppin(fontSize: 16)),
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
        CommonMasterMemberDataTable(
          columnNames: controller.columnName,
          members: controller.trainingModes,
        ),
      ],
    );
  }
}
