import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../helper/button.dart';
import '../../../../helper/common_nodatafound.dart';
import '../../../../helper/common_progress_bar.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/keys.dart';
import '../view_model/plan_viewmodel.dart';
import '../widget/member_add_new_planwidget.dart';
import '../widget/member_plan_member_table.dart';

class PlanWidget extends GetView<PlanViewmodel> {
  const PlanWidget({super.key});

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
                    () => CommonAddNewPlanWidget(
                      labelHintText2: 'Plan Amount',
                      errorLabel2: 'Enter Plan Name',
                      errorLabel: 'Enter Plan Name',
                      isLoading: controller.isAddLoading.value,
                      controller: controller.newTrainingController,
                      amountController: controller.amountController,
                      headerLabel: 'Add Plan Name',
                      labelHintText: 'Plan Name',
                      submitOnPress: () {
                        if (traingModeKey.currentState!.validate()) {
                          controller.addPlan(context);
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
                  : controller.planName.isEmpty
                  ? CommonNoDataFound(label: 'No data found')
                  : MemberPlanMemberTable(
                    editOnTap: (plan) {
                      controller.setData(
                        traingName: plan.name ?? '',
                        planAmount: 0,
                      );
                      Constant.customShowDialog(
                        content: Obx(
                          () => CommonAddNewPlanWidget(
                            labelHintText2: 'Plan Amount',
                            errorLabel2: 'Enter Plan Name',
                            errorLabel: 'Enter Plan Name',
                            isLoading: controller.isUpdateLoading.value,
                            controller: controller.newTrainingController,
                            amountController: controller.amountController,
                            headerLabel: 'Edit Plan Name',
                            labelHintText: 'Plan Name',
                            submitOnPress: () {
                              if (traingModeKey.currentState!.validate()) {
                                controller.updatePlan(
                                  context: context,
                                  id: plan.id ?? '',
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
                    deleteOnTap: (plan) {
                      controller.deletePlan(
                        context: context,
                        id: plan.id ?? '',
                      );
                    },
                    columnNames: controller.columnName,
                    planType: controller.planName,
                  ),
        ),
      ],
    );
  }
}
