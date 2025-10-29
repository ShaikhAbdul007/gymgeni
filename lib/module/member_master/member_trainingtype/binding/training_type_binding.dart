import 'package:get/get.dart';

import '../view_model/training_type_viewmodel.dart';

class TrainingTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrainingTypeViewmodel());
  }
}
