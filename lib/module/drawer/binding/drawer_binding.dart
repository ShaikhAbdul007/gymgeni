import 'package:get/get.dart';
import 'package:gymgeni/module/drawer/view_model/drawer_view_model.dart';

class DrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomDrawerController());
  }
}
