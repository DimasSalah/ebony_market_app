import 'package:get/get.dart';

import '../controllers/business_list_controller.dart';

class BusinessListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusinessListController>(
      () => BusinessListController(),
    );
  }
}
