import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/constant.dart';
import '../../controllers/home_controller.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: controller.promotions.length,
          options: CarouselOptions(
            height: 150,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            enlargeCenterPage: false,
            autoPlay: true,
            onPageChanged: (index, reason) {
              controller.currentBannerIndex.value = index;
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final promotion = controller.promotions[index];
            return GestureDetector(
              onLongPress: () {
                Get.dialog(
                  Dialog(
                    backgroundColor: Colors.transparent,
                    child: InteractiveViewer(
                      minScale: 0.5,
                      maxScale: 4.0,
                      child: Image.asset(
                        promotion.imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    promotion.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
        10.s,
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.promotions.length,
              (index) => Container(
                width: 30,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: controller.currentBannerIndex.value == index
                      ? GColors.primary
                      : Colors.grey.shade300,
                ),
              ),
            ),
          ),
        ),
        5.s,
      ],
    );
  }
}
