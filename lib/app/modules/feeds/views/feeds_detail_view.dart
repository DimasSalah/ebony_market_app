import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../core/constant/constant.dart';
import '../../../core/utils/extension/sizedbox_extension.dart';
import '../controllers/feeds_controller.dart';

class FeedsDetailView extends GetView<FeedsController> {
  final String image;
  const FeedsDetailView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: GColors.primary,
          ),
        ),
        title: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://img.freepik.com/free-photo/portrait-friendly-looking-happy-attractive-male-model-with-moustache-beard-wearing-trendy-transparent-glasses-smiling-broadly-while-listening-interesting-story-waiting-mom-give-meal_176420-22400.jpg',
                  ),
                ),
              ),
            ),
            10.s,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: Poppins.medium.copyWith(fontSize: Tz.medium),
                ),
                Text(
                  '2 hours ago',
                  style: Poppins.regular.copyWith(
                    fontSize: Tz.small,
                    color: GColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Post Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // User Info

                        10.s,
                        // Caption
                        Text(
                          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos.',
                          style: Poppins.regular.copyWith(fontSize: Tz.small),
                        ),
                        10.s,
                        // Post Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.asset(
                              image,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        10.s,
                        // Like & Comment Count
                        Row(
                          children: [
                            HeroIcon(
                              HeroIcons.heart,
                              size: 26,
                            ),
                            5.s,
                            Text(
                              '123 Likes',
                              style: Poppins.regular.copyWith(
                                fontSize: Tz.small,
                                color: GColors.textSecondary,
                              ),
                            ),
                            14.s,
                            Text(
                              '123 Comments',
                              style: Poppins.regular.copyWith(
                                fontSize: Tz.small,
                                color: GColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                  // Comments List
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    'https://i.pravatar.cc/150?img=$index',
                                  ),
                                ),
                              ),
                            ),
                            10.s,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'User Name',
                                        style: Poppins.medium,
                                      ),
                                      5.s,
                                      Text(
                                        '2h ago',
                                        style: Poppins.regular.copyWith(
                                          fontSize: Tz.small,
                                          color: GColors.textSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  5.s,
                                  Text(
                                    'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
                                    style: Poppins.regular.copyWith(
                                      fontSize: Tz.small,
                                    ),
                                  ),
                                  5.s,
                                  Text(
                                    'Reply',
                                    style: Poppins.semiBold.copyWith(
                                      fontSize: Tz.small,
                                      color: GColors.textSecondary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // Comment Input
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            margin: EdgeInsets.only(bottom: kBottomNavigationBarHeight - 25),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: GColors.borderSecondary,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      hintStyle: Poppins.regular.copyWith(
                        fontSize: Tz.small,
                        color: GColors.textSecondary,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Handle send comment
                  },
                  icon: HeroIcon(
                    HeroIcons.paperAirplane,
                    color: GColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
