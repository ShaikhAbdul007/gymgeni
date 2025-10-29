import 'package:get/get.dart';

import '../view_model/plan_viewmodel.dart';

class PlansBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlanViewmodel());
  }
}
