import 'package:get/get.dart';
import 'package:gymgeni/module/finance/binding/finance_binding.dart';
import '../module/drawer/view/drawer_view.dart';
import '../module/dashboard/binding/dashboard_binding.dart';
import '../module/employee/binding/employee_binding.dart';
import '../module/employee/view/employee_view.dart';
import '../module/lead/binding/lead_binding.dart';
import '../module/lead/view/lead_view.dart';
import '../module/login/views/loginscreen_view.dart';
import '../module/member/binding/member_bindings.dart';
import '../module/member_master/member_group/binding/group_binding.dart';
import '../module/member_master/view/membermasterdesktop.dart';
import '../module/reports/view/report_view.dart';
import '../module/signups/binding/signup_binding.dart';
import '../module/signups/view/signup_screen.dart';
import '../module/drawer/binding/drawer_binding.dart';
import '../module/dashboard/view/dashboard_view.dart';
import '../module/login/bindings/loginscreen_binding.dart';
import '../module/member_master/binding/member_master_bindings.dart';
import '../module/member/view/members_view.dart';
import '../module/finance/view/finance_view.dart';
import '../module/member_master/member_goal/binding/goal_binding.dart';
import '../module/member_master/member_plan/binding/plans_binding.dart';
import '../module/member_master/member_trainingtype/binding/training_type_binding.dart';
import '../module/member_master/member_triaingmode/binding/training_mode_binding.dart';
import 'routes_middleware.dart';
import 'routes_path.dart';

class AppRoutes {
  AppRoutes._();

  static const initial = RoutesPaths.loginView;

  static final routes = [
    GetPage(
      name: RoutesPaths.dashboardView,
      participatesInRootNavigator: true,
      page: () => DashboardView(),
      middlewares: [RoutesMiddleware()],
      bindings: [DashboardBinding(), DrawerBinding()],
    ),
    GetPage(
      name: RoutesPaths.memberView,
      page: () => const MembersView(),
      middlewares: [RoutesMiddleware()],
      bindings: [
        MemberBindings(),
        MemberMasterBinding(),
        GoalBinding(),
        GroupBinding(),
        PlansBinding(),
        TrainingModeBinding(),
        TrainingTypeBinding(),
      ],
    ),
    GetPage(
      name: RoutesPaths.financeView,
      middlewares: [RoutesMiddleware()],
      binding: FinanceBinding(),
      page: () => const FinanceView(),
    ),
    GetPage(
      name: RoutesPaths.customDrawerView,
      page: () => const CustomDrawer(),
      binding: DrawerBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: RoutesPaths.leadView,
      page: () => const LeadView(),
      binding: LeadBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: RoutesPaths.reportView,
      middlewares: [RoutesMiddleware()],
      page: () => const ReportView(),
    ),
    GetPage(
      name: RoutesPaths.employeeView,
      middlewares: [RoutesMiddleware()],
      page: () => const EmployeeView(),
      binding: EmployeeBinding(),
    ),
    GetPage(
      name: RoutesPaths.loginView,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesPaths.signUpView,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: RoutesPaths.memberMasterView,
      middlewares: [RoutesMiddleware()],
      page: () => const MemberMasterDesktop(),
      binding: MemberMasterBinding(),
    ),
  ];
}
