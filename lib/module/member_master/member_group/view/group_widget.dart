import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../helper/button.dart';
import '../../../../helper/common_nodatafound.dart';
import '../../../../helper/common_progress_bar.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/keys.dart';
import '../../widget/common_add_widget.dart';
import '../view_model/group_viewmodel.dart';
import '../widget/member_group_member_table.dart';

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
            Spacer(),
            CustomButton(
              height: 40,
              width: 90,
              label: 'Add',
              onPress: () {
                Constant.customShowDialog(
                  content: Obx(
                    () => CommonAddWidget(
                      errorLabel: 'Enter Group Name',
                      isLoading: controller.isAddLoading.value,
                      controller: controller.newTrainingController,
                      headerLabel: 'Add Group Name',
                      labelHintText: 'Group Name',
                      submitOnPress: () {
                        if (traingModeKey.currentState!.validate()) {
                          controller.addGroup(context);
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
                  : controller.groupName.isEmpty
                  ? CommonNoDataFound(label: 'No data found')
                  : MemberGroupMemberTable(
                    editOnTap: (group) {
                      controller.setData(traingName: group.name ?? '');
                      Constant.customShowDialog(
                        content: Obx(
                          () => CommonAddWidget(
                            errorLabel: 'Enter Group Name',
                            isLoading: controller.isUpdateLoading.value,
                            controller: controller.newTrainingController,
                            headerLabel: 'Edit Group Name',
                            labelHintText: 'Group Name',
                            submitOnPress: () {
                              if (traingModeKey.currentState!.validate()) {
                                controller.updateGroup(
                                  context: context,
                                  id: group.id ?? '',
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
                    deleteOnTap: (group) {
                      controller.deleteGroup(
                        context: context,
                        id: group.id ?? '',
                      );
                    },
                    columnNames: controller.columnName,
                    groupType: controller.groupName,
                  ),
        ),
      ],
    );
  }
}
