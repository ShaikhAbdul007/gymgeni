import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/helper/common_appbar_with_cancelbutton.dart';
import 'package:gymgeni/utils/constant.dart';
import 'package:gymgeni/utils/keys.dart';
import '../../../helper/button.dart';
import '../../../utils/colors.dart';
import '../../../utils/divider.dart';
import '../../../utils/sizebox.dart';
import '../../../utils/text_style.dart';
import '../view_model/member_view_model.dart';
import 'new_enqire_text_component.dart';

class CreateNewMember extends StatelessWidget {
  final MemberViewModel controller;
  const CreateNewMember({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: creatMemberKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          setHeight(height: 20),
          CommonAppbarWithCancelbutton(
            headerLabel: 'New Member',
            cancelOnPress: () {
              Get.back();
            },
          ),

          setHeight(height: 15),
          customDivider(isParameterGiven: true, endIndent: 0, indent: 0),
          setHeight(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.blackColor,
                    radius: 55,
                    child: Icon(
                      Icons.person,
                      size: 90,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  setHeight(height: 10),
                  InkWell(
                    onTap: () {
                      //controller.pickImage();
                      Constant.customShowDialog(
                        context: context,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CommonAppbarWithCancelbutton(
                              headerLabel: 'Select Option',
                              cancelOnPress: () {
                                Get.back();
                              },
                            ),
                            Row(
                              children: [
                                CustomButton(
                                  height: 30,
                                  width: 100,
                                  label: 'Camera',
                                  onPress: () {},
                                ),
                                CustomButton(
                                  height: 30,
                                  width: 100,
                                  label: 'File',
                                  onPress: () {
                                    //  controller.pickImage();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      'Upload Image',
                      style: customNunito(color: AppColors.blueColor),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NewEnquireComponent(
                        textController: controller.firstname,
                        label: 'First Name',
                        labelHintText: 'First name',
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
                        labelHintText: 'Last name',
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
                      NewEnquireComponent(
                        textController: controller.mobileNumber,
                        filteringTextInputFormatterRequired: true,
                        keyboardType: TextInputType.number,
                        maxInputLength: 10,
                        label: 'Mobile Number',
                        labelHintText: 'Mobile number',
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return "Enter mobile number";
                          } else if (v.length != 10) {
                            return "Mobile number must be 10 digits";
                          }
                          return null;
                        },
                      ),
                      setWidth(width: 25),
                      NewEnquireComponent(
                        textController: controller.alternateNumber,
                        filteringTextInputFormatterRequired: true,
                        keyboardType: TextInputType.number,
                        maxInputLength: 10,
                        label: 'Alternate Number',
                        labelHintText: 'Alternate number',
                        // validator: (v) {
                        //   if (v == null || v.trim().isEmpty) {
                        //     return "Enter alternate number";
                        //   } else if (v.length != 10) {
                        //     return "Alternate number must be 10 digits";
                        //   }
                        //   return null;
                        // },
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
                filteringTextInputFormatterRequired: true,
                keyboardType: TextInputType.number,
                maxInputLength: 3,
                textController: controller.age,
                label: 'Age',
                labelHintText: 'Enter age',
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return "Enter age";
                  }
                  return null;
                },
              ),
              NewEnquireComponent(
                textController: controller.email,
                label: 'Email Address',
                labelHintText: 'Enter email address',
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return "Enter email";
                  } else if (!v.contains("@")) {
                    return "Enter valid email eg: abc@gmail.com";
                  }
                  return null;
                },
              ),
              NewEnquireComponentWithDropDown(
                error: 'Select Gender',
                hintText: 'Gender',
                width: 200,
                label: 'Gender',
                listItems: controller.genderList,
                notifyParent: (gender) {
                  controller.genderController.text = gender;
                },
              ),
            ],
          ),
          setHeight(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NewEnquireComponentWithDropDown(
                isModelDropDownRequired: true,
                error: 'Select plan',
                hintText: 'Plan',
                width: 200,
                label: 'Plan',
                listItems: controller.planList,
                notifyParent: (value) {
                  controller.setPlanListAmount(value);
                },
              ),
              NewEnquireComponent(
                filteringTextInputFormatterRequired: true,
                readOnly: true,
                maxInputLength: 6,
                keyboardType: TextInputType.number,
                textController: controller.amount,
                label: 'Plan Amount',
                labelHintText: 'Plan amount',
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return "Enter plan amount";
                  }
                  return null;
                },
              ),
              NewEnquireComponentWithDropDown(
                isModelDropDownRequired: true,
                hintText: 'Goal',
                error: 'Select goal',
                width: 200,
                label: 'Goal',
                listItems: controller.goalList,
                notifyParent: (value) {
                  controller.goalListController.text = value;
                },
              ),
            ],
          ),
          setHeight(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NewEnquireComponent(
                textController: controller.discount,
                label: 'Discount %',
                labelHintText: 'Discount',
                onChanged: (discount) {
                  controller.discountValue();
                },
              ),
              NewEnquireComponent(
                readOnly: true,
                filteringTextInputFormatterRequired: true,
                maxInputLength: 6,
                keyboardType: TextInputType.number,
                textController: controller.afterdiscountAmount,
                label: 'Discount Amount',
                labelHintText: 'Discount Amount',
              ),
              NewEnquireComponent(
                filteringTextInputFormatterRequired: true,
                maxInputLength: 6,
                keyboardType: TextInputType.number,
                textController: controller.amountpaid,
                label: 'Amount',
                labelHintText: 'Amount',
                onChanged: (amount) {
                  if (controller.discount.text.isEmpty) {
                    final paid = int.tryParse(controller.amountpaid.text) ?? 0;
                    final total = int.tryParse(controller.amount.text) ?? 0;
                    final balance = total - paid;
                    controller.balanceAmount.text = balance.toStringAsFixed(0);
                  } else {
                    final paid =
                        double.tryParse(controller.amountpaid.text) ?? 0;
                    final total =
                        int.parse(controller.discount.text) > 0
                            ? double.tryParse(
                                  controller.afterdiscountAmount.text,
                                ) ??
                                0
                            : double.tryParse(controller.amount.text) ?? 0;
                    final balance = total - paid;
                    controller.balanceAmount.text = balance.toStringAsFixed(0);
                  }
                },
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return "Enter amount";
                  }
                  return null;
                },
              ),
            ],
          ),
          setHeight(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NewEnquireComponentWithDropDown(
                isModelDropDownRequired: true,
                hintText: 'Training Mode',
                error: 'Select training mode',
                width: 200,
                label: 'Training Mode',
                listItems: controller.trainingModeList,
                notifyParent: (value) {
                  controller.trainingModeListController.text = value;
                },
              ),
              NewEnquireComponentWithDropDown(
                isModelDropDownRequired: true,
                error: 'Select source',
                hintText: 'Source',
                width: 200,
                label: 'Source',
                listItems: controller.sourceList,
                notifyParent: (value) {
                  controller.source.text = value;
                },
              ),
              NewEnquireComponent(
                textController: controller.healthCondition,
                label: 'Health Condition',
                labelHintText: 'Health condition',
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return "Enter health condition";
                  }
                  return null;
                },
              ),
            ],
          ),
          setHeight(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NewEnquireComponentWithDropDown(
                isModelDropDownRequired: true,
                hintText: 'Group',
                error: 'Select group',
                width: 200,
                label: 'Group',
                listItems: controller.groupList,
                notifyParent: (value) {
                  controller.groupListController.text = value;
                },
              ),
              NewEnquireComponent(
                readOnly: true,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return "Enter joining date";
                  }
                  return null;
                },
                width: 200,
                isDatePicker: true,
                textController: controller.joiningDate,
                label: 'Joining Date',
                labelHintText: 'Joining date',
              ),
              NewEnquireComponentWithDropDown(
                isModelDropDownRequired: true,
                hintText: 'Payment Mode',
                error: 'Select payment mode',
                width: 200,
                label: 'Payment Mode',
                listItems: controller.paymentList,
                notifyParent: (value) {
                  controller.paymentModeListController.text = value;
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NewEnquireComponentWithDropDown(
                isModelDropDownRequired: true,
                hintText: 'Training Type',
                error: 'Select training Type',
                width: 200,
                label: 'Training Type',
                listItems: controller.trainingTypeList,
                notifyParent: (value) {
                  controller.trainingTypeListController.text = value;
                },
              ),
              Container(width: 200),
              SizedBox(
                width: 200,
                child: InkWell(
                  onTap: () {
                    controller.isBMRClick.value = !controller.isBMRClick.value;
                  },
                  child: Text(
                    textAlign: TextAlign.end,
                    'BMR & Body Metrics',
                    style: customNunito(
                      fontSize: 12,
                      color: AppColors.blueColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Obx(
            () => Visibility(
              visible: controller.isBMRClick.value,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    setHeight(height: 10),
                    customDivider(
                      isParameterGiven: true,
                      endIndent: 10,
                      indent: 10,
                      thickness: 0.5,
                      color: AppColors.blackColor,
                    ),
                    setHeight(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NewEnquireComponent(
                          textController: controller.weightController,
                          label: 'Weight',
                          labelHintText: 'Weight',
                          filteringTextInputFormatterRequired: true,
                          maxInputLength: 3,
                          // validator: (v) {
                          //   if (v == null || v.trim().isEmpty) {
                          //     return "Enter first name";
                          //   }
                          //   return null;
                          // },
                        ),
                        setWidth(width: 25),
                        NewEnquireComponent(
                          textController: controller.heightController,
                          filteringTextInputFormatterRequired: true,
                          maxInputLength: 3,
                          label: 'Height',
                          labelHintText: 'Height',
                          // validator: (v) {
                          //   if (v == null || v.trim().isEmpty) {
                          //     return "Enter last name";
                          //   }
                          //   return null;
                          // },
                        ),
                        setWidth(width: 25),
                        NewEnquireComponent(
                          textController: controller.professionController,
                          label: 'Profession',
                          labelHintText: 'Profession',
                          // validator: (v) {
                          //   if (v == null || v.trim().isEmpty) {
                          //     return "Enter last name";
                          //   }
                          //   return null;
                          // },
                        ),
                      ],
                    ),
                    setHeight(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NewEnquireComponent(
                          textController: controller.chestController,
                          label: 'Chest',
                          labelHintText: 'Chest',
                          filteringTextInputFormatterRequired: true,
                          maxInputLength: 3,
                          // validator: (v) {
                          //   if (v == null || v.trim().isEmpty) {
                          //     return "Enter first name";
                          //   }
                          //   return null;
                          // },
                        ),
                        setWidth(width: 25),
                        NewEnquireComponent(
                          textController: controller.hipsController,
                          label: 'Hips',
                          labelHintText: 'Hips',
                          filteringTextInputFormatterRequired: true,
                          maxInputLength: 3,
                          // validator: (v) {
                          //   if (v == null || v.trim().isEmpty) {
                          //     return "Enter last name";
                          //   }
                          //   return null;
                          // },
                        ),
                        setWidth(width: 25),
                        NewEnquireComponent(
                          textController: controller.stomachController,
                          label: 'Stomach',
                          labelHintText: 'Stomach',
                          filteringTextInputFormatterRequired: true,
                          maxInputLength: 3,
                          // validator: (v) {
                          //   if (v == null || v.trim().isEmpty) {
                          //     return "Enter last name";
                          //   }
                          //   return null;
                          // },
                        ),
                      ],
                    ),
                    setHeight(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NewEnquireComponent(
                          textController: controller.thighController,
                          label: 'Thigh',
                          labelHintText: 'Thigh',
                          filteringTextInputFormatterRequired: true,
                          maxInputLength: 3,
                          // validator: (v) {
                          //   if (v == null || v.trim().isEmpty) {
                          //     return "Enter last name";
                          //   }
                          //   return null;
                          // },
                        ),

                        setWidth(width: 25),
                        NewEnquireComponent(
                          textController: controller.bodyAgeController,
                          label: 'Body Age',
                          labelHintText: 'Body Age',
                          filteringTextInputFormatterRequired: true,
                          maxInputLength: 3,
                          // validator: (v) {
                          //   if (v == null || v.trim().isEmpty) {
                          //     return "Enter first name";
                          //   }
                          //   return null;
                          // },
                        ),
                        setWidth(width: 25),
                        NewEnquireComponent(
                          textController: controller.sitReachController,
                          label: 'Sit Reach',
                          labelHintText: 'Sit Reach',
                          // validator: (v) {
                          //   if (v == null || v.trim().isEmpty) {
                          //     return "Enter last name";
                          //   }
                          //   return null;
                          // },
                        ),
                      ],
                    ),
                    setHeight(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NewEnquireComponent(
                          textController: controller.breakfastController,
                          label: 'Break Fast',
                          labelHintText: 'Break Fast',
                          // validator: (v) {
                          //   if (v == null || v.trim().isEmpty) {
                          //     return "Enter last name";
                          //   }
                          //   return null;
                          // },
                        ),

                        setWidth(width: 25),
                        NewEnquireComponent(
                          textController: controller.lunchController,
                          label: 'Lunch',
                          labelHintText: 'Lunch',
                          // validator: (v) {
                          //   if (v == null || v.trim().isEmpty) {
                          //     return "Enter first name";
                          //   }
                          //   return null;
                          // },
                        ),
                        setWidth(width: 25),
                        NewEnquireComponent(
                          textController: controller.dinnerController,
                          label: 'Dinner',
                          labelHintText: 'Dinner',
                          // validator: (v) {
                          //   if (v == null || v.trim().isEmpty) {
                          //     return "Enter last name";
                          //   }
                          //   return null;
                          // },
                        ),
                      ],
                    ),
                    setHeight(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NewEnquireComponent(
                          textController: controller.pushUpStrengthController,
                          label: 'Push Up Stength',
                          labelHintText: 'Push Up Stength',
                          // validator: (v) {
                          //   if (v == null || v.trim().isEmpty) {
                          //     return "Enter last name";
                          //   }
                          //   return null;
                          // },
                        ),

                        setWidth(width: 25),
                        NewEnquireComponent(
                          textController: controller.curlUpController,
                          label: 'Curl Up',
                          labelHintText: 'Curl Up',
                          // validator: (v) {
                          //   if (v == null || v.trim().isEmpty) {
                          //     return "Enter first name";
                          //   }
                          //   return null;
                          // },
                        ),
                        setWidth(width: 25),
                        NewEnquireComponent(
                          textController: controller.mobilityController,
                          label: 'Mobility',
                          labelHintText: 'Mobility',
                          // validator: (v) {
                          //   if (v == null || v.trim().isEmpty) {
                          //     return "Enter last name";
                          //   }
                          //   return null;
                          // },
                        ),
                      ],
                    ),
                    setHeight(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NewEnquireComponent(
                          textController: controller.heartRateController,
                          label: 'Heart Rate',
                          labelHintText: 'Heart Rate',
                          // validator: (v) {
                          //   if (v == null || v.trim().isEmpty) {
                          //     return "Enter last name";
                          //   }
                          //   return null;
                          // },
                        ),

                        setWidth(width: 25),
                        NewEnquireComponent(
                          textController:
                              controller.heartRateTreadmillController,
                          label: 'Heart Rate Treadmill',
                          labelHintText: 'Heart Rate Treadmill',
                          // validator: (v) {
                          //   if (v == null || v.trim().isEmpty) {
                          //     return "Enter first name";
                          //   }
                          //   return null;
                          // },
                        ),
                        setWidth(width: 25),
                        Container(width: 200),
                      ],
                    ),
                    setHeight(height: 10),
                    customDivider(
                      isParameterGiven: true,
                      endIndent: 10,
                      indent: 10,
                      thickness: 0.5,
                      color: AppColors.blackColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          setHeight(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: NewEnquireComponent(
              minLines: 5,
              maxLines: 6,
              textController: controller.address,
              label: 'Address',
              labelHintText: 'Address',
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return "Enter address";
                }
                return null;
              },
            ),
          ),
          setHeight(height: 10),
          customDivider(
            isParameterGiven: true,
            endIndent: 10,
            indent: 10,
            thickness: 0.5,
            color: AppColors.blackColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 10, top: 10),
            child: Text('Balance Amount', style: customNunito(fontSize: 16)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NewEnquireComponent(
                readOnly: true,
                textController: controller.balanceAmount,
                label: 'Balance Amount',
                labelHintText: 'Enter balance amount',
              ),
              NewEnquireComponent(
                readOnly: true,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return "Enter pending date";
                  }
                  return null;
                },
                width: 200,
                isDatePicker: true,
                textController: controller.pendingDate,
                label: 'Pending Date',
                labelHintText: 'Enter pending date',
              ),
              Container(width: 200),
            ],
          ),
          setHeight(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                color: AppColors.darkBackground,
                height: 40,
                width: 120,
                label: 'Submit',
                onPress: () {
                  if (creatMemberKey.currentState!.validate()) {
                    var name = '${controller.firstname}${controller.lastname}';
                    var body = {
                      "name": name,
                      "gender": controller.genderController,
                      "mobile_number": controller.mobileNumber,
                      "alternate_mobile": controller.alternateNumber,
                      "email": controller.email,
                      "age": controller.age,
                      "plan_id": controller.planListController,
                      "training_mode_id": controller.trainingModeListController,
                      "training_type_id": controller.trainingTypeListController,
                      "goal_id": controller.goalListController,
                      "group_id": controller.groupListController,
                      "source_id": controller.source,
                      "joining_date": controller.joiningDate,
                      "healthCondition": controller.healthCondition,
                      "amount": controller.amountpaid,
                      "address": controller.address,
                      "balanceAmount": controller.balanceAmount,
                      "balance_date": controller.pendingDate,
                      "payment_mode": controller.paymentModeListController,
                      'image': '',
                      'discount': controller.discount,
                    };
                    Constant.customPrintLog(body);
                  }
                },
              ),
              setWidth(width: 10),
              CustomButtonWithOutBackGroudColor(
                height: 40,
                width: 120,
                label: 'Cancel',
                onPress: () {
                  Get.back();
                },
              ),
            ],
          ),
          setHeight(height: 20),
        ],
      ).paddingSymmetric(horizontal: 8),
    );
  }
}
