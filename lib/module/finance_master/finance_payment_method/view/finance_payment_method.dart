import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/helper/textfield.dart';
import 'package:gymgeni/utils/sizebox.dart';
import '../../../../helper/button.dart';
import '../../../../helper/common_nodatafound.dart';
import '../../../../helper/common_progress_bar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/keys.dart';
import '../../../../helper/common_add_widget.dart';
import '../../widget/finance_master_payment_type.dart';
import '../view_model/finance_payment_view_model.dart';

class FinancePaymentMethod extends GetView<FinanceMasterPaymentViewModel> {
  const FinancePaymentMethod({super.key});

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
                onChanged: (s) {},
                hintText: 'Search',
              ),
            ),
            setWidth(width: 10),
            CustomButton(
              height: 40,
              width: 100,
              label: 'Add New',
              onPress: () {
                Constant.customShowDialog(
                  content: Obx(
                    () => CommonAddWidget(
                      errorLabel: 'Enter payment',
                      isLoading: controller.isAddLoading.value,
                      controller: controller.newPaymentTypeController,
                      headerLabel: 'Add New',
                      labelHintText: 'Payment',
                      submitOnPress: () {
                        if (commonAddWidgetKey.currentState!.validate()) {
                          controller.addFinancePaymentData(context);
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
                  : controller.paymentList.isEmpty
                  ? CommonNoDataFound(label: 'No payment method found')
                  : FinanceMasterPaymentType(
                    editOnTap: (employeeType) {
                      controller.setData(employeeType: employeeType.name ?? "");
                      Constant.customShowDialog(
                        content: Obx(
                          () => CommonAddWidget(
                            errorLabel: 'Enter Type',
                            isLoading: controller.isAddLoading.value,
                            controller: controller.newPaymentTypeController,
                            headerLabel: 'Add Type',
                            labelHintText: 'Type',
                            submitOnPress: () {
                              if (commonAddWidgetKey.currentState!.validate()) {
                                controller.updateFinancePaymentData(
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
                      controller.deleteFinancePaymentData(
                        context: context,
                        id: employeeType.id ?? '',
                      );
                    },
                    columnNames: controller.columnName,
                    paymentList: controller.paymentList,
                  ),
        ),
      ],
    );
  }
}
