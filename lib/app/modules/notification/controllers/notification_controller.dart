import 'package:get/get.dart';

import '../models/notification_model.dart';

class NotificationController extends GetxController {
  //TODO: Implement NotificationController

  final count = 0.obs;
  final RxList<NotificationModel> todayNotifications =
      <NotificationModel>[].obs;
  final RxList<NotificationModel> weekNotifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Add dummy data
    todayNotifications.addAll([
      NotificationModel(
        title: 'New Like',
        message: 'John Doe liked your post',
        time: '2m ago',
        type: NotificationType.like,
      ),
      NotificationModel(
        title: 'New Comment',
        message: 'Jane Smith commented on your post: "Great photo!"',
        time: '15m ago',
        type: NotificationType.comment,
      ),
      // NotificationModel(
      //   title: 'Upcoming Event',
      //   message: 'Don\'t miss the Coldplay Concert tomorrow!',
      //   time: '1h ago',
      //   type: NotificationType.event,
      // ),
    ]);

    weekNotifications.addAll([
      NotificationModel(
        title: 'New Comment',
        message: 'Jane Smith commented on your post: "Great photo!"',
        time: '15m ago',
        type: NotificationType.comment,
        isRead: true,
      ),
      // NotificationModel(
      //   title: 'Event Reminder',
      //   message: 'The art exhibition starts in 3 days',
      //   time: '3d ago',
      //   type: NotificationType.event,
      //   isRead: true,
      // ),
      NotificationModel(
        title: 'New Like',
        message: 'John Doe liked your post',
        time: '2m ago',
        type: NotificationType.like,
        isRead: true,
      ),
      NotificationModel(
        title: 'New Like',
        message: 'John Doe liked your post',
        time: '2m ago',
        type: NotificationType.like,
        isRead: true,
      ),
    ]);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void markAllAsRead() {
    for (var notification in [...todayNotifications, ...weekNotifications]) {
      notification.isRead.value = true;
    }
  }
}
