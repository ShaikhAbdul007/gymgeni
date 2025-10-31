import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helper/button.dart';
import '../../../helper/svg_assetes.dart';
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
    return ListView(
      shrinkWrap: true,
      children: [
        setHeight(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('New Member', style: customNunito(fontSize: 16)),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: CustomImageAssets(
                svgAssets: 'assets/cancel.png',
                height: 10,
              ),
            ),
          ],
        ),
        setHeight(height: 15),
        customDivider(isParameterGiven: true, endIndent: 0, indent: 0),
        setHeight(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.blackColor,
              radius: 55,
              child: Image.asset(
                'assets/admin.png',
                fit: BoxFit.contain,
                height: 80,
              ),
            ),
            setWidth(width: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NewEnquireComponent(
                      textController: controller.firstname,
                      label: 'Name',
                      labelHintText: 'Enter first name',
                    ),
                    setWidth(width: 25),
                    NewEnquireComponentWithDropDown(
                      width: 200,
                      label: 'Plan',
                      listItems: controller.planList,
                      notifyParent: (value) {},
                    ),
                  ],
                ),
                setHeight(height: 10),
                Row(
                  children: [
                    NewEnquireComponentWithDropDown(
                      width: 200,
                      label: 'Gender',
                      listItems: controller.genderList,
                      notifyParent: (value) {},
                    ),
                    setWidth(width: 25),
                    NewEnquireComponent(
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
              textController: controller.age,
              label: 'Age',
              labelHintText: 'Enter age',
            ),
            NewEnquireComponent(
              width: 200,
              isDatePicker: true,
              textController: controller.dob,
              label: 'Date',
              labelHintText: 'Enter date',
            ),
            NewEnquireComponent(
              textController: controller.email,
              label: 'Amount',
              labelHintText: 'Enter amount',
            ),
          ],
        ),
        setHeight(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NewEnquireComponent(
              textController: controller.email,
              label: 'Email Address',
              labelHintText: 'Enter email address',
            ),
            NewEnquireComponent(
              textController: controller.contactNo,
              label: 'Mobile Number',
              labelHintText: 'Enter mobile number',
            ),
            NewEnquireComponentWithDropDown(
              width: 200,
              label: 'Goal',
              listItems: controller.goalList,
              notifyParent: (value) {},
            ),
          ],
        ),
        setHeight(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NewEnquireComponentWithDropDown(
              width: 200,
              label: 'Traing Mode',
              listItems: controller.trainingTypeList,
              notifyParent: (value) {},
            ),
            NewEnquireComponentWithDropDown(
              width: 200,
              label: 'Source',
              listItems: controller.trainingTypeList,
              notifyParent: (value) {},
            ),
            NewEnquireComponent(
              textController: controller.healthCondition,
              label: 'Health Condition',
              labelHintText: 'Enter health condition',
            ),
          ],
        ),
        setHeight(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: NewEnquireComponent(
            minLines: 5,
            maxLines: 6,
            textController: controller.address,
            label: 'Address',
            labelHintText: 'Enter Address',
          ),
        ),
        setHeight(height: 5),
        customDivider(isParameterGiven: true, endIndent: 10, indent: 5),
        setHeight(height: 5),
        Text('Balance Amount', style: customNunito(fontSize: 16)),
        setHeight(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NewEnquireComponent(
              textController: controller.healthCondition,
              label: 'Balance Amount',
              labelHintText: 'Enter balance amount',
            ),
            NewEnquireComponent(
              width: 200,
              isDatePicker: true,
              textController: controller.dob,
              label: 'Date',
              labelHintText: 'Enter date',
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
              height: 50,
              width: 120,
              label: 'Submit',
              onPress: () {
                Get.back();
              },
            ),
            setWidth(width: 10),
            CustomButton(
              height: 50,
              width: 120,
              label: 'Cancel',
              onPress: () {
                Get.back();
              },
            ),
          ],
        ),
      ],
    ).paddingSymmetric(horizontal: 8);
  }
}
