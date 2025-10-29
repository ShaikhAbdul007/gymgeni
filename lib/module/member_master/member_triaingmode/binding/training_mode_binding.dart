import 'package:get/get.dart';

import '../view_model/training_mode_view_model.dart';

class TrainingModeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrainingModeViewModel());
  }
}
