import 'package:get/get.dart';

import '../view_model/finance_payment_view_model.dart';

class FinanceMasterPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FinanceMasterPaymentViewModel());
  }
}
