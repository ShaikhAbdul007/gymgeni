import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gymgeni/helper/common_body.dart';
import 'package:gymgeni/module/member/widget/active_member.dart';
import 'package:gymgeni/module/member/widget/all_member.dart';
import 'package:gymgeni/module/member/widget/create_new_member.dart';
import 'package:gymgeni/module/member/widget/freezed_member.dart';
import 'package:gymgeni/module/member/widget/inactive_member.dart';
import 'package:gymgeni/module/member/widget/pending_member.dart';
import 'package:gymgeni/module/member_master/view/member_master_view.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/responsive_tempate.dart';
import '../../../utils/keys.dart';
import '../view_model/member_view_model.dart';

class MembersView extends GetView<MemberViewModel> {
  const MembersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(
      desktop: MemberDesktop(controller: controller),
      tablet: Table(),
      mobile: Mobile(),
      scaffoldKey: memberScaffoldKey,
      endDrawer: CreateNewMember(controller: controller),
    );
  }
}

class MemberDesktop extends StatelessWidget {
  final MemberViewModel controller;
  const MemberDesktop({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CommonBody(
      tabBarChildren: [
        Obx(
          () => AllMemberWidget(
            isDataLoading: controller.isMembersLoading.value,
            columnNames: controller.columnNames,
            members: controller.getMember,
          ),
        ),
        Obx(
          () => ActiveMemberWidget(
            isDataLoading: controller.isMembersLoading.value,
            columnNames: controller.columnNames,
            members: controller.getMember,
          ),
        ),
        Obx(
          () => InactiveMemberWidget(
            isDataLoading: controller.isMembersLoading.value,
            columnNames: controller.columnNames,
            members: controller.getMember,
          ),
        ),
        Obx(
          () => PendingMemberWidget(
            isDataLoading: controller.isMembersLoading.value,
            columnNames: controller.columnNames,
            members: controller.getMember,
          ),
        ),
        Obx(
          () => FreezedMemberWidget(
            isDataLoading: controller.isMembersLoading.value,
            columnNames: controller.columnNames,
            members: controller.getMember,
          ),
        ),
        Obx(
          () => FreezedMemberWidget(
            isDataLoading: controller.isMembersLoading.value,
            columnNames: controller.columnNames,
            members: controller.getMember,
          ),
        ),
        MemberMasterView(),
      ],
      heading: 'Members',
      subHeading: 'Manage all your members in one place',
      buttonLabel: 'Add Member',
      buttonOnPress: () {
        print('tapped');
        controller.openDrawer();
      },
      tabs: controller.tabs,
      tabController: controller.tabController,
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

// class TabletMemberDataTable extends StatelessWidget {
//   final List<String> columnNames;
//   final List<Member> members;
//   const TabletMemberDataTable({
//     super.key,
//     required this.columnNames,
//     required this.members,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       child: SizedBox(
//         width: MediaQuery.of(context).size.width, // Full width
//         child: DataTable(
//           dataRowMinHeight: 5,
//           dataRowMaxHeight: 80,
//           columnSpacing: 10,
//           headingRowColor: WidgetStateColor.resolveWith(
//             (states) => Colors.blue.shade50,
//           ),
//           columns:
//               columnNames.map((columnName) {
//                 return DataColumn(
//                   label: Text(
//                     columnName,
//                     style: customPoppin(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 14,
//                     ),
//                   ),
//                 );
//               }).toList(),
//           rows:
//               members.map((member) {
//                 return DataRow(
//                   cells: [
//                     DataCell(
//                       ListTile(
//                         minTileHeight: 10,
//                         leading: Image.asset(
//                           member.image,
//                           height: 50,
//                           width: 20,
//                         ),
//                         title: Text(
//                           member.name,
//                           style: customNunito(fontSize: 15),
//                         ),
//                         subtitle: Text(
//                           member.subtitle,
//                           style: customNunito(fontSize: 13),
//                         ),
//                       ),
//                     ),
//                     DataCell(
//                       Text(member.plan, style: customNunito(fontSize: 12)),
//                     ),
//                     DataCell(
//                       Container(
//                         height: 40,
//                         width: 90,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           color:
//                               member.status == 'Active'
//                                   ? Colors.green.shade300
//                                   : member.status == 'Pending'
//                                   ? Colors.yellow
//                                   : member.status == 'Inactive'
//                                   ? Colors.grey.shade100
//                                   : Colors.red.shade400,
//                         ),
//                         child: Center(
//                           child: Text(
//                             member.status,
//                             style: customNunito(fontSize: 10),
//                           ),
//                         ),
//                       ),
//                     ),
//                     DataCell(
//                       Text(member.date, style: customNunito(fontSize: 12)),
//                     ),
//                     DataCell(
//                       Text(
//                         member.rejectDate,
//                         style: customNunito(fontSize: 12),
//                       ),
//                     ),
//                     DataCell(
//                       Row(
//                         children: [
//                           Image.asset(
//                             'assets/editicon.png',
//                             height: 50,
//                             width: 20,
//                           ),
//                           SizedBox(width: 8),
//                           Image.asset(
//                             'assets/deleteicon.png',
//                             height: 50,
//                             width: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               }).toList(),
//         ),
//       ),
//     );
//   }
// }

// class MobileMemberDataTable extends StatelessWidget {
//   final List<String> columnNames;
//   final List<Member> members;
//   const MobileMemberDataTable({
//     super.key,
//     required this.columnNames,
//     required this.members,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       child: SizedBox(
//         width: double.infinity, // Full width
//         child: ListView.builder(
//           itemCount: members.length,
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemBuilder: (context, index) {
//             final member = members[index];
//             return Card(
//               margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//               elevation: 3,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 90,
//                     height: 100,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10),
//                         bottomLeft: Radius.circular(10),
//                       ),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10),
//                         bottomLeft: Radius.circular(10),
//                       ),
//                       child: Image.asset(member.image, fit: BoxFit.cover),
//                     ),
//                   ),
//                   setWidth(width: 10),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         member.name,
//                         style: customNunito(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "Plan: ${member.plan}",
//                         style: customNunito(fontSize: 14),
//                       ),
//                       setHeight(height: 5),
//                       RichText(
//                         text: TextSpan(
//                           text: 'Status : ',
//                           style: customNunito(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           children: [
//                             TextSpan(
//                               text: member.status,
//                               style: customNunito(
//                                 fontSize: 16,
//                                 color:
//                                     member.status == 'Active'
//                                         ? Colors.green.shade300
//                                         : member.status == 'Pending'
//                                         ? Colors.yellow
//                                         : member.status == 'Freezed'
//                                         ? AppColors.greyLighterShadeColor
//                                         : member.status == 'Inactive'
//                                         ? Colors.grey.shade300
//                                         : Colors.red.shade400,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       setHeight(height: 5),
//                       Text(
//                         "Date: ${member.date}",
//                         style: customNunito(fontSize: 13),
//                       ),
//                     ],
//                   ),
//                   setWidth(width: 100),
//                   Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Image.asset('assets/editicon.png', height: 50, width: 20),
//                       Image.asset(
//                         'assets/deleteicon.png',
//                         height: 50,
//                         width: 20,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
