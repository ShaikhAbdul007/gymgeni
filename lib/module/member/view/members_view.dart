import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gymgeni/module/member/widget/create_new_member.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/responsive_tempate.dart';
import '../../../helper/button.dart';
import '../../../utils/colors.dart';
import '../../../utils/sizebox.dart';
import '../../../utils/text_style.dart';
import '../model/members_model.dart';
import '../view_model/member_view_model.dart';

class MembersView extends GetView<MemberViewModel> {
  const MembersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(
      desktop: MemberDesktop(controller: controller),
      tablet: Table(),
      mobile: Mobile(),
      scaffoldKey: controller.scaffoldKey,
      endDrawer: CreateNewMember(controller: controller),
    );
  }
}

class MemberDesktop extends StatelessWidget {
  final MemberViewModel controller;
  const MemberDesktop({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Members',
                    style: customPoppin(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Manage all your members in one place',
                    style: customMontserrat(color: AppColors.greyLightColor),
                  ),
                ],
              ),
              CustomButton(
                height: 40,
                width: 120,
                label: 'Add Member',
                style: customMontserrat(color: AppColors.whiteColor),
                color: AppColors.blackColor,
                onPress: () {
                  print('tapped');
                  controller.openDrawer();
                },
              ),
            ],
          ),
        ),

        TabBar(
          controller: controller.tabController,
          isScrollable: true,
          labelColor: AppColors.whiteColor,
          unselectedLabelColor: AppColors.blackColor,
          labelStyle: customPoppin(fontWeight: FontWeight.w400),
          unselectedLabelStyle: customPoppin(fontWeight: FontWeight.w400),
          indicator: BoxDecoration(
            shape: BoxShape.rectangle,
            color:
                AppColors
                    .greyLighterShadeColor, // soft background for active tab
            borderRadius: BorderRadius.circular(4), // rounded corners
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorAnimation: TabIndicatorAnimation.linear,
          indicatorPadding: EdgeInsetsGeometry.all(5),
          padding: EdgeInsets.only(top: 5, bottom: 10),
          tabs: [
            Tab(child: Text('All')),
            Tab(child: Text('Active')),
            Tab(child: Text('Inactive')),
            Tab(child: Text('Pending')),
            Tab(child: Text('Freezed')),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: controller.tabController,
            children: [
              MemberDataTable(
                columnNames: controller.columnNames,
                members: controller.members,
              ),
              MemberDataTable(
                columnNames: controller.columnNames,
                members: controller.members,
              ),
              MemberDataTable(
                columnNames: controller.columnNames,
                members: controller.members,
              ),
              MemberDataTable(
                columnNames: controller.columnNames,
                members: controller.members,
              ),
              MemberDataTable(
                columnNames: controller.columnNames,
                members: controller.members,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('member Mobile');
  }
}

class Tablet extends StatelessWidget {
  const Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('member Tablet');
  }
}

class MemberDataTable extends StatelessWidget {
  final List<String> columnNames;
  final List<Member> members;
  const MemberDataTable({
    super.key,
    required this.columnNames,
    required this.members,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DataTable(
          dataRowMinHeight: 8,
          dataRowMaxHeight: 60,
          columnSpacing: 10,
          headingRowColor: WidgetStateColor.resolveWith(
            (states) => AppColors.whiteColor,
          ),
          columns:
              columnNames.map((columnName) {
                return DataColumn(
                  label: Text(
                    columnName,
                    style: customPoppin(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList(),
          rows:
              members.map((member) {
                return DataRow(
                  cells: [
                    DataCell(
                      ListTile(
                        leading: Container(
                          width: 90,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              member.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        title: Text(
                          member.name,
                          style: customNunito(fontSize: 15),
                        ),
                        subtitle: Text(
                          member.subtitle,
                          style: customNunito(fontSize: 13),
                        ),
                      ),
                    ),
                    DataCell(
                      Text(member.plan, style: customNunito(fontSize: 12)),
                    ),
                    DataCell(
                      Text(member.amount, style: customNunito(fontSize: 12)),
                    ),
                    DataCell(
                      Text(
                        member.balanceAmount,
                        style: customNunito(fontSize: 12),
                      ),
                    ),
                    DataCell(
                      Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color:
                              member.status == 'Active'
                                  ? Colors.green.shade300
                                  : member.status == 'Pending'
                                  ? Colors.yellow
                                  : member.status == 'Inactive'
                                  ? Colors.red.shade400
                                  : Colors.grey.shade100,
                        ),
                        child: Center(
                          child: Text(
                            member.status,
                            style: customNunito(fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Text(member.date, style: customNunito(fontSize: 12)),
                    ),
                    DataCell(
                      Text(
                        member.rejectDate,
                        style: customNunito(fontSize: 12),
                      ),
                    ),
                    DataCell(
                      Row(
                        children: [
                          Image.asset(
                            'assets/editicon.png',
                            height: 50,
                            width: 20,
                          ),
                          SizedBox(width: 8),
                          Image.asset(
                            'assets/deleteicon.png',
                            height: 50,
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}

class TabletMemberDataTable extends StatelessWidget {
  final List<String> columnNames;
  final List<Member> members;
  const TabletMemberDataTable({
    super.key,
    required this.columnNames,
    required this.members,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width, // Full width
        child: DataTable(
          dataRowMinHeight: 5,
          dataRowMaxHeight: 80,
          columnSpacing: 10,
          headingRowColor: WidgetStateColor.resolveWith(
            (states) => Colors.blue.shade50,
          ),
          columns:
              columnNames.map((columnName) {
                return DataColumn(
                  label: Text(
                    columnName,
                    style: customPoppin(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList(),
          rows:
              members.map((member) {
                return DataRow(
                  cells: [
                    DataCell(
                      ListTile(
                        minTileHeight: 10,
                        leading: Image.asset(
                          member.image,
                          height: 50,
                          width: 20,
                        ),
                        title: Text(
                          member.name,
                          style: customNunito(fontSize: 15),
                        ),
                        subtitle: Text(
                          member.subtitle,
                          style: customNunito(fontSize: 13),
                        ),
                      ),
                    ),
                    DataCell(
                      Text(member.plan, style: customNunito(fontSize: 12)),
                    ),
                    DataCell(
                      Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color:
                              member.status == 'Active'
                                  ? Colors.green.shade300
                                  : member.status == 'Pending'
                                  ? Colors.yellow
                                  : member.status == 'Inactive'
                                  ? Colors.grey.shade100
                                  : Colors.red.shade400,
                        ),
                        child: Center(
                          child: Text(
                            member.status,
                            style: customNunito(fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Text(member.date, style: customNunito(fontSize: 12)),
                    ),
                    DataCell(
                      Text(
                        member.rejectDate,
                        style: customNunito(fontSize: 12),
                      ),
                    ),
                    DataCell(
                      Row(
                        children: [
                          Image.asset(
                            'assets/editicon.png',
                            height: 50,
                            width: 20,
                          ),
                          SizedBox(width: 8),
                          Image.asset(
                            'assets/deleteicon.png',
                            height: 50,
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}

class MobileMemberDataTable extends StatelessWidget {
  final List<String> columnNames;
  final List<Member> members;
  const MobileMemberDataTable({
    super.key,
    required this.columnNames,
    required this.members,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity, // Full width
        child: ListView.builder(
          itemCount: members.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final member = members[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: Image.asset(member.image, fit: BoxFit.cover),
                    ),
                  ),
                  setWidth(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        member.name,
                        style: customNunito(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Plan: ${member.plan}",
                        style: customNunito(fontSize: 14),
                      ),
                      setHeight(height: 5),
                      RichText(
                        text: TextSpan(
                          text: 'Status : ',
                          style: customNunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: member.status,
                              style: customNunito(
                                fontSize: 16,
                                color:
                                    member.status == 'Active'
                                        ? Colors.green.shade300
                                        : member.status == 'Pending'
                                        ? Colors.yellow
                                        : member.status == 'Freezed'
                                        ? AppColors.greyLighterShadeColor
                                        : member.status == 'Inactive'
                                        ? Colors.grey.shade300
                                        : Colors.red.shade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      setHeight(height: 5),
                      Text(
                        "Date: ${member.date}",
                        style: customNunito(fontSize: 13),
                      ),
                    ],
                  ),
                  setWidth(width: 100),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/editicon.png', height: 50, width: 20),
                      Image.asset(
                        'assets/deleteicon.png',
                        height: 50,
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
