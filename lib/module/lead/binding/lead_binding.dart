import 'package:get/get.dart';
import 'package:gymgeni/module/lead/viewmodel/lead_view_model.dart';

class LeadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeadViewModel());
  }
}
