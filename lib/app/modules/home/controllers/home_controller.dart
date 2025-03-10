import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import '../data/models/category_model.dart';
import '../data/models/promotion_model.dart';

import '../../../core/utils/resources/resources.dart';

class HomeController extends GetxController {
  List<String> banners = [
    Images.banner1,
    Images.banner2,
  ];
  final carouselController = CarouselController();
  final currentBannerIndex = 0.obs;

  final categories = <Category>[].obs;
  RxList<Promotion> promotions = <Promotion>[].obs;

  Map<String, String> categoryIcons = {
    'Restaurants': Images.banner1,
    'Retail': Images.banner2,
  };

  @override
  void onInit() {
    super.onInit();
    loadCategories();
    loadPromotions();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadCategories() async {
    try {
      categories.value = Category.fetchAllCategories();
      update(['categories']);
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

// load promotions banner
  Future<void> loadPromotions() async {
    try {
      promotions.value = getDummyPromotions();
      update(['promotions']);
    } catch (e) {
      print('Error loading promotions: $e');
    }
  }

  List<Promotion> getDummyPromotions() {
    return [
      Promotion(
       imageUrl:  Images.banner1,
     ),
     Promotion(
       imageUrl: Images.banner2,
     ),
   ];
 }

 ////////////////////////////

  HeroIcons getCategoryIcon(String categoryName) {
    final Map<String, HeroIcons> categoryIcons = {
      'Restaurants': HeroIcons.giftTop,
      'Retail': HeroIcons.shoppingCart,
      'Arts': HeroIcons.paintBrush,
      'Education': HeroIcons.academicCap,
      'Professional Services': HeroIcons.briefcase,
      'Health & Fitness': HeroIcons.faceSmile,
      'Fashion Brands': HeroIcons.shoppingBag,
      'Beauty, Barbers & Spas': HeroIcons.scissors,
      'Real Estate': HeroIcons.buildingOffice,
      'Legal Services': HeroIcons.scale,
      'Entertainment': HeroIcons.film,
      'Financial Services': HeroIcons.banknotes,
      'Community Groups': HeroIcons.buildingOffice,
      'Labours & Trade Services': HeroIcons.userGroup,
      'IT & Tech Services': HeroIcons.computerDesktop,
      'Cars & Automotives': HeroIcons.truck,
    };
    return categoryIcons[categoryName] ?? HeroIcons.buildingStorefront;
  }
}
