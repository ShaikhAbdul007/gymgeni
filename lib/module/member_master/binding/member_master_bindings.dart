import 'package:get/get.dart';
import 'package:gymgeni/module/member_master/view_model/member_master_viewmodel.dart';

class MemberMasterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MemberMasterViewModel());
  }
}
