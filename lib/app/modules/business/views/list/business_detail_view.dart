import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/utils/extension/sizedbox_extension.dart';
import '../../data/models/business_model.dart';
import '../../controllers/business_detail_controller.dart';

class BusinessDetailView extends GetView<BusinessDetailController> {
  const BusinessDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final business = Get.arguments as Business;
    final subCategoryName = Get.arguments is Map
        ? Get.arguments['subCategoryName'] as String? ?? ''
        : controller.subCategoryName.value;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with Banner
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: GColors.primary,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => controller.shareBusiness(business),
                icon: HeroIcon(
                  HeroIcons.share,
                  color: Colors.white,
                ),
              ),
              // IconButton(
              //   onPressed: () => controller.toggleFavorite(business.id),
              //   icon: Obx(() => HeroIcon(
              //         controller.isFavorite.value
              //             ? HeroIcons.heart
              //             : HeroIcons.heart,
              //         style: controller.isFavorite.value
              //             ? HeroIconStyle.solid
              //             : HeroIconStyle.outline,
              //         color: controller.isFavorite.value
              //             ? Colors.red
              //             : Colors.white,
              //       )),
              // ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Banner Image
                  CachedNetworkImage(
                    imageUrl: business.image ?? '',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: GColors.greyContainer,
                      child: Center(
                        child: HeroIcon(
                          HeroIcons.photo,
                          color: GColors.textSecondary,
                          size: 64,
                        ),
                      ),
                    ),
                  ),
                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  // Business Logo
                  Positioned(
                    bottom: 20,
                    left: 16,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: business.logo != null &&
                                    business.logo!.isNotEmpty
                                ? Image.network(
                                    business.logo!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: GColors.primary,
                                        child: Center(
                                          child: Text(
                                            business.name.isNotEmpty
                                                ? business.name[0]
                                                : '?',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : Container(
                                    color: GColors.primary,
                                    child: Center(
                                      child: Text(
                                        business.name.isNotEmpty
                                            ? business.name[0]
                                            : '?',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        16.s,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              business.name,
                              style: Poppins.semiBold.copyWith(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            if (subCategoryName.isNotEmpty)
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      subCategoryName,
                                      style: Poppins.medium.copyWith(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
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

          // Business Content
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Quick Actions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildQuickAction(
                        icon: HeroIcons.phone,
                        label: 'Call',
                        onTap: () => controller.callBusiness(business.phone),
                      ),
                      _buildQuickAction(
                        icon: HeroIcons.mapPin,
                        label: 'Directions',
                        onTap: () => controller.getDirections(business.address),
                      ),
                      // _buildQuickAction(
                      //   icon: HeroIcons.envelope,
                      //   label: 'Email',
                      //   onTap: () => controller.emailBusiness(business.email),
                      // ),
                      _buildQuickAction(
                        icon: HeroIcons.chatBubbleLeftRight,
                        label: 'Message',
                        onTap: () => controller.messageBusiness(business.id),
                      ),
                    ],
                  ),
                  24.s,
                  // Reviews Section

                  // About Section
                  Text(
                    'About',
                    style: Poppins.semiBold.copyWith(fontSize: 18),
                  ),
                  12.s,
                  Text(
                    business.description,
                    style: Poppins.regular.copyWith(
                      color: GColors.textSecondary,
                    ),
                  ),
                  24.s,

                  Text(
                    'Reviews & Ratings',
                    style: Poppins.semiBold.copyWith(fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          title: Text(
                            'Coming Soon!',
                            style: Poppins.semiBold.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          content: Text(
                            'Review and rating feature will be available soon.',
                            style: Poppins.regular.copyWith(
                              color: GColors.textSecondary,
                              fontSize: 16,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Get.back(),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: GColors.greyContainer),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ...List.generate(
                                5,
                                (index) => Padding(
                                  padding: EdgeInsets.only(right: 4),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 24,
                                  ),
                                ),
                              ),
                              8.s,
                              Text(
                                '(0 reviews)',
                                style: Poppins.regular.copyWith(
                                  color: GColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                          12.s,
                          Text(
                            'Tap to add your review',
                            style: Poppins.medium.copyWith(
                              color: GColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  24.s,

                  // Photos Section
                  if (business.images.isNotEmpty) ...[
                    Text(
                      'Photos',
                      style: Poppins.semiBold.copyWith(fontSize: 18),
                    ),
                    12.s,
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: business.images.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () =>
                                controller.viewImage(business.images, index),
                            child: Container(
                              width: 120,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: business.images[index],
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: GColors.greyContainer,
                                    child: Center(
                                      child:
                                          CircularProgressIndicator.adaptive(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    color: GColors.greyContainer,
                                    child: Center(
                                      child: HeroIcon(
                                        HeroIcons.photo,
                                        color: GColors.textSecondary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    24.s,
                  ],

                  // Social Media Section
                  if (business.website != null ||
                      business.facebook != null ||
                      business.instagram != null ||
                      business.twitter != null) ...[
                    Text(
                      'Social Media',
                      style: Poppins.semiBold.copyWith(fontSize: 18),
                    ),
                    12.s,
                    if (business.website != null)
                      _buildContactItem(
                        icon: HeroIcons.globeAlt,
                        title: 'Website',
                        value: business.website!,
                      ),
                    if (business.facebook != null)
                      _buildContactItem(
                        icon: HeroIcons.link,
                        title: 'Facebook',
                        value: business.facebook!,
                      ),
                    if (business.instagram != null)
                      _buildContactItem(
                        icon: HeroIcons.camera,
                        title: 'Instagram',
                        value: business.instagram!,
                      ),
                    if (business.twitter != null)
                      _buildContactItem(
                        icon: HeroIcons.chatBubbleBottomCenterText,
                        title: 'Twitter',
                        value: business.twitter!,
                      ),
                    24.s,
                  ],

                  // Contact Info Section
                  Text(
                    'Contact Information',
                    style: Poppins.semiBold.copyWith(fontSize: 18),
                  ),
                  12.s,
                  if (business.ownerName != null)
                    // _buildContactItem(
                    //   icon: HeroIcons.user,
                    //   title: 'Owner',
                    //   value: business.ownerName!,
                    // ),
                    // if (business.phone != null)
                    //   _buildContactItem(
                    //     icon: HeroIcons.phone,
                    //     title: 'Phone',
                    //     value: business.phone!,
                    //   ),
                    // _buildContactItem(
                    //   icon: HeroIcons.envelope,
                    //   title: 'Email',
                    //   value: business.email,
                    // ),
                    _buildContactItem(
                      icon: HeroIcons.mapPin,
                      title: 'Address',
                      value: business.address,
                    ),
                  24.s,

                  // Operating Hours Section
                  if (business.hours != null) ...[
                    Text(
                      'Operating Hours',
                      style: Poppins.semiBold.copyWith(fontSize: 18),
                    ),
                    12.s,
                    ...controller
                        .getFormattedHours(business.hours)
                        .entries
                        .map((entry) {
                      final day = entry.key;
                      final hours = entry.value;
                      final isOpen = hours['open'] != 'Closed';

                      return Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text(
                                day,
                                style: Poppins.medium,
                              ),
                            ),
                            Text(
                              isOpen
                                  ? '${hours['open']} - ${hours['close']}'
                                  : 'Closed',
                              style: Poppins.regular.copyWith(
                                color: GColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                  24.s,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction({
    required HeroIcons icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeroIcon(
            icon,
            size: 24,
            color: GColors.textSecondary,
          ),
          8.s,
          Text(
            label,
            style: Poppins.medium.copyWith(
              color: GColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required HeroIcons icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          HeroIcon(
            icon,
            size: 14,
            color: GColors.textSecondary,
          ),
          8.s,
          Expanded(
            child: Text(
              '$title: $value',
              style: Poppins.regular.copyWith(
                color: GColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
