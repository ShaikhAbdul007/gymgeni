import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymgeni/helper/common_body.dart';
import 'package:gymgeni/module/employee/widget/employee_attendance.dart';

import '../../../utils/keys.dart';
import '../../employee_master/view/employee_master_view.dart';
import '../../responsive_layout/responsive_dimension/responsive_tempate.dart';
import '../viewmodel/employee_viewmodel.dart';
import '../widget/all_employee.dart';
import '../widget/create_new_employee.dart';

class EmployeeView extends GetView<EmployeeViewmodel> {
  const EmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(
      desktop: Desktop(controller: controller),
      tablet: Table(),
      mobile: Mobile(),
      scaffoldKey: employeeScaffoldKey,
      endDrawer: CreateNewEmployee(controller: controller),
    );
  }
}

class Desktop extends StatelessWidget {
  final EmployeeViewmodel controller;
  const Desktop({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CommonBody(
      tabBarChildren: [
        Obx(
          () => AllEmployee(
            columnNames: controller.employeeColumns,
            employees: controller.employeeList,
            isDataLoading: controller.isEmployeeLoading.value,
          ),
        ),
        EmployeeAttendance(
          columnNames: controller.employeeAttendanceColumns,
          employees: controller.employeeAttendanceList,
          isDataLoading: controller.isEmployeeAttendanceLoading.value,
        ),
        EmployeeMasterView(),
      ],
      heading: 'Employees',
      subHeading: 'Manage all your employees in one place',
      buttonLabel: 'Add Employe',
      buttonOnPress: () {
        print('employee Pressed');
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
