import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/button.dart';
import '../../../helper/common_progress_bar.dart';
import '../../../helper/svg_assetes.dart';
import '../../../utils/colors.dart';
import '../../../utils/divider.dart';
import '../../../utils/keys.dart';
import '../../../utils/sizebox.dart';
import '../../../utils/text_style.dart';
import '../../member/widget/new_enqire_text_component.dart';
import '../viewmodel/lead_view_model.dart';

class CreateNewLead extends StatelessWidget {
  final LeadViewModel controller;
  const CreateNewLead({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: commonAddWidgetKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: [
          setHeight(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Create New Lead', style: customNunito(fontSize: 16)),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: CustomNetworkOrAssetImage(
                  svgAssets: 'assets/cancel.png',
                  height: 10,
                ),
              ),
            ],
          ),
          setHeight(height: 15),
          customDivider(isParameterGiven: true, indent: 0, endIndent: 0),
          setHeight(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 55,
                backgroundColor: AppColors.blackColor,
                child: Image.asset(
                  "assets/admin.png",
                  fit: BoxFit.contain,
                  height: 80,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      NewEnquireComponent(
                        textController: controller.firstname,
                        label: 'First Name',
                        labelHintText: 'Enter first name',
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return "Enter first name";
                          }
                          return null;
                        },
                      ),
                      setWidth(width: 25),
                      NewEnquireComponent(
                        textController: controller.lastname,
                        label: 'Last Name',
                        labelHintText: 'Enter last name',
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return "Enter last name";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  setHeight(height: 10),
                  Row(
                    children: [
                      NewEnquireComponentWithDropDown(
                        hintText: 'Gender',
                        width: 200,
                        label: 'Gender',
                        error: 'Enter gender',
                        listItems: controller.genderList,
                        notifyParent: (value) {
                          controller.selectedGender.text = value;
                        },
                      ),
                      setWidth(width: 25),
                      NewEnquireComponent(
                        filteringTextInputFormatterRequired: true,
                        maxInputLength: 10,
                        keyboardType: TextInputType.number,
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return "Enter mobile number";
                          } else if (v.length != 10) {
                            return "Mobile number must be 10 digits";
                          }
                          return null;
                        },
                        textController: controller.contactNo,
                        label: 'Mobile Number',
                        labelHintText: 'Enter mobile number',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          setHeight(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NewEnquireComponent(
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return "Enter email address";
                  } else if (!v.contains("@")) {
                    return "Enter valid email eg:abd@gmail.com";
                  }
                  return null;
                },
                textController: controller.email,
                label: 'Email Address',
                labelHintText: 'Enter email address',
              ),
              Obx(
                () =>
                    controller.isdataLoading.value
                        ? CommonProgressBar(
                          circularProgressColor: AppColors.blackColor,
                        )
                        : NewEnquireComponentWithDropDown(
                          hintText: 'Plan',
                          error: 'Enter plan',
                          isModelDropDownRequired: true,
                          width: 200,
                          label: 'plan',
                          listItems: controller.planList,
                          notifyParent: (value) {
                            controller.planListId.text = value;
                          },
                        ),
              ),
              Obx(
                () =>
                    controller.isdataLoading.value
                        ? CommonProgressBar(
                          circularProgressColor: AppColors.blackColor,
                        )
                        : NewEnquireComponentWithDropDown(
                          hintText: 'Status',
                          error: 'Enter status',
                          isModelDropDownRequired: true,
                          width: 200,
                          label: 'Status',
                          listItems: controller.statusList,
                          notifyParent: (value) {
                            controller.statusListId.text = value;
                          },
                        ),
              ),
            ],
          ),
          setHeight(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () =>
                    controller.isdataLoading.value
                        ? CommonProgressBar(
                          circularProgressColor: AppColors.blackColor,
                        )
                        : NewEnquireComponentWithDropDown(
                          hintText: 'Categorie',
                          error: 'Select categorie',
                          isModelDropDownRequired: true,
                          width: 200,
                          label: 'Categorie',
                          listItems: controller.categoryList,
                          notifyParent: (value) {
                            controller.categorieListId.text = value;
                          },
                        ),
              ),
              Obx(
                () =>
                    controller.isdataLoading.value
                        ? CommonProgressBar(
                          circularProgressColor: AppColors.blackColor,
                        )
                        : NewEnquireComponentWithDropDown(
                          hintText: 'Follow Up',
                          error: 'Enter follow up',
                          isModelDropDownRequired: true,
                          width: 200,
                          label: 'Follow Up',
                          listItems: controller.followUpTypeList,
                          notifyParent: (value) {
                            controller.followUpListId.text = value;
                          },
                        ),
              ),
              Obx(
                () =>
                    controller.isdataLoading.value
                        ? CommonProgressBar(
                          circularProgressColor: AppColors.blackColor,
                        )
                        : NewEnquireComponentWithDropDown(
                          hintText: 'Source',
                          error: 'Enter source',
                          isModelDropDownRequired: true,
                          width: 200,
                          label: 'Source',
                          listItems: controller.sourceList,
                          notifyParent: (value) {
                            controller.sourceListId.text = value;
                          },
                        ),
              ),
            ],
          ),
          setHeight(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NewEnquireComponent(
                readOnly: true,
                isDatePicker: true,
                textController: controller.expectedDate,
                label: 'Expected Date',
                labelHintText: 'Expected Date',
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return "Select expected date";
                  }
                  return null;
                },
                width: 200,
              ),
              Container(width: 200),
              Container(width: 200),
            ],
          ),
          setHeight(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: NewEnquireComponent(
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return "Enter description";
                }
                return null;
              },
              minLines: 3,
              maxLines: 3,
              textController: controller.description,
              label: 'Description',
              labelHintText: 'Enter description',
            ),
          ),
          setHeight(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: NewEnquireComponent(
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return "Enter address";
                }
                return null;
              },
              minLines: 3,
              maxLines: 3,
              textController: controller.address,
              label: 'Address',
              labelHintText: 'Enter full address',
            ),
          ),
          setHeight(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => CustomButton(
                  isLoading: controller.isCreateNewLead.value,
                  height: 35,
                  width: 130,
                  color: AppColors.darkBackground,
                  label: 'Submit',
                  onPress: () {
                    if (commonAddWidgetKey.currentState!.validate()) {
                      String name =
                          '${controller.firstname.text.trim()}${controller.lastname.text.trim()}';
                      Map body = {
                        "name": name,
                        "plan": controller.planListId.text.trim(),
                        "expected_date": controller.expectedDate.text.trim(),
                        "gender": controller.selectedGender.text.trim(),
                        "mobile": controller.contactNo.text.trim(),
                        "email": controller.email.text.trim(),
                        "leadsource_id": controller.sourceListId.text.trim(),
                        "leadstatus_id": controller.statusListId.text.trim(),
                        "leadcategory_id":
                            controller.categorieListId.text.trim(),
                        "leadfollowtype_id":
                            controller.followUpListId.text.trim(),
                        "address": controller.address.text.trim(),
                        "description": controller.description.text.trim(),
                      };
                      controller.submitNewLead(body);
                    }
                  },
                ),
              ),
              setWidth(width: 15),
              CustomButtonWithOutBackGroudColor(
                height: 35,
                width: 130,
                label: 'Cancel',
                onPress: () => Get.back(),
              ),
            ],
          ),
          setHeight(height: 20),
        ],
      ),
    );
  }
}
