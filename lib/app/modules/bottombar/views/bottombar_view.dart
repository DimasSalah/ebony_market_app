import 'package:ebony_market_app/app/core/constant/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../events/views/events_view.dart';
import '../../feeds/views/feeds_view.dart';
import '../../home/views/home_view.dart';
import '../../notification/views/notification_view.dart';
import '../controllers/bottombar_controller.dart';

class BottombarView extends GetView<BottombarController> {
  const BottombarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.tabController,
        children: [
          HomeView(),
          FeedsView(),
          NotificationView(),
          EventsView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: GColors.primary,
        elevation: 1,
        shape: CircleBorder(),
        onPressed: () {
          // Add your FAB action here
        },
        child: const Icon(Icons.add, color: GColors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
          shape:
              AutomaticNotchedShape(RoundedRectangleBorder(), StadiumBorder()),
          height: kBottomNavigationBarHeight + 10,
          color: Colors.white,
          elevation: 0,
          notchMargin: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTabItem(
                icon: HeroIcons.home,
                index: 0,
                isSelected: controller.currentIndex.value == 0,
                title: 'Home',
              ),
              _buildTabItem(
                icon: HeroIcons.rectangleStack,
                index: 1,
                isSelected: controller.currentIndex.value == 1,
                title: 'Feeds',
              ),
              _buildTabItem(
                icon: HeroIcons.bell,
                index: 2,
                isSelected: controller.currentIndex.value == 2,
                title: 'Notification',
              ),
              _buildTabItem(
                icon: HeroIcons.calendarDays,
                index: 3,
                isSelected: controller.currentIndex.value == 3,
                title: 'Evens',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required HeroIcons icon,
    required int index,
    required bool isSelected,
    required String title,
  }) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: isSelected
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  color: GColors.primary,
                )
              : null,
          child: GestureDetector(
            onTap: () => controller.selectMenu(index),
            child: HeroIcon(
              icon,
              color: isSelected ? Colors.white : Colors.grey,
              style: HeroIconStyle.solid,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 10,
            color: isSelected ? GColors.primary : Colors.grey,
          ),
        ),
      ],
    );
  }
}
