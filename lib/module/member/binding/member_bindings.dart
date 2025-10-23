import 'package:get/get.dart';

import '../view_model/member_view_model.dart';

class MemberBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MemberViewModel());
  }
}
