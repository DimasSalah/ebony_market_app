import 'dart:io';

import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../core/constant/constant.dart';
import '../../../core/utils/widgets/buttons/button_primary.dart';
import '../../../core/utils/widgets/textfields/input_primary.dart';
import '../controllers/business_controller.dart';
import 'business_preview_view.dart';

class BusinessMediaView extends GetView<BusinessController> {
  const BusinessMediaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GColors.backgroundColor,
        title: Text(
          'Add Business Media',
          style: Poppins.semiBold.copyWith(fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: GColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Business Logo
              Text(
                'Business Logo',
                style: Poppins.semiBold,
              ),
              5.s,
              Obx(() => GestureDetector(
                    onTap: () => controller.pickLogo(),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: GColors.greyContainer,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: GColors.borderSecondary),
                        image: controller.businessLogo.value != null
                            ? DecorationImage(
                                image: FileImage(
                                    File(controller.businessLogo.value!.path)),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: controller.businessLogo.value == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                HeroIcon(
                                  HeroIcons.plus,
                                  color: GColors.textSecondary,
                                ),
                                5.s,
                                Text(
                                  'Add Logo',
                                  style: Poppins.regular.copyWith(
                                    fontSize: 12,
                                    color: GColors.textSecondary,
                                  ),
                                ),
                              ],
                            )
                          : null,
                    ),
                  )),
              16.s,

              // Banner Image
              Text(
                'Banner Image',
                style: Poppins.semiBold,
              ),
              5.s,
              Obx(() => GestureDetector(
                    onTap: () => controller.pickBanner(),
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        color: GColors.greyContainer,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: GColors.borderSecondary),
                        image: controller.businessBanner.value != null
                            ? DecorationImage(
                                image: FileImage(File(
                                    controller.businessBanner.value!.path)),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: controller.businessBanner.value == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                HeroIcon(
                                  HeroIcons.photo,
                                  color: GColors.textSecondary,
                                ),
                                5.s,
                                Text(
                                  'Add Banner Image',
                                  style: Poppins.regular.copyWith(
                                    fontSize: 12,
                                    color: GColors.textSecondary,
                                  ),
                                ),
                              ],
                            )
                          : null,
                    ),
                  )),
              16.s,

              // Business Images
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Business Images',
                    style: Poppins.semiBold,
                  ),
                  Text(
                    '${controller.businessImages.length}/7',
                    style: Poppins.regular.copyWith(
                      color: GColors.textSecondary,
                    ),
                  ),
                ],
              ),
              5.s,
              Obx(() => GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: controller.businessImages.length < 7
                        ? controller.businessImages.length + 1
                        : controller.businessImages.length,
                    itemBuilder: (context, index) {
                      if (index == controller.businessImages.length &&
                          controller.businessImages.length < 7) {
                        return GestureDetector(
                          onTap: () => controller.pickImages(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: GColors.greyContainer,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: GColors.borderSecondary),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                HeroIcon(
                                  HeroIcons.plus,
                                  color: GColors.textSecondary,
                                ),
                                5.s,
                                Text(
                                  'Add Image',
                                  style: Poppins.regular.copyWith(
                                    fontSize: 12,
                                    color: GColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: FileImage(File(
                                    controller.businessImages[index].path)),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: GestureDetector(
                              onTap: () => controller.removeImage(index),
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )),
              16.s,

              // Business Video
              Text(
                'Business Video',
                style: Poppins.semiBold,
              ),
              5.s,
              Obx(() => GestureDetector(
                    onTap: () => controller.pickVideo(),
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        color: GColors.greyContainer,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: GColors.borderSecondary),
                      ),
                      child: controller.businessVideo.value == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                HeroIcon(
                                  HeroIcons.videoCameraSlash,
                                  color: GColors.textSecondary,
                                ),
                                5.s,
                                Text(
                                  'Add Video',
                                  style: Poppins.regular.copyWith(
                                    fontSize: 12,
                                    color: GColors.textSecondary,
                                  ),
                                ),
                              ],
                            )
                          : Stack(
                              alignment: Alignment.center,
                              children: [
                                controller.videoThumbnail.value != null
                                    ? Image.memory(
                                        controller.videoThumbnail.value!,
                                        fit: BoxFit.cover,
                                      )
                                    : SizedBox(),
                                HeroIcon(
                                  HeroIcons.play,
                                  color: Colors.white,
                                  size: 48,
                                ),
                              ],
                            ),
                    ),
                  )),
              24.s,

              // Next Button
              ButtonPrimary(
                text: 'Preview Business',
                onPressed: () => Get.to(() => BusinessPreviewView()),
                fullWidth: true,
              ),
              24.s,
            ],
          ),
        ),
      ),
    );
  }
}
