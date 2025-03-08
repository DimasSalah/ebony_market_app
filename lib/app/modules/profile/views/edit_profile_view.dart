import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import '../../../core/constant/constant.dart';
import '../../../core/utils/extension/sizedbox_extension.dart';
import '../../../core/utils/widgets/buttons/button_primary.dart';
import '../../../core/utils/widgets/textfields/input_primary.dart';
import '../controllers/profile_controller.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GColors.backgroundColor,
        title: Text(
          'Edit Profile',
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
          children: [
            // Profile Image
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                      image: DecorationImage(
                        image: controller.profileImage.value != null
                            ? FileImage(
                                File(controller.profileImage.value!.path))
                            : NetworkImage(
                                    'https://img.freepik.com/free-photo/medium-shot-man-posing-outside_23-2149028795.jpg?t=st=1740988628~exp=1740992228~hmac=a7877e41047e07be9e276337df08b09d3c002b07632819f10c43afb750d36364&w=1060')
                                as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () => controller.pickImage(),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: GColors.primary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: HeroIcon(
                          HeroIcons.camera,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            24.s,
            // Form Fields
            InputPrimary(
              controller: controller.nameC,
              label: 'Full Name',
              hint: 'Enter your full name',
            ),
            16.s,
            InputPrimary(
              controller: controller.bioC,
              label: 'Bio',
              hint: 'Tell us about yourself',
              maxLines: 3,
            ),
            16.s,
            InputPrimary(
              controller: controller.emailC,
              label: 'Email',
              hint: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
            ),
            24.s,
            // Social Links
            Container(
              padding: EdgeInsets.all(16),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Social Links',
                        style: Poppins.semiBold.copyWith(fontSize: 18),
                      ),
                      IconButton(
                        onPressed: controller.showAddSocialLinkForm,
                        icon: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: GColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: HeroIcon(
                            HeroIcons.plus,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.s,
                  Obx(() => controller.socialLinks.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              HeroIcon(
                                HeroIcons.link,
                                size: 48,
                                color: GColors.textSecondary.withOpacity(0.3),
                              ),
                              8.s,
                              Text(
                                'No social links added yet',
                                style: Poppins.medium.copyWith(
                                  color: GColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            ...controller.socialLinks
                                .asMap()
                                .entries
                                .map((entry) {
                              final index = entry.key;
                              final link = entry.value as Map<String, String>;
                              return Container(
                                margin: EdgeInsets.only(bottom: 12),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: GColors.greyContainer,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: GColors.primary.withOpacity(0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: HeroIcon(
                                        HeroIcons.link,
                                        size: 20,
                                        color: GColors.primary,
                                      ),
                                    ),
                                    12.s,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            link['platform'] ?? '',
                                            style: Poppins.medium,
                                          ),
                                          Text(
                                            link['url'] ?? '',
                                            style: Poppins.regular.copyWith(
                                              color: GColors.textSecondary,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () =>
                                          controller.removeSocialLink(index),
                                      icon: HeroIcon(
                                        HeroIcons.trash,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                        )),
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
        child: ButtonPrimary(
          text: 'Save Changes',
          onPressed: () => controller.updateProfile(),
        ),
      ),
    );
  }
}
