import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottombarController extends GetxController {
  //TODO: Implement BottombarController

  final count = 0.obs;
  final currentIndex = 0.obs;
  PageController tabController = PageController();

  void selectMenu(int index) {
    currentIndex.value = index;
    if (tabController.hasClients) {
      tabController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    tabController = PageController();
  }


  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

}
