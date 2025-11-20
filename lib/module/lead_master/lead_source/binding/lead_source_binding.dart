import 'package:get/get.dart';
import 'package:gymgeni/module/lead_master/lead_source/view_model/lead_source_view_model.dart';

class LeadSourceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeadSourceViewModel());
  }
}
