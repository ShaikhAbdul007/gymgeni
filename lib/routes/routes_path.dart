import 'package:get/get.dart';

abstract class RoutesPaths {
  RoutesPaths._();
  static const home = '/home';
  static const onBoard = '/onboard';
  static const customDrawer = '/customdrawer';
  static const splashScreen = '/splashscreen';
  static const loginScreen = '/loginscreen';
  static const registrationScreen = '/registrationscreen';
  static const forgotPasswordScreen = '/forgotpasswordscreen';
  static const otpScreen = '/otp-screen';
  static const dashBoardScreen = '/dashBoardScreen';
  static const workoutScreen = '/workoutScreen';
  static const reportScreen = '/reportScreen';
  static const memberScreen = '/memberScreen';
  static const paymentScreen = '/paymentScreen';
  static const mainScreen = '/mainScreen';
  static const manageplanview = '/manageplanview';
  static const signupScreen = '/signupScreen';
  static const attendenceScreen = '/attendenceScreen';
  static const staffAttendenceScreen = '/staffAttendenceScreen';
  static const allStaffScreen = '/allStaffScreen';
  static const inActiveMemberScreen = '/inActiveMemberScreen';
  static const activeMemberScreen = '/activeMemberScreen';
  static const allLeadScreen = '/allLeadScreen';
  static const leadFollowHistoryScreen = '/leadFollowHistoryScreen';
  static const leadMasterScreen = '/leadMasterScreen';
  static const freezeMemberScreen = '/freezeMemberScreen';
  static const paymentMasterScreen = '/paymentMasterScreen';
  static const saleScreen = '/saleScreen';
  static const memberMaster = '/memberMaster';
  static const unknownRoute = '/unknownRoute';

  static navigateToRoute({required String routeName, dynamic data}) {
    switch (routeName) {
      case loginScreen:
        Get.offAllNamed(loginScreen);
        break;
      case otpScreen:
        Get.toNamed(otpScreen);
        break;
      case registrationScreen:
        Get.toNamed(registrationScreen);
        break;
      case forgotPasswordScreen:
        Get.toNamed(forgotPasswordScreen);
        break;
      case dashBoardScreen:
        Get.toNamed(dashBoardScreen);
        break;
      case memberScreen:
        Get.toNamed(memberScreen);
        break;
      case reportScreen:
        Get.toNamed(reportScreen);
        break;
      case workoutScreen:
        Get.toNamed(workoutScreen);
        break;
      case paymentScreen:
        Get.toNamed(paymentScreen);
        break;
      case mainScreen:
        Get.offAllNamed(mainScreen);
        break;
      case manageplanview:
        Get.toNamed(manageplanview);
        break;
      case signupScreen:
        Get.toNamed(signupScreen);
        break;
      case memberMaster:
        Get.rootDelegate.toNamed(memberMaster);
        break;
      case attendenceScreen:
        Get.toNamed(attendenceScreen);
        break;
      case staffAttendenceScreen:
        Get.toNamed(staffAttendenceScreen);
        break;
      // case staffManageScreen:
      //   Get.toNamed(staffManageScreen);
      //   break;
      case leadFollowHistoryScreen:
        Get.toNamed(leadFollowHistoryScreen);
        break;
      case leadMasterScreen:
        Get.toNamed(leadMasterScreen);
        break;
      case freezeMemberScreen:
        Get.toNamed(freezeMemberScreen);
        break;
      case paymentMasterScreen:
        Get.toNamed(paymentMasterScreen);
        break;
      case saleScreen:
        Get.toNamed(saleScreen);
        break;
      default:
        Get.offNamed(unknownRoute);
    }
  }
}
