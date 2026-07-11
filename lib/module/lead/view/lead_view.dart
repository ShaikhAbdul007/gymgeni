import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/module/lead/viewmodel/lead_view_model.dart';
import 'package:gymgeni/module/lead_master/view/lead_master_view.dart';
import '../../../helper/common_body.dart';
import '../../../utils/constant.dart';
import '../../../utils/keys.dart';
import '../../responsive_layout/responsive_dimension/responsive_tempate.dart';
import '../widget/all_lead.dart';
import '../widget/create_new_lead.dart';
import '../../../utils/sizebox.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_style.dart';
import '../model/all_lead_model.dart';

class LeadView extends GetView<LeadViewModel> {
  const LeadView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(
      desktop: Desktop(controller: controller),
      tablet: Table(),
      mobile: Mobile(),
      scaffoldKey: leadScaffoldKey,
      endDrawer: CreateNewLead(controller: controller),
    );
  }
}

class Desktop extends StatelessWidget {
  final LeadViewModel controller;
  const Desktop({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CommonBody(
      tabBarChildren: [
        Obx(
          () => AllLead(
            columnNames: controller.columns,
            isDataLoading: controller.isAllLeaLoading.value || controller.isConvertLoading.value,
            leads: controller.allleadList,
            editOnTap: (lead) => controller.onEditLeadTap(lead),
            convertOnTap: (lead) => showConvertDialog(context, lead),
          ),
        ),
        // FollowUpType(),
        Obx(
          () => AllLead(
            columnNames: controller.columns,
            isDataLoading: controller.isAllLeaLoading.value || controller.isConvertLoading.value,
            leads: controller.allleadList,
            editOnTap: (lead) => controller.onEditLeadTap(lead),
            convertOnTap: (lead) => showConvertDialog(context, lead),
          ),
        ),
        LeadMasterView(),
      ],
      heading: 'Lead',
      subHeading: 'Manage all your leads in one place',
      buttonLabel: 'Add Lead',
      buttonOnPress: () {
        Constant.customPrintLog('lead new ');
        controller.onCreateNewLeadTap();
      },
      tabs: controller.tabs,
      tabController: controller.tabController,
    );
  }

  void showConvertDialog(BuildContext context, Leads lead) {
    final joiningDateController = TextEditingController(text: DateTime.now().toString().split(' ').first);
    final amountController = TextEditingController();
    final discountController = TextEditingController();
    final balanceDateController = TextEditingController();
    String? selectedPaymentModeId = controller.paymentList.isNotEmpty ? controller.paymentList.first.id : null;

    Constant.customShowDialog(
      context: context,
      content: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Convert Lead to Member',
                style: customNunito(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              setHeight(height: 15),
              Text(
                'Convert: ${lead.name}',
                style: customNunito(fontSize: 14),
              ),
              setHeight(height: 10),
              // Joining Date Picker
              InkWell(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) {
                    setState(() {
                      joiningDateController.text = date.toString().split(' ').first;
                    });
                  }
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: joiningDateController,
                    decoration: const InputDecoration(
                      labelText: 'Joining Date',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              setHeight(height: 10),
              // Payment Mode Dropdown
              DropdownButtonFormField<String>(
                value: selectedPaymentModeId,
                items: controller.paymentList.map((m) {
                  return DropdownMenuItem<String>(
                    value: m.id,
                    child: Text(m.name ?? ''),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    selectedPaymentModeId = val;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Payment Mode',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
              ),
              setHeight(height: 10),
              // Amount Paid
              TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Amount Paid',
                  border: OutlineInputBorder(),
                ),
              ),
              setHeight(height: 10),
              // Discount
              TextFormField(
                controller: discountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Discount (%)',
                  border: OutlineInputBorder(),
                ),
              ),
              setHeight(height: 10),
              // Balance Date Picker
              InkWell(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now().add(const Duration(days: 30)),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) {
                    setState(() {
                      balanceDateController.text = date.toString().split(' ').first;
                    });
                  }
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: balanceDateController,
                    decoration: const InputDecoration(
                      labelText: 'Balance Pending Date',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              setHeight(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text('Cancel', style: customNunito(color: Colors.red)),
                  ),
                  setWidth(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      final body = {
                        "lead_id": lead.id,
                        "mobile_number": lead.mobile,
                        "email": lead.email,
                        "joining_date": joiningDateController.text,
                        "amount": int.tryParse(amountController.text) ?? 0,
                        "discount": int.tryParse(discountController.text) ?? 0,
                        "gender": lead.gender,
                        "age": 30,
                        "address": lead.address,
                        "payment_mode": selectedPaymentModeId,
                        "balance_date": balanceDateController.text.isNotEmpty ? balanceDateController.text : null,
                      };
                      Get.back();
                      controller.convertLeadToMember(body);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.blackColor),
                    child: Text('Convert', style: customNunito(color: Colors.white)),
                  ),
                ],
              )
            ],
          );
        }
      ),
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Tablet extends StatelessWidget {
  const Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
