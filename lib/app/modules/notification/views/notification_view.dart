import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../core/constant/constant.dart';
import '../controllers/notification_controller.dart';
import '../models/notification_model.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GColors.backgroundColor,
        title: Text(
          'Notifications',
          style: Poppins.semiBold.copyWith(fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Handle mark all as read
              controller.markAllAsRead();
            },
            icon: HeroIcon(
              HeroIcons.checkCircle,
              color: GColors.primary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today',
                style: Poppins.semiBold.copyWith(
                  fontSize: Tz.medium,
                  color: GColors.textSecondary,
                ),
              ),
              10.s,
              // Today's Notifications
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.todayNotifications.length,
                itemBuilder: (context, index) {
                  final notification = controller.todayNotifications[index];
                  return _buildNotificationItem(notification);
                },
              ),
              20.s,
              Text(
                'This Week',
                style: Poppins.semiBold.copyWith(
                  fontSize: Tz.medium,
                  color: GColors.textSecondary,
                ),
              ),
              10.s,
              // This Week's Notifications
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.weekNotifications.length,
                itemBuilder: (context, index) {
                  final notification = controller.weekNotifications[index];
                  return _buildNotificationItem(notification);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem(NotificationModel notification) {
    return Obx(() => Container(
          margin: EdgeInsets.only(bottom: 12),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: notification.isRead.value
                ? Colors.white
                : GColors.primary.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: GColors.borderSecondary,
              width: 1,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Avatar or Icon
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _getNotificationColor(notification.type),
                ),
                child: Center(
                  child: HeroIcon(
                    _getNotificationIcon(notification.type),
                    color: Colors.white,
                  ),
                ),
              ),
              12.s,
              // Notification Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            style: Poppins.semiBold.copyWith(
                              fontSize: Tz.medium,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          notification.time,
                          style: Poppins.regular.copyWith(
                            fontSize: Tz.small,
                            color: GColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    5.s,
                    Text(
                      notification.message,
                      style: Poppins.regular.copyWith(
                        fontSize: Tz.small,
                        color: GColors.textSecondary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (notification.type == NotificationType.event)
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: GColors.primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'View Event',
                                style: Poppins.medium.copyWith(
                                  fontSize: Tz.small,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Color _getNotificationColor(NotificationType type) {
    switch (type) {
      case NotificationType.like:
        return Colors.red;
      case NotificationType.comment:
        return Colors.blue;
      case NotificationType.event:
        return Colors.orange;
      case NotificationType.follow:
        return Colors.purple;
      default:
        return GColors.primary;
    }
  }

  HeroIcons _getNotificationIcon(NotificationType type) {
    switch (type) {
      case NotificationType.like:
        return HeroIcons.heart;
      case NotificationType.comment:
        return HeroIcons.chatBubbleOvalLeft;
      case NotificationType.event:
        return HeroIcons.calendar;
      case NotificationType.follow:
        return HeroIcons.userPlus;
      default:
        return HeroIcons.bell;
    }
  }
}
