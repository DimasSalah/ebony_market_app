import 'package:get/get.dart';

import '../../events/controllers/events_controller.dart';
import '../../feeds/controllers/feeds_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../notification/controllers/notification_controller.dart';
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
    Get.lazyPut<FeedsController>(
      () => FeedsController(),
    );
    Get.lazyPut<EventsController>(
      () => EventsController(),
    );
    Get.lazyPut<NotificationController>(
      () => NotificationController(),
    );
  }
}
