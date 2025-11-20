import 'package:get/get.dart';
import 'package:gymgeni/module/lead_master/view_model/lead_master_view_model.dart';

class LeadMasterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeadMasterViewModel());
  }
}
