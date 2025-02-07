import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/bottombar_controller.dart';

class BottombarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottombarController>(
      () => BottombarController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
