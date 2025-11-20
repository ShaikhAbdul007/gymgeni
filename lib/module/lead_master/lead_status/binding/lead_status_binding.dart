import 'package:get/get.dart';
import 'package:gymgeni/module/lead_master/lead_status/view_model/lead_status_view_model.dart';

class LeadStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeadStatusViewModel());
  }
}
