import 'package:get/get.dart';
import 'package:gymgeni/module/finance/viewmodel/finance_viewmodel.dart';

class FinanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FinanceViewmodel());
  }
}
