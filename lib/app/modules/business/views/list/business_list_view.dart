import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/utils/extension/sizedbox_extension.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/business_list_controller.dart';

class BusinessListView extends GetView<BusinessListController> {
  const BusinessListView({super.key});

  @override
  Widget build(BuildContext context) {
    final subCategory = Get.arguments['subCategory'] as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GColors.backgroundColor,
        title: Text(
          '$subCategory Businesses',
          style: Poppins.semiBold.copyWith(fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new, color: GColors.black),
        ),
      ),
      body: Column(
        children: [
          // Filter and Sort Section
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Expanded(
                //   child: GestureDetector(
                //     onTap: () => controller.showFilterOptions(),
                //     child: Container(
                //       padding:
                //           EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                //       decoration: BoxDecoration(
                //         border: Border.all(color: GColors.borderSecondary),
                //         borderRadius: BorderRadius.circular(8),
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           HeroIcon(
                //             HeroIcons.adjustmentsHorizontal,
                //             size: 20,
                //             color: GColors.textSecondary,
                //           ),
                //           8.s,
                //           Text(
                //             'Filter',
                //             style: Poppins.medium.copyWith(
                //               color: GColors.textSecondary,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // 12.s,
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.showSortOptions(),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: GColors.borderSecondary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HeroIcon(
                            HeroIcons.arrowsUpDown,
                            size: 20,
                            color: GColors.textSecondary,
                          ),
                          8.s,
                          Text(
                            'Sort',
                            style: Poppins.medium.copyWith(
                              color: GColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Business List
          Expanded(
            child: Obx(() => controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : controller.businesses.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        padding: EdgeInsets.all(16),
                        itemCount: controller.businesses.length,
                        itemBuilder: (context, index) {
                          final business = controller.businesses[index];
                          return GestureDetector(
                            onTap: () => Get.toNamed(
                              Routes.BUSINESS_DETAIL,
                              arguments: business,
                            ),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 16),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Business Banner
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ),
                                        child: Image.network(
                                          business.image ?? '',
                                          height: 120,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                              height: 120,
                                              width: double.infinity,
                                              color: GColors.greyContainer,
                                              child: Center(
                                                child: HeroIcon(
                                                  HeroIcons.photo,
                                                  color: GColors.textSecondary,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      // Business Logo
                                      Positioned(
                                        bottom: -25,
                                        left: 16,
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                blurRadius: 8,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: ClipOval(
                                            child: Image.network(
                                              business.logo ?? '',
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Container(
                                                  color: GColors.primary,
                                                  child: Center(
                                                    child: Text(
                                                      business.name.isNotEmpty
                                                          ? business.name[0]
                                                          : '?',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Business Info
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(16, 30, 16, 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                business.name,
                                                style:
                                                    Poppins.semiBold.copyWith(
                                                  fontSize: 16,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        4.s,
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 2,
                                              ),
                                              decoration: BoxDecoration(
                                                color: GColors.primary
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                subCategory,
                                                style: Poppins.medium.copyWith(
                                                  fontSize: 10,
                                                  color: GColors.primary,
                                                ),
                                              ),
                                            ),
                                            8.s,
                                            HeroIcon(
                                              HeroIcons.mapPin,
                                              size: 14,
                                              color: GColors.textSecondary,
                                            ),
                                            4.s,
                                            Expanded(
                                              child: Text(
                                                business.address,
                                                style: Poppins.regular.copyWith(
                                                  fontSize: 12,
                                                  color: GColors.textSecondary,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        12.s,
                                        Text(
                                          business.description,
                                          style: Poppins.regular.copyWith(
                                            fontSize: 12,
                                            color: GColors.textSecondary,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeroIcon(
            HeroIcons.buildingStorefront,
            size: 64,
            color: GColors.textSecondary.withOpacity(0.3),
          ),
          16.s,
          Text(
            'No businesses found',
            style: Poppins.semiBold.copyWith(
              fontSize: 18,
              color: GColors.textSecondary,
            ),
          ),
          8.s,
          Text(
            'Try changing your filters or check back later',
            style: Poppins.regular.copyWith(
              color: GColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
