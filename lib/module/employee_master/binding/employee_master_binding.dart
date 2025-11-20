import 'package:get/get.dart';

import '../view_model/employee_master_view_model.dart';

class EmployeeMasterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmployeeMasterViewModel());
  }
}
