import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import '../../../core/constant/constant.dart';
import '../controllers/home_controller.dart';
import '../data/models/category_model.dart';

class SubCategoriesView extends GetView<HomeController> {
  final CategoryModel category;

  const SubCategoriesView({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GColors.backgroundColor,
        title: Text(
          category.name,
          style: Poppins.semiBold.copyWith(fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new, color: GColors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with icon and category name
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: GColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: GColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: HeroIcon(
                      controller.getCategoryIcon(category.name),
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  16.s,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.name,
                          style: Poppins.semiBold.copyWith(fontSize: 20),
                        ),
                        4.s,
                        Text(
                          '${category.subCategories.length} sub-categories',
                          style: Poppins.regular.copyWith(
                            color: GColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            24.s,
            // Sub-categories grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5,
              ),
              itemCount: category.subCategories.length,
              itemBuilder: (context, index) {
                final subCategory = category.subCategories[index];
                return GestureDetector(
                  onTap: () {
                    // TODO: Navigate to businesses with this sub-category
                    Get.toNamed('/businesses', arguments: {
                      'category': category.name,
                      'subCategory': subCategory,
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          subCategory,
                          textAlign: TextAlign.center,
                          style: Poppins.medium.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
