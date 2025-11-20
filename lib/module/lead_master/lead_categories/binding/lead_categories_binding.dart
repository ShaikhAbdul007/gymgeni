import 'package:get/get.dart';
import 'package:gymgeni/module/lead_master/lead_categories/view_model/lead_categories_view_model.dart';

class LeadCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeadCategoriesViewModel());
  }
}
