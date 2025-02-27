import 'package:get/get.dart';

import '../models/notification_model.dart';

class NotificationController extends GetxController {
  //TODO: Implement NotificationController

  final count = 0.obs;
  final RxList<NotificationModel> todayNotifications =
      <NotificationModel>[].obs;
  final RxList<NotificationModel> weekNotifications = <NotificationModel>[].obs;

  // Social Notifications
  final RxList<NotificationModel> todaySocialNotifications =
      <NotificationModel>[].obs;
  final RxList<NotificationModel> weekSocialNotifications =
      <NotificationModel>[].obs;

  // System Notifications
  final RxList<NotificationModel> todaySystemNotifications =
      <NotificationModel>[].obs;
  final RxList<NotificationModel> weekSystemNotifications =
      <NotificationModel>[].obs;

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
          category: NotificationCategory.social),
      NotificationModel(
          title: 'New Comment',
          message: 'Jane Smith commented on your post: "Great photo!"',
          time: '15m ago',
          type: NotificationType.comment,
          category: NotificationCategory.social),
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
          category: NotificationCategory.social),
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
          category: NotificationCategory.social),
      NotificationModel(
          title: 'New Like',
          message: 'John Doe liked your post',
          time: '2m ago',
          type: NotificationType.like,
          isRead: true,
          category: NotificationCategory.social),
    ]);

    // Add dummy social notifications
    todaySocialNotifications.addAll([
      NotificationModel(
        title: 'New Like',
        message: 'John Doe liked your post',
        time: '2m ago',
        type: NotificationType.like,
        category: NotificationCategory.social,
      ),
      NotificationModel(
        title: 'New Comment',
        message: 'Jane Smith commented on your post: "Great photo!"',
        time: '15m ago',
        type: NotificationType.comment,
        category: NotificationCategory.social,
      ),
    ]);

    weekSocialNotifications.addAll([
      NotificationModel(
          title: 'New Like',
          message: 'John Doe liked your post',
          time: '2day ago',
          type: NotificationType.like,
          category: NotificationCategory.social,
          isRead: true),
    ]);

    // Add dummy system notifications
    todaySystemNotifications.addAll([
      NotificationModel(
        title: 'App Update Available',
        message: 'A new version of the app is available. Update now!',
        time: '1h ago',
        type: NotificationType.update,
        category: NotificationCategory.system,
      ),
      NotificationModel(
        title: 'Coupon Gift',
        message: 'You get a coupon reward after registration',
        time: '3h ago',
        type: NotificationType.payment,
        category: NotificationCategory.system,
      ),
    ]);

    weekSystemNotifications.addAll([
      NotificationModel(
        title: 'Security Alert',
        message: 'Your password was changed successfully',
        time: '5d ago',
        type: NotificationType.update,
        category: NotificationCategory.system,
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
    todaySocialNotifications.clear();
    weekSocialNotifications.clear();
    todaySystemNotifications.clear();
    weekSystemNotifications.clear();
    super.onClose();
  }

  void increment() => count.value++;

  void markAllAsRead() {
    for (var notification in [
      ...todayNotifications,
      ...weekNotifications,
      ...todaySocialNotifications,
      ...weekSocialNotifications,
      ...todaySystemNotifications,
      ...weekSystemNotifications,
    ]) {
      notification.isRead.value = true;
    }
  }
}
