import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:heroicons/heroicons.dart';
import 'package:flutter/services.dart';
import '../data/models/category_model.dart';

import '../../../core/utils/resources/resources.dart';

class HomeController extends GetxController {
  List<String> banners = [
    Images.banner1,
    Images.banner2,
  ];
  final carouselController = CarouselController();
  final currentBannerIndex = 0.obs;

  final categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadCategories() async {
    try {
      final String response = await rootBundle
          .loadString('assets/json/business_categories_model.json');
      final Map<String, dynamic> data = await json.decode(response);

      categories.value =
          data.entries.map((entry) => CategoryModel.fromJson(entry)).toList();
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

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
      'Labors & Trade Services': HeroIcons.userGroup,
      'IT & Tech Services': HeroIcons.computerDesktop,
      'Car & Automotive': HeroIcons.truck,
    };
    return categoryIcons[categoryName] ?? HeroIcons.buildingStorefront;
  }
}
