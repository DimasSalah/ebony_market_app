import 'package:ebony_market_app/app/modules/profile/views/edit_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import '../../../core/constant/constant.dart';
import '../../../core/utils/extension/sizedbox_extension.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Custom App Bar with Profile Image
          SliverAppBar(
            expandedHeight: 150,
            pinned: true,
            backgroundColor: GColors.primary,
            actions: [
              IconButton(
                onPressed: () => showChatPreview(),
                icon: HeroIcon(
                  HeroIcons.chatBubbleLeftRight,
                  size: 26,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () => Get.offAllNamed(Routes.LOGIN),
                icon: HeroIcon(
                  HeroIcons.arrowRightStartOnRectangle,
                  size: 26,
                  color: Colors.white,
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Background gradient
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          GColors.primary,
                          GColors.primary.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                  // Profile image and edit button

                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://img.freepik.com/free-photo/medium-shot-man-posing-outside_23-2149028795.jpg?t=st=1740988628~exp=1740992228~hmac=a7877e41047e07be9e276337df08b09d3c002b07632819f10c43afb750d36364&w=1060',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.to(EditProfileView()),
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 8,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: HeroIcon(
                                        HeroIcons.pencil,
                                        size: 18,
                                        color: GColors.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Profile Content
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and Bio
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'John Doe',
                          style: Poppins.semiBold.copyWith(fontSize: 24),
                        ),
                        8.s,
                        Text(
                          'Digital entrepreneur & tech enthusiast',
                          style: Poppins.regular.copyWith(
                            color: GColors.textSecondary,
                          ),
                        ),
                        16.s,
                        Text(
                          'john.doe@example.com',
                          style: Poppins.medium.copyWith(
                            color: GColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
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
                        Text(
                          'Social Links',
                          style: Poppins.semiBold.copyWith(fontSize: 18),
                        ),
                        16.s,
                        _buildSocialLink(
                          icon: HeroIcons.globeAlt,
                          title: 'Website',
                          value: 'www.johndoe.com',
                        ),
                        _buildSocialLink(
                          icon: HeroIcons.link,
                          title: 'Instagram',
                          value: '@johndoe',
                        ),
                        _buildSocialLink(
                          icon: HeroIcons.link,
                          title: 'Twitter',
                          value: '@johndoe',
                        ),
                      ],
                    ),
                  ),
                  12.s,
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        HeroIcon(
                          HeroIcons.lockClosed,
                          size: 18,
                          style: HeroIconStyle.solid,
                          color: GColors.grey,
                        ),
                        8.s,
                        Text(
                          'Change Password',
                          style: Poppins.medium.copyWith(
                            color: GColors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  12.s,
                  // My Businesses
                  Text(
                    'My Businesses',
                    style: Poppins.semiBold.copyWith(fontSize: 18),
                  ),
                  16.s,
                  Obx(() => controller.businesses.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              HeroIcon(
                                HeroIcons.buildingStorefront,
                                size: 64,
                                color: GColors.textSecondary.withOpacity(0.3),
                              ),
                              8.s,
                              Text(
                                'No businesses yet',
                                style: Poppins.medium.copyWith(
                                  color: GColors.textSecondary,
                                ),
                              ),
                              8.s,
                              TextButton(
                                onPressed: () =>
                                    Get.toNamed('/business/create'),
                                child: Text('Create Business'),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.businesses.length,
                          itemBuilder: (context, index) {
                            final business = controller.businesses[index];
                            return Container(
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
                              child: ListTile(
                                leading: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(business.logo),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  business.name,
                                  style: Poppins.semiBold,
                                ),
                                subtitle: Text(
                                  business.category,
                                  style: Poppins.regular.copyWith(
                                    color: GColors.textSecondary,
                                  ),
                                ),
                                trailing:
                                    Icon(Icons.arrow_forward_ios, size: 16),
                                onTap: () => Get.toNamed(
                                  '/business/detail/${business.id}',
                                ),
                              ),
                            );
                          },
                        )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showChatPreview() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: GColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: HeroIcon(
                  HeroIcons.chatBubbleLeftRight,
                  size: 40,
                  color: GColors.primary,
                ),
              ),
              16.s,
              Text(
                'Coming Soon!',
                style: Poppins.semiBold.copyWith(fontSize: 18),
              ),
              12.s,
              Text(
                'Our chat feature is under development and will be available soon.',
                textAlign: TextAlign.center,
                style: Poppins.regular.copyWith(
                  color: GColors.textSecondary,
                ),
              ),
              24.s,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      'Close',
                      style: Poppins.medium.copyWith(
                        color: GColors.textSecondary,
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Get.back();
                  //     Get.to(() => ChatView());
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: GColors.primary,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //   ),
                  //   child: Text(
                  //     'Preview Anyway',
                  //     style: Poppins.medium.copyWith(
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLink({
    required HeroIcons icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: GColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: HeroIcon(
              icon,
              size: 20,
              color: GColors.primary,
            ),
          ),
          16.s,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Poppins.regular.copyWith(
                  color: GColors.textSecondary,
                  fontSize: 12,
                ),
              ),
              Text(
                value,
                style: Poppins.medium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
