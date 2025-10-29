import 'package:get/get.dart';

import '../view_model/goal_viewmodel.dart';

class GoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoalViewmodel());
  }
}
