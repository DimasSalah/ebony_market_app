import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebony_market_app/app/core/constant/constant.dart';
import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:ebony_market_app/app/core/utils/resources/resources.dart';
import 'package:ebony_market_app/app/core/utils/widgets/cards/card_app.dart';
import 'package:ebony_market_app/app/modules/feeds/views/feeds_upload_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../controllers/feeds_controller.dart';
import 'components/feeds_card.dart';
import 'feeds_detail_view.dart';

class FeedsView extends GetView<FeedsController> {
  const FeedsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GColors.backgroundColor,
        title: Text(
          'Feeds',
          style: Poppins.semiBold.copyWith(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          // Sticky Header
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyHeaderDelegate(
              child: Container(
                color: GColors.backgroundColor,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                  'https://img.freepik.com/free-photo/medium-shot-man-posing-outside_23-2149028795.jpg?t=st=1740988628~exp=1740992228~hmac=a7877e41047e07be9e276337df08b09d3c002b07632819f10c43afb750d36364&w=1060',
                                ),
                              ),
                            ),
                          ),
                          15.s,
                          Text(
                            'What on your mind?',
                            style: Poppins.medium.copyWith(
                              fontSize: Tz.medium,
                              color: GColors.textSecondary,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () => Get.to(() => FeedsUploadView()),
                            child: HeroIcon(
                              HeroIcons.plus,
                              size: 26,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: GColors.borderSecondary,
                      thickness: 3,
                      height: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Feeds Content
          SliverPadding(
            padding: EdgeInsets.only(top: 10),
            sliver: Obx(
              () => controller.isLoading.value
                  ? SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final feed = controller.feeds[index];
                          return FeedsCard(feed: feed);
                        },
                        childCount: controller.feeds.length,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 70; // Sesuaikan dengan tinggi yang diinginkan

  @override
  double get minExtent =>
      70; // Biasanya sama dengan maxExtent untuk header yang tidak berubah ukuran

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
