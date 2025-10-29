import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/helper/textfield.dart';

import '../../../../helper/button.dart';
import '../../../../helper/common_data_table.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/keys.dart';
import '../../widget/common_add_widget.dart';
import '../view_model/group_viewmodel.dart';

class GroupWidget extends GetView<GroupViewmodel> {
  const GroupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: CustomTextField(controller: controller.searchController),
            ),
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
