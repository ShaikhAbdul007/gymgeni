import 'package:get/get.dart';
import 'package:gymgeni/module/employee_master/employee_master_type/view_model/employee_type_view_model.dart';

class EmployeeTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmployeeTypeViewModel());
  }
}
