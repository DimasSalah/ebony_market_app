import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/resources/resources.dart';

class FeedsController extends GetxController {
  final count = 0.obs;
  final captionController = TextEditingController();
  final selectedImages = <XFile>[].obs;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  List<String> imagesFeeds = [
    Images.dummyFeed1,
    Images.dummyFeed2,
    Images.dummyFeed3,
  ];

  void increment() => count.value++;

  Future<void> pickImages() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage();
      if (images.isNotEmpty) {
        selectedImages.addAll(images);
      }
    } catch (e) {
      print('Error picking images: $e');
    }
  }

  void removeImage(int index) {
    selectedImages.removeAt(index);
  }

  Future<void> uploadPost() async {
    if (captionController.text.isEmpty && selectedImages.isEmpty) {
      Get.snackbar(
        'Error',
        'Please add caption or photos',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      // Implement your upload logic here

      // Clear data after successful upload
      captionController.clear();
      selectedImages.clear();

      Get.back();
      Get.snackbar(
        'Success',
        'Post uploaded successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to upload post',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    captionController.dispose();
    super.onClose();
  }
}
