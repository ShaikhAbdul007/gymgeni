import 'package:get/get.dart';
import 'package:gymgeni/module/dashboard/view_model/dashboard_view_model.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardViewModel());
  }
}
