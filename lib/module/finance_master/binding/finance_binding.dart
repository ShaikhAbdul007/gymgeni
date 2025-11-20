import 'package:get/get.dart';
import 'package:gymgeni/module/finance_master/view_model/finance_view_model.dart';

class FinanceMasterinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FinanceMasterViewModel());
  }
}
