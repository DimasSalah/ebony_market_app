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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://img.freepik.com/free-photo/medium-shot-man-posing-outside_23-2149028795.jpg?t=st=1740988628~exp=1740992228~hmac=a7877e41047e07be9e276337df08b09d3c002b07632819f10c43afb750d36364&w=1060',
                        ),
                      ),
                    ),
                  ),
                  15.s,
                  Text(
                    'What on your mind?',
                    style: Poppins.medium.copyWith(
                        fontSize: Tz.medium, color: GColors.textSecondary),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => Get.to(() => FeedsUploadView()),
                    child: HeroIcon(
                      HeroIcons.plus,
                      size: 26,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: GColors.borderSecondary,
              thickness: 3,
            ),
            10.s,
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.imagesFeeds.length,
              itemBuilder: (context, index) => FeedsCard(
                image: controller.imagesFeeds[index],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class feeds extends StatelessWidget {
  const feeds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardApp(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'John Doe',
                    style: Poppins.medium.copyWith(fontSize: Tz.medium),
                  ),
                  Text(
                    '2 hours ago',
                    style: Poppins.regular.copyWith(
                        fontSize: Tz.small, color: GColors.textSecondary),
                  ),
                ],
              ),
            ],
          ),
          14.s,
          SizedBox(
            width: double.infinity,
            height: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                Images.dummyFeed1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          14.s,
          Row(
            children: [
              Icon(
                Icons.favorite,
                color: Colors.redAccent,
                size: 26,
              ),
              5.s,
              Text(
                'Wiliam',
                style: Poppins.medium.copyWith(fontSize: Tz.small),
              ),
              5.s,
              Text(
                'and',
                style: Poppins.medium
                    .copyWith(fontSize: Tz.small, color: GColors.textSecondary),
              ),
              5.s,
              Text(
                'others',
                style: Poppins.medium.copyWith(fontSize: Tz.small),
              ),
            ],
          ),
          7.s,
          Text(
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos.',
            style: Poppins.regular.copyWith(fontSize: Tz.small),
          ),
          7.s,
          Divider(
            color: GColors.borderSecondary,
            thickness: 1,
          ),
          7.s,
          Row(
            children: [
              HeroIcon(
                HeroIcons.handThumbUp,
                size: 26,
              ),
              5.s,
              Text(
                '123',
                style: Poppins.medium.copyWith(fontSize: Tz.small),
              ),
              5.s,
              Text(
                'Likes',
                style: Poppins.regular
                    .copyWith(fontSize: Tz.small, color: GColors.textSecondary),
              ),
              14.s,
              HeroIcon(
                HeroIcons.chatBubbleOvalLeftEllipsis,
                size: 26,
              ),
              5.s,
              Text(
                '123',
                style: Poppins.medium.copyWith(fontSize: Tz.small),
              ),
              5.s,
              Text(
                'Comments',
                style: Poppins.regular
                    .copyWith(fontSize: Tz.small, color: GColors.textSecondary),
              ),
            ],
          )
        ],
      ),
    );
  }
}
