import 'package:get/get.dart';

abstract class RoutesPaths {
  RoutesPaths._();

  static const dashboardView = '/dashboardView';
  static const memberView = '/memberView';
  static const financeView = '/financeView';
  static const customDrawerView = '/customDrawerView';
  static const leadView = '/leadView';
  static const loginView = '/loginView';
  static const signUpView = '/signUpView';
  static const reportView = '/reportView';
  static const unknownRouteView = '/unknownRouteView';
  static const employeeView = '/employeeView';
  static const memberMasterView = '/memberMasterView';

  static navigateToRoute({required String routeName, dynamic data}) {
    switch (routeName) {
      case loginView:
        Get.rootDelegate.offNamed(loginView);
        break;
      case signUpView:
        Get.rootDelegate.toNamed(signUpView);
        break;
      case memberView:
        Get.toNamed(memberView);
        break;
      case reportView:
        Get.toNamed(reportView);
        break;
      case financeView:
        Get.toNamed(financeView);
        break;
      case dashboardView:
        Get.rootDelegate.offNamed(dashboardView);
        break;
      case leadView:
        Get.toNamed(leadView);
        break;
      default:
        Get.offNamed(unknownRouteView);
    }
  }
}
