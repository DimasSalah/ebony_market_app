import 'package:get/get.dart';

enum NotificationType { like, comment, event, follow, update, payment }

enum NotificationCategory { social, system }

class NotificationModel {
  final String title;
  final String message;
  final String time;
  final NotificationType type;
  final NotificationCategory category;
  final RxBool isRead;

  NotificationModel({
    required this.title,
    required this.message,
    required this.time,
    required this.type,
    required this.category,
    bool isRead = false,
  }) : isRead = isRead.obs;
}
