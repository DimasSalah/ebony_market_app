import 'package:get/get.dart';

enum NotificationType { like, comment, event, follow }

class NotificationModel {
  final String title;
  final String message;
  final String time;
  final NotificationType type;
  final RxBool isRead;

  NotificationModel({
    required this.title,
    required this.message,
    required this.time,
    required this.type,
    bool isRead = false,
  }) : isRead = isRead.obs;
}
