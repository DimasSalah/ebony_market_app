import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/constant.dart';
import '../data/models/business_model.dart';

class BusinessListController extends GetxController {
  final isLoading = true.obs;
  final businesses = <Business>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadBusinesses();
  }

  void loadBusinesses() async {
    try {
      isLoading.value = true;

      // Simulate API call delay
      await Future.delayed(Duration(seconds: 1));

      // Get category and subcategory from arguments
      final category = Get.arguments['category'] as String;
      final subCategory = Get.arguments['subCategory'] as String;
      final subCategoryId = Get.arguments['subCategoryId'] as String? ?? '';

      // Create dummy data using the new Business model
      businesses.value = List.generate(
        10,
        (index) => Business(
          id: 'business-$index',
          name: 'Business ${index + 1}',
          description:
              'This is a great business offering quality products and services to our customers. We pride ourselves on excellent customer service.',
          address: '123 Main St, City, State',
          email: 'business${index + 1}@example.com',
          image: 'https://picsum.photos/seed/business$index/800/400',
          logo:
              'https://ui-avatars.com/api/?name=Business+${index + 1}&background=random',
          subCategoryId: subCategoryId,
          phone: '+1 234 567 8900',
          hours: {
            'Monday': {'open': '9:00 AM', 'close': '5:00 PM'},
            'Tuesday': {'open': '9:00 AM', 'close': '5:00 PM'},
            'Wednesday': {'open': '9:00 AM', 'close': '5:00 PM'},
            'Thursday': {'open': '9:00 AM', 'close': '5:00 PM'},
            'Friday': {'open': '9:00 AM', 'close': '5:00 PM'},
            'Saturday': {'open': '10:00 AM', 'close': '3:00 PM'},
            'Sunday': {'open': 'Closed', 'close': 'Closed'},
          },
          ownerName: 'John Doe',
          isApproved: true,
          images: List.generate(
            5,
            (imgIndex) =>
                'https://picsum.photos/seed/business$index-$imgIndex/800/600',
          ),
          videos: [],
          uploaderId: 'dummy-user-id',
          website: 'https://example.com',
          facebook: 'https://facebook.com/business${index + 1}',
          instagram: 'business${index + 1}',
          twitter: '@business${index + 1}',
        ),
      );
    } catch (e) {
      print('Error loading businesses: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void showFilterOptions() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filter Options',
              style: Poppins.semiBold.copyWith(fontSize: 18),
            ),
            16.s,
            Text(
              'Coming soon...',
              style: Poppins.regular.copyWith(
                color: GColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSortOptions() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sort By',
              style: Poppins.semiBold.copyWith(fontSize: 18),
            ),
            16.s,
            ListTile(
              title: Text('Name (A-Z)'),
              onTap: () {
                businesses.sort((a, b) => a.name.compareTo(b.name));
                Get.back();
              },
            ),
            ListTile(
              title: Text('Name (Z-A)'),
              onTap: () {
                businesses.sort((a, b) => b.name.compareTo(a.name));
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
