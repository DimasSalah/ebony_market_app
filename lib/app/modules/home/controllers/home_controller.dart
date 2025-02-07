import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:heroicons/heroicons.dart';

import '../../../core/utils/resources/resources.dart';

class HomeController extends GetxController {
  List<String> banners = [
    Images.banner1,
    Images.banner2,
  ];
  final carouselController = CarouselController();
  final currentBannerIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Map<String, HeroIcons> categories = {
    'Restaurants': HeroIcons.giftTop,
    'Retail': HeroIcons.shoppingCart,
    'Arts': HeroIcons.paintBrush,
    'Education': HeroIcons.academicCap,
    'Professional Services': HeroIcons.briefcase,
    'Health & Fitness': HeroIcons.faceSmile,
    'Fashion Brands': HeroIcons.shoppingBag,
    'Beuty, Barbers & Spas': HeroIcons.scissors,
    'Real Estate': HeroIcons.buildingOffice,
    'Legal Services': HeroIcons.scale,
    'Entertainment': HeroIcons.film,
    'Financial Services': HeroIcons.banknotes,
    'Community Groups': HeroIcons.buildingOffice,
    'Labors & Trade Services': HeroIcons.userGroup,
    'IT & Tech Services': HeroIcons.computerDesktop,
    'Car & Automotive': HeroIcons.truck,
  };
}
