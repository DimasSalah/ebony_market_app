import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:ebony_market_app/app/core/utils/widgets/textfields/input_primary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constant/constant.dart';
import '../../../core/utils/widgets/buttons/button_primary.dart';

// add model for social link
class SocialLink {
  String platform;
  String url;

  SocialLink({required this.platform, required this.url});
}

class ProfileController extends GetxController {
  // Text Controllers
  final nameC = TextEditingController();
  final bioC = TextEditingController();
  final emailC = TextEditingController();
  final websiteC = TextEditingController();
  final instagramC = TextEditingController();
  final twitterC = TextEditingController();

  // Business List
  final businesses = [].obs;

  // Profile Image
  final profileImage = Rxn<XFile>();

  final count = 0.obs;

  // Tambahkan list untuk social links
  final socialLinks = <SocialLink>[].obs;

  // Controller untuk form tambah social link
  final platformC = TextEditingController();
  final urlC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Load user data
    loadUserData();
    // Load user businesses
    loadUserBusinesses();
  }

  void loadUserData() {
    // TODO: Implement loading user data from API
    nameC.text = 'John Doe';
    bioC.text = 'Digital entrepreneur & tech enthusiast';
    emailC.text = 'john.doe@example.com';
    websiteC.text = 'www.johndoe.com';
    instagramC.text = '@johndoe';
    twitterC.text = '@johndoe';
  }

  void loadUserBusinesses() {
    // TODO: Implement loading user businesses from API
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        profileImage.value = image;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> updateProfile() async {
    try {
      // TODO: Implement profile update logic
      Get.back();
      Get.snackbar(
        'Success',
        'Profile updated successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update profile',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameC.dispose();
    bioC.dispose();
    emailC.dispose();
    websiteC.dispose();
    instagramC.dispose();
    twitterC.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  void addSocialLink() {
    if (platformC.text.isNotEmpty && urlC.text.isNotEmpty) {
      socialLinks.add(SocialLink(
        platform: platformC.text,
        url: urlC.text,
      ));
      // Clear form
      platformC.clear();
      urlC.clear();
      // Close bottom sheet
      Get.back();
    }
  }

  void removeSocialLink(int index) {
    socialLinks.removeAt(index);
  }

  void showAddSocialLinkForm() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Social Link',
              style: Poppins.semiBold.copyWith(fontSize: 18),
            ),
            16.s,
            InputPrimary(
              controller: platformC,
              label: 'Platform',
              hint: 'Enter platform name (e.g. Instagram, Twitter)',
            ),
            16.s,
            InputPrimary(
              controller: urlC,
              label: 'URL/Username',
              hint: 'Enter your social link or username',
            ),
            24.s,
            ButtonPrimary(
              text: 'Add Link',
              onPressed: addSocialLink,
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
