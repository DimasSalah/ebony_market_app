import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:ebony_market_app/app/modules/home/data/models/category_model.dart';
import 'package:ebony_market_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import '../../../core/constant/constant.dart';
import '../controllers/home_controller.dart';

class SubCategoriesView extends GetView<HomeController> {
  final Category category;
  
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
                          '${category.subcategories.length} sub-categories',
                          style: Poppins.regular.copyWith(
                            color: GColors.textSecondary,
                          ),
                        ),
                        8.s,
                        Text(
                          category.description,
                          style: Poppins.regular.copyWith(
                            color: GColors.textSecondary,
                            fontSize: 12,
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
                childAspectRatio: 1.5, // Adjusted for image
              ),
              itemCount: category.subcategories.length,
              itemBuilder: (context, index) {
                final subCategory = category.subcategories[index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      Routes.BUSINESS_LIST,
                      arguments: {
                        'category': category.name,
                        'subCategory': subCategory.name,
                        'subCategoryId': subCategory.id,
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        // Background image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: subCategory.image,
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        // Dark overlay for better text visibility
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                        // Centered text
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              subCategory.name,
                              style: Poppins.semiBold.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
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
