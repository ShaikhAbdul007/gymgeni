import 'package:get/get.dart';
import 'package:gymgeni/module/employee/viewmodel/employee_viewmodel.dart';

class EmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmployeeViewmodel());
  }
}
