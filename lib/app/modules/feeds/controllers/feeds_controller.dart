import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/resources/resources.dart';

class FeedsController extends GetxController {
  final count = 0.obs;
  final captionController = TextEditingController();
  final selectedImages = <XFile>[].obs;
  final ImagePicker _picker = ImagePicker();

  // For comment replies
  final expandedComments = <int>[].obs;
  final replyingTo = ''.obs;
  final replyingToCommentId = (-1).obs;
  final commentController = TextEditingController();

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

  void toggleShowReplies(int commentId) {
    if (expandedComments.contains(commentId)) {
      expandedComments.remove(commentId);
    } else {
      expandedComments.add(commentId);
    }
  }

  void replyToComment(int commentId, {String replyUserName = 'User Name'}) {
    replyingTo.value = replyUserName;
    replyingToCommentId.value = commentId;
    commentController.text = '';
    // Focus the text field
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  void cancelReply() {
    replyingTo.value = '';
    replyingToCommentId.value = -1;
  }

  void sendComment() {
    if (commentController.text.trim().isEmpty) return;

    // TODO: Implement sending comment or reply
    if (replyingToCommentId.value >= 0) {
      print(
          'Replying to comment ${replyingToCommentId.value}: ${commentController.text}');
      // Add reply to the comment
      // Expand the comment to show the new reply
      if (!expandedComments.contains(replyingToCommentId.value)) {
        expandedComments.add(replyingToCommentId.value);
      }
    } else {
      print('Adding new comment: ${commentController.text}');
      // Add new comment
    }

    // Clear input and reset reply state
    commentController.clear();
    cancelReply();
  }

  @override
  void onClose() {
    captionController.dispose();
    commentController.dispose();
    super.onClose();
  }
}
