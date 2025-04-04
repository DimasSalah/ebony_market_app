import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:ebony_market_app/app/modules/feeds/views/feeds_detail_view.dart'
    show FeedsDetailView;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/utils/extension/sizedbox_extension.dart';
import '../../data/models/feeds_model.dart';

class FeedsCard extends StatelessWidget {
  final FeedsModel feed;

  const FeedsCard({
    Key? key,
    required this.feed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Get.to(() => FeedsDetailView(feed: feed)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://img.freepik.com/free-photo/portrait-friendly-looking-happy-attractive-male-model-with-moustache-beard-wearing-trendy-transparent-glasses-smiling-broadly-while-listening-interesting-story-waiting-mom-give-meal_176420-22400.jpg?t=st=1740123349~exp=1740126949~hmac=8f98d247e0e1375340421427c8888fb85bf9f7b30cc3051873febc84114f8637',
                      ),
                    ),
                  ),
                ),
                5.s,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'User Name',
                            style: Poppins.medium.copyWith(fontSize: Tz.medium),
                          ),
                          5.s,
                          Text(
                            '2 hours ago',
                            style: Poppins.regular.copyWith(
                              fontSize: Tz.small,
                              color: GColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        feed.caption,
                        style: Poppins.regular.copyWith(fontSize: Tz.small),
                      ),
                      10.s,
                      if (feed.imageUrl != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: feed.imageUrl != null
                                ? CachedNetworkImage(
                                    imageUrl: feed.imageUrl!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    placeholder: (context, url) => Container(
                                      color: GColors.greyContainer,
                                      child: Center(
                                        child: CircularProgressIndicator(),
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
                                  )
                                : Container(
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
                      10.s,
                      Row(
                        children: [
                          HeroIcon(
                            HeroIcons.heart,
                            size: 26,
                          ),
                          5.s,
                          Text(
                            feed.likes?.length.toString() ?? '0',
                            style: Poppins.medium.copyWith(fontSize: Tz.small),
                          ),
                          5.s,
                          Text(
                            'Likes',
                            style: Poppins.regular.copyWith(
                                fontSize: Tz.small,
                                color: GColors.textSecondary),
                          ),
                          14.s,
                          GestureDetector(
                            onTap: () {
                              Get.to(() => FeedsDetailView(feed: feed));
                            },
                            child: HeroIcon(
                              HeroIcons.chatBubbleOvalLeftEllipsis,
                              size: 26,
                            ),
                          ),
                          5.s,
                          Text(
                            feed.commentIds.length.toString(),
                            style: Poppins.medium.copyWith(fontSize: Tz.small),
                          ),
                          5.s,
                          Text(
                            'Comments',
                            style: Poppins.regular.copyWith(
                                fontSize: Tz.small,
                                color: GColors.textSecondary),
                          ),
                          Spacer(),
                          HeroIcon(
                            HeroIcons.ellipsisHorizontal,
                            color: GColors.black,
                            size: 26,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: GColors.borderSecondary,
          thickness: 1,
        ),
      ],
    );
  }
}
