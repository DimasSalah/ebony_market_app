import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:ebony_market_app/app/core/utils/widgets/textfields/input_primary.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import '../../../core/constant/constant.dart';
import '../controllers/home_controller.dart';
import 'components/home_app_bar.dart';
import 'components/home_carousel.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeAppBar(),
            10.s,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  HomeCarousel(),
                  10.s,
                  InputPrimary(
                    hint: 'Search here',
                    suffixIcon: HeroIcon(
                      HeroIcons.magnifyingGlass,
                      color: GColors.primary,
                    ),
                  ),
                  10.s,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HeroIcon(
                        HeroIcons.squares2x2,
                        color: GColors.primary,
                      ),
                      10.s,
                      Text(
                        'Categories',
                        style: Poppins.medium.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'See All',
                        style: Poppins.regular.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  20.s,
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: GColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: HeroIcon(
                            controller.categories.values.toList()[index],
                            color: GColors.primary,
                          ),
                        ),
                        5.s,
                        Text(
                          controller.categories.keys.toList()[index],
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
