import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import '../../../core/constant/constant.dart';
import '../../../core/utils/extension/sizedbox_extension.dart';
import '../controllers/feeds_controller.dart';

class FeedsUploadView extends GetView<FeedsController> {
  const FeedsUploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GColors.backgroundColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: GColors.primary,
          ),
        ),
        title: Text(
          'Create Post',
          style: Poppins.semiBold.copyWith(fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              controller.uploadPost();
            },
            child: Text(
              'Post',
              style: Poppins.semiBold.copyWith(
                color: GColors.primary,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // User Info
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://ui-avatars.com/api/?name=User&background=random',
                        ),
                      ),
                    ),
                  ),
                  10.s,
                  Text(
                    'User Name',
                    style: Poppins.medium.copyWith(fontSize: Tz.medium),
                  ),
                ],
              ),
              16.s,
              // Caption TextField
              TextField(
                controller: controller.captionController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "What's on your mind?",
                  hintStyle: Poppins.regular.copyWith(
                    color: GColors.textSecondary,
                    fontSize: Tz.medium,
                  ),
                  border: InputBorder.none,
                ),
              ),
              16.s,
              // Add Photos Button
              GestureDetector(
                onTap: () => controller.pickImages(),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: GColors.borderSecondary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeroIcon(
                        HeroIcons.photo,
                        color: GColors.primary,
                      ),
                      8.s,
                      Text(
                        'Add Photos',
                        style: Poppins.medium.copyWith(
                          color: GColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              16.s,
              // Selected Images Grid
              Obx(() {
                if (controller.selectedImages.isEmpty) {
                  return Container();
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: controller.selectedImages.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(controller.selectedImages[index].path),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
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
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
