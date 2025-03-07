import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/utils/widgets/buttons/button_primary.dart';
import '../../controllers/business_controller.dart';

class BusinessPreviewView extends GetView<BusinessController> {
  const BusinessPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GColors.backgroundColor,
        title: Text(
          'Preview Business',
          style: Poppins.semiBold.copyWith(fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: GColors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Image
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: GColors.greyContainer,
                    image: controller.businessBanner.value != null
                        ? DecorationImage(
                            image: FileImage(
                                File(controller.businessBanner.value!.path)),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: controller.businessBanner.value == null
                      ? Center(
                          child: HeroIcon(
                            HeroIcons.photo,
                            size: 64,
                            color: GColors.textSecondary,
                          ),
                        )
                      : null,
                ),
                // Business Logo
                if (controller.businessLogo.value != null)
                  Positioned(
                    bottom: -40,
                    left: 16,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.file(
                          File(controller.businessLogo.value!.path),
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            // Add spacing if logo exists
            controller.businessLogo.value != null ? 40.s : 0.s,
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Business Name
                  Text(
                    controller.businessNameC.text,
                    style: Poppins.semiBold.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  5.s,
                  // Category & Sub-category
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: GColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          controller.selectedCategory.value ?? '',
                          style: Poppins.medium.copyWith(
                            color: GColors.primary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      8.s,
                      if (controller.selectedSubCategory.value != null)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: GColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            controller.selectedSubCategory.value ?? '',
                            style: Poppins.medium.copyWith(
                              color: GColors.primary,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                  16.s,
                  // Business Info Section
                  _buildInfoSection(
                    title: 'Business Information',
                    children: [
                      _buildInfoItem(
                        icon: HeroIcons.user,
                        title: 'Owner',
                        value: controller.ownerNameC.text,
                      ),
                      _buildInfoItem(
                        icon: HeroIcons.envelope,
                        title: 'Email',
                        value: controller.emailC.text,
                      ),
                      _buildInfoItem(
                        icon: HeroIcons.phone,
                        title: 'Phone',
                        value: controller.phoneC.text,
                      ),
                      _buildInfoItem(
                        icon: HeroIcons.mapPin,
                        title: 'Address',
                        value: controller.addressC.text,
                      ),
                    ],
                  ),
                  24.s,
                  // Operating Hours Section
                  _buildInfoSection(
                    title: 'Operating Hours',
                    children: [
                      ...controller.operatingHours.map((hour) {
                        if (!hour.isOpen.value) return SizedBox();
                        return Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  hour.day,
                                  style: Poppins.medium,
                                ),
                              ),
                              Text(
                                '${hour.openTime.value} - ${hour.closeTime.value}',
                                style: Poppins.regular.copyWith(
                                  color: GColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                  24.s,
                  // Description Section
                  _buildInfoSection(
                    title: 'About Business',
                    children: [
                      Text(
                        controller.descriptionC.text,
                        style: Poppins.regular.copyWith(
                          color: GColors.textSecondary,
                        ),
                      ),
                    ],
                  ),

                  // Business Images Section
                  if (controller.businessImages.isNotEmpty) ...[
                    24.s,
                    _buildInfoSection(
                      title: 'Business Images',
                      children: [
                        Container(
                          height: 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.businessImages.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 120,
                                margin: EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: FileImage(File(
                                        controller.businessImages[index].path)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],

                  // Business Video Section
                  if (controller.businessVideo.value != null &&
                      controller.videoThumbnail.value != null) ...[
                    24.s,
                    _buildInfoSection(
                      title: 'Business Video',
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image:
                                  MemoryImage(controller.videoThumbnail.value!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              child: HeroIcon(
                                HeroIcons.play,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ButtonPrimary(
                outlineColor: GColors.buttonPrimary,
                isOutline: true,
                text: 'Edit',
                onPressed: () => Get.back(),
                color: Colors.white,
                textColor: GColors.primary,
                // borderSide: BorderSide(
                //   color: GColors.buttonPrimary
                // ),
              ),
            ),
            16.s,
            Expanded(
              child: ButtonPrimary(
                text: 'Confirm',
                onPressed: () => controller.confirmBusiness(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Poppins.semiBold.copyWith(
            fontSize: 18,
          ),
        ),
        12.s,
        ...children,
      ],
    );
  }

  Widget _buildInfoItem({
    required HeroIcons icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeroIcon(
            icon,
            size: 20,
            color: GColors.textSecondary,
          ),
          12.s,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Poppins.medium.copyWith(
                    fontSize: 12,
                    color: GColors.textSecondary,
                  ),
                ),
                4.s,
                Text(
                  value,
                  style: Poppins.regular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
