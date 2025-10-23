import 'package:get/get.dart';
import 'package:gymgeni/module/drawer/view/drawer_view.dart';
import 'package:gymgeni/module/dashboard/binding/dashboard_binding.dart';
import 'package:gymgeni/module/employee/view/employee_view.dart';
import 'package:gymgeni/module/lead/view/lead_view.dart';
import 'package:gymgeni/module/login/views/loginscreen_view.dart';
import 'package:gymgeni/module/member/binding/member_bindings.dart';
import 'package:gymgeni/module/reports/view/report_view.dart';

import '../module/drawer/binding/drawer_binding.dart';
import '../module/dashboard/view/dashboard_view.dart';
import '../module/login/bindings/loginscreen_binding.dart';
import '../module/member/view/members_view.dart';
import '../module/finance/view/finance_view.dart';
import 'routes_path.dart';

class AppRoutes {
  AppRoutes._();

  static const initial = RoutesPaths.loginView;

  static final routes = [
    GetPage(
      name: RoutesPaths.dashboardView,
      participatesInRootNavigator: true,
      page: () => DashboardView(),
      bindings: [DashboardBinding(), DrawerBinding()],
    ),

    GetPage(
      name: RoutesPaths.memberView,
      page: () => const MembersView(),
      binding: MemberBindings(),
    ),
    GetPage(name: RoutesPaths.financeView, page: () => const FinanceView()),
    GetPage(
      name: RoutesPaths.customDrawerView,
      page: () => const CustomDrawer(),
      binding: DrawerBinding(),
    ),
    GetPage(name: RoutesPaths.leadView, page: () => const LeadView()),
    GetPage(name: RoutesPaths.reportView, page: () => const ReportView()),
    GetPage(name: RoutesPaths.employeeView, page: () => const EmployeeView()),
    GetPage(
      name: RoutesPaths.loginView,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
