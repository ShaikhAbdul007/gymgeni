import 'package:get/get.dart';
import 'package:gymgeni/module/drawer/view/drawer_view.dart';
import 'package:gymgeni/module/dashboard/binding/dashboard_binding.dart';

import '../module/drawer/binding/drawer_binding.dart';
import '../module/dashboard/view/dashboard_view.dart';
import '../module/member/view/members_view.dart';
import '../module/payment/view/payment_view.dart';
import 'routes_path.dart';

class AppRoutes {
  AppRoutes._();

  static const initial = RoutesPaths.mainScreen;

  static final routes = [
    GetPage(
      name: RoutesPaths.mainScreen,
      participatesInRootNavigator: true,
      page: () => DashboardView(),
      bindings: [DashboardBinding(), DrawerBinding()],
    ),

    GetPage(name: RoutesPaths.memberScreen, page: () => const MembersView()),
    GetPage(name: RoutesPaths.paymentScreen, page: () => const PaymentView()),
    GetPage(name: RoutesPaths.customDrawer, page: () => const CustomDrawer()),
  ];
}
