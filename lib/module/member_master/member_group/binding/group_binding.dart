import 'package:get/get.dart';

import '../view_model/group_viewmodel.dart';

class GroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GroupViewmodel());
  }
}
