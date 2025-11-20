import 'package:get/get.dart';
import 'package:gymgeni/module/lead_master/lead_follow_type/view_model/lead_follow_type_view_model.dart';

class LeadFollowTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeadFollowTypeViewModel());
  }
}
