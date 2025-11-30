import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../helper/button.dart';
import '../../../../helper/common_nodatafound.dart';
import '../../../../helper/common_progress_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/keys.dart';
import '../../../../utils/text_style.dart';
import '../../../../helper/common_add_widget.dart';
import '../view_model/goal_viewmodel.dart';
import '../widget/member_goal_member_table.dart';

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
            Spacer(),
            CustomButton(
              height: 40,
              width: 90,
              label: 'Add',
              onPress: () {
                Constant.customShowDialog(
                  content: Obx(
                    () => CommonAddWidget(
                      errorLabel: 'Enter Goal Name',
                      isLoading: controller.isAddLoading.value,
                      controller: controller.newTrainingController,
                      headerLabel: 'Add Goal Name',
                      labelHintText: 'Goal Name',
                      submitOnPress: () {
                        if (commonAddWidgetKey.currentState!.validate()) {
                          controller.addGoalName(context);
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
                  : controller.goalName.isEmpty
                  ? Center(child: CommonNoDataFound(label: 'No data found'))
                  : MemberGoalMemberTable(
                    deleteOnTap: (goal) {
                      controller.deleteGoalName(
                        context: context,
                        id: goal.id ?? '',
                      );
                    },
                    editOnTap: (goal) {
                      controller.setData(traingName: goal.name ?? '');
                      Constant.customShowDialog(
                        content: Obx(
                          () => CommonAddWidget(
                            errorLabel: 'Enter Goal Name',
                            isLoading: controller.isUpdateLoading.value,
                            controller: controller.newTrainingController,
                            headerLabel: 'Edit Goal Name',
                            labelHintText: 'Goal Name',
                            submitOnPress: () {
                              if (commonAddWidgetKey.currentState!.validate()) {
                                controller.updateGoalName(
                                  context: context,
                                  id: goal.id ?? '',
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
                    goalType: controller.goalName,
                  ),
        ),
      ],
    );
  }
}
