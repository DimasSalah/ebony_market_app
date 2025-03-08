import 'dart:io';
import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:ebony_market_app/app/core/utils/widgets/textfields/input_primary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../data/models/user_model.dart';

import '../../../core/constant/constant.dart';
import '../../../core/utils/widgets/buttons/button_primary.dart';

// add model for social link
class SocialLink {
  String platform;
  String url;

  SocialLink({required this.platform, required this.url});
}

class ProfileController extends GetxController {
  final currentUser = Rxn<UserModel>();
  final isLoading = true.obs;
  final businesses = [].obs;

  // For edit profile
  final profileImage = Rxn<XFile>();
  final nameC = TextEditingController();
  final bioC = TextEditingController();
  final emailC = TextEditingController();
  final socialLinks = [].obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  @override
  void onClose() {
    nameC.dispose();
    bioC.dispose();
    emailC.dispose();
    super.onClose();
  }

  Future<void> loadUserData() async {
    try {
      isLoading.value = true;
      // Simulate API call delay
      await Future.delayed(Duration(seconds: 1));

      // Load dummy user data
      currentUser.value = UserModel.dummyUser();

      // Set initial values for edit profile
      nameC.text = currentUser.value?.fullName ?? '';
      bioC.text = currentUser.value?.bio ?? '';
      emailC.text = currentUser.value?.email ?? '';

      // Convert social links map to list for easier handling in UI
      if (currentUser.value?.socialLinks != null) {
        socialLinks.value = currentUser.value!.socialLinks!.entries
            .map((e) => {'platform': e.key, 'url': e.value})
            .toList();
      }
    } catch (e) {
      print('Error loading user data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        profileImage.value = image;
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void showAddSocialLinkForm() {
    final platformC = TextEditingController();
    final urlC = TextEditingController();

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add Social Link',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: platformC,
                decoration: InputDecoration(
                  labelText: 'Platform',
                  hintText: 'e.g. Instagram, Twitter, etc.',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: urlC,
                decoration: InputDecoration(
                  labelText: 'URL/Username',
                  hintText: 'e.g. @username or website URL',
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (platformC.text.isNotEmpty && urlC.text.isNotEmpty) {
                        socialLinks.add({
                          'platform': platformC.text,
                          'url': urlC.text,
                        });
                        Get.back();
                      }
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void removeSocialLink(int index) {
    socialLinks.removeAt(index);
  }

  Future<void> updateProfile() async {
    try {
      isLoading.value = true;
      // Simulate API call delay
      await Future.delayed(Duration(seconds: 1));

      // Update user model
      final updatedUser = UserModel(
        uid: currentUser.value!.uid,
        email: emailC.text,
        fullName: nameC.text,
        profileImg: profileImage.value?.path ?? currentUser.value?.profileImg,
        bio: bioC.text,
        socialLinks: Map.fromEntries(
          socialLinks.map((link) => MapEntry(link['platform'], link['url'])),
        ),
        role: currentUser.value?.role,
      );

      // Update current user
      currentUser.value = updatedUser;

      Get.back();
      Get.snackbar(
        'Success',
        'Profile updated successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print('Error updating profile: $e');
      Get.snackbar(
        'Error',
        'Failed to update profile',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
