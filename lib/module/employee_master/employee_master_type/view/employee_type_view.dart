import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/helper/textfield.dart';
import 'package:gymgeni/module/employee_master/employee_master_type/view_model/employee_type_view_model.dart';
import 'package:gymgeni/utils/sizebox.dart';
import '../../../../helper/button.dart';
import '../../../../helper/common_nodatafound.dart';
import '../../../../helper/common_progress_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/keys.dart';
import '../../../../helper/common_add_widget.dart';
import '../widget/empolyee_type_table.dart';

class EmployeeTypeView extends GetView<EmployeeTypeViewModel> {
  const EmployeeTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            SizedBox(
              height: 40,
              width: 200,
              child: CustomTextField(
                suffixIcon: Icon(Icons.search),
                controller: controller.searchEmpolyeeTypeController,
                onChanged: (s) {
                  controller.searchEmployeeType(s);
                },
                hintText: 'Search',
              ),
            ),
            setWidth(width: 10),
            CustomButton(
              height: 40,
              width: 100,
              label: 'Add Type',
              onPress: () {
                Constant.customShowDialog(
                  content: Obx(
                    () => CommonAddWidget(
                      errorLabel: 'Enter Type',
                      isLoading: controller.isAddLoading.value,
                      controller: controller.newEmpolyeeTypeController,
                      headerLabel: 'Add Type',
                      labelHintText: 'Type',
                      submitOnPress: () {
                        if (commonAddWidgetKey.currentState!.validate()) {
                          controller.addEmployeeType(context);
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
                  : controller.employeeTypeeName.isEmpty
                  ? CommonNoDataFound(label: 'No employee type data found')
                  : EmployeeTypeTable(
                    editOnTap: (employeeType) {
                      controller.setData(employeeType: employeeType.name ?? "");
                      Constant.customShowDialog(
                        content: Obx(
                          () => CommonAddWidget(
                            errorLabel: 'Enter Type',
                            isLoading: controller.isAddLoading.value,
                            controller: controller.newEmpolyeeTypeController,
                            headerLabel: 'Add Type',
                            labelHintText: 'Type',
                            submitOnPress: () {
                              if (commonAddWidgetKey.currentState!.validate()) {
                                controller.updateEmployeeType(
                                  context: context,
                                  id: employeeType.id ?? '',
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
                    deleteOnTap: (employeeType) {
                      controller.deleteEmployeeType(
                        context: context,
                        id: employeeType.id ?? '',
                      );
                    },
                    columnNames: controller.columnName,
                    employeeType: controller.employeeTypeeName,
                  ),
        ),
      ],
    );
  }
}
