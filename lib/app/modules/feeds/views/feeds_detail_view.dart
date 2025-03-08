import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import '../../../core/constant/constant.dart';
import '../../../core/utils/extension/sizedbox_extension.dart';
import '../controllers/feeds_controller.dart';
import '../data/models/feeds_model.dart';
import '../data/models/comment_model.dart';
import '../data/models/reply_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FeedsDetailView extends GetView<FeedsController> {
  final FeedsModel feed;
  const FeedsDetailView({super.key, required this.feed});

  List<Reply> getRepliesForComment(Comment comment) {
    return controller.replies
        .where((reply) => comment.replyIds.contains(reply.id))
        .toList();
  }

  String getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.s,
                        // Caption
                        Text(
                          feed.caption,
                          style: Poppins.regular.copyWith(fontSize: Tz.small),
                        ),
                        10.s,
                        // Post Image
                        if (feed.imageUrl != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: CachedNetworkImage(
                                imageUrl: feed.imageUrl!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                placeholder: (context, url) => Container(
                                  color: GColors.greyContainer,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
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
                              '${feed.likes?.length ?? 0} Likes',
                              style: Poppins.regular.copyWith(
                                fontSize: Tz.small,
                                color: GColors.textSecondary,
                              ),
                            ),
                            14.s,
                            Text(
                              '${feed.commentIds.length} Comments',
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
                  Obx(() => ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.comments.length,
                        itemBuilder: (context, index) {
                          final comment = controller.comments[index];
                          final hasReplies = comment.replyIds.isNotEmpty;
                          final replies = getRepliesForComment(comment);

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
                                            'https://i.pravatar.cc/150?img=$index}',
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
                                                'User ${comment.uid ?? "Unknown"}',
                                                style: Poppins.medium,
                                              ),
                                              5.s,
                                              Text(
                                                getTimeAgo(comment.createdOn),
                                                style: Poppins.regular.copyWith(
                                                  fontSize: Tz.small,
                                                  color: GColors.textSecondary,
                                                ),
                                              ),
                                            ],
                                          ),
                                          5.s,
                                          Text(
                                            comment.content,
                                            style: Poppins.regular.copyWith(
                                              fontSize: Tz.small,
                                            ),
                                          ),
                                          5.s,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  controller.replyToComment(
                                                      index,
                                                      replyUserName:
                                                          'User ${comment.uid ?? "Unknown"}');
                                                },
                                                child: Text(
                                                  'Reply',
                                                  style:
                                                      Poppins.semiBold.copyWith(
                                                    fontSize: Tz.small,
                                                    color:
                                                        GColors.textSecondary,
                                                  ),
                                                ),
                                              ),
                                              if (hasReplies) ...[
                                                15.s,
                                                GestureDetector(
                                                  onTap: () {
                                                    controller
                                                        .toggleShowReplies(
                                                            index);
                                                  },
                                                  child: Text(
                                                    controller.expandedComments
                                                            .contains(index)
                                                        ? 'Hide Replies'
                                                        : 'View Replies (${replies.length})',
                                                    style: Poppins.semiBold
                                                        .copyWith(
                                                      fontSize: Tz.small,
                                                      color:
                                                          GColors.textSecondary,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        // Show report options
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
                                        children: replies.map((reply) {
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
                                                        'https://i.pravatar.cc/150?img=$index',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                10.s,
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'User ${reply.uid}',
                                                            style: Poppins
                                                                .medium
                                                                .copyWith(
                                                              fontSize:
                                                                  Tz.small,
                                                            ),
                                                          ),
                                                          5.s,
                                                          Text(
                                                            getTimeAgo(reply
                                                                .createdOn),
                                                            style: Poppins
                                                                .regular
                                                                .copyWith(
                                                              fontSize: 10,
                                                              color: GColors
                                                                  .textSecondary,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      3.s,
                                                      Text(
                                                        reply.content,
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
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      )
                                    : SizedBox()),
                            ],
                          );
                        },
                      )),
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
