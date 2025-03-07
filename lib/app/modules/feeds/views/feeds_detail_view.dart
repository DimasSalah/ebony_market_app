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
                      // Determine if this comment has replies
                      bool hasReplies = index % 3 == 0; // Just for demo

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Main comment
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              // Handle like comment
                                            },
                                            child: Text(
                                              'Like',
                                              style: Poppins.semiBold.copyWith(
                                                fontSize: Tz.small,
                                                color: GColors.textSecondary,
                                              ),
                                            ),
                                          ),
                                          15.s,
                                          GestureDetector(
                                            onTap: () {
                                              // Handle reply to comment
                                              controller.replyToComment(index);
                                            },
                                            child: Text(
                                              'Reply',
                                              style: Poppins.semiBold.copyWith(
                                                fontSize: Tz.small,
                                                color: GColors.textSecondary,
                                              ),
                                            ),
                                          ),
                                          if (hasReplies) ...[
                                            15.s,
                                            GestureDetector(
                                              onTap: () {
                                                // Toggle showing replies
                                                controller
                                                    .toggleShowReplies(index);
                                              },
                                              child: Obx(() => Text(
                                                    controller.expandedComments
                                                            .contains(index)
                                                        ? 'Hide Replies'
                                                        : 'View Replies (3)',
                                                    style: Poppins.semiBold
                                                        .copyWith(
                                                      fontSize: Tz.small,
                                                      color:
                                                          GColors.textSecondary,
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Show comment options
                                  },
                                  icon: HeroIcon(
                                    HeroIcons.ellipsisVertical,
                                    size: 16,
                                    color: GColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Replies section
                          if (hasReplies)
                            Obx(() => controller.expandedComments
                                    .contains(index)
                                ? Column(
                                    children: List.generate(3, (replyIndex) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          left: 60,
                                          right: 16,
                                          top: 4,
                                          bottom: 4,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 28,
                                              height: 28,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    'https://i.pravatar.cc/150?img=${index + replyIndex + 10}',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            10.s,
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Reply User',
                                                        style: Poppins.medium
                                                            .copyWith(
                                                          fontSize: Tz.small,
                                                        ),
                                                      ),
                                                      5.s,
                                                      Text(
                                                        '1h ago',
                                                        style: Poppins.regular
                                                            .copyWith(
                                                          fontSize: 10,
                                                          color: GColors
                                                              .textSecondary,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  3.s,
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'User Name ',
                                                          style: Poppins.medium
                                                              .copyWith(
                                                            fontSize: Tz.small,
                                                            color: GColors
                                                                .textPrimary,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              'Reply to the comment with additional context and information.',
                                                          style: Poppins.regular
                                                              .copyWith(
                                                            fontSize: Tz.small,
                                                            color: GColors
                                                                .textPrimary,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  5.s,
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          // Handle like reply
                                                        },
                                                        child: Text(
                                                          'Like',
                                                          style: Poppins
                                                              .semiBold
                                                              .copyWith(
                                                            fontSize: 10,
                                                            color: GColors
                                                                .textSecondary,
                                                          ),
                                                        ),
                                                      ),
                                                      15.s,
                                                      GestureDetector(
                                                        onTap: () {
                                                          // Handle reply to reply
                                                          controller.replyToComment(
                                                              index,
                                                              replyUserName:
                                                                  'Reply User');
                                                        },
                                                        child: Text(
                                                          'Reply',
                                                          style: Poppins
                                                              .semiBold
                                                              .copyWith(
                                                            fontSize: 10,
                                                            color: GColors
                                                                .textSecondary,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  )
                                : SizedBox()),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // Comment Input
          Obx(() => Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin:
                    EdgeInsets.only(bottom: kBottomNavigationBarHeight - 25),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: GColors.borderSecondary,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (controller.replyingTo.value.isNotEmpty)
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        margin: EdgeInsets.only(right: 8, bottom: 8),
                        decoration: BoxDecoration(
                          color: GColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Replying to ${controller.replyingTo.value}',
                              style: Poppins.medium.copyWith(
                                fontSize: 12,
                                color: GColors.primary,
                              ),
                            ),
                            5.s,
                            GestureDetector(
                              onTap: () => controller.cancelReply(),
                              child: HeroIcon(
                                HeroIcons.xMark,
                                size: 14,
                                color: GColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    Expanded(
                      child: TextField(
                        controller: controller.commentController,
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: controller.replyingTo.value.isEmpty
                              ? 'Add a comment...'
                              : 'Reply to ${controller.replyingTo.value}...',
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
                        // Handle send comment or reply
                        controller.sendComment();
                      },
                      icon: HeroIcon(
                        HeroIcons.paperAirplane,
                        color: GColors.primary,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
