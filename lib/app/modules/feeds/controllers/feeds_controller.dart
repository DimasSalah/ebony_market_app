import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../data/models/feeds_model.dart';
import '../data/models/comment_model.dart';
import '../data/models/reply_model.dart';

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

  // Feeds data
  final feeds = <FeedsModel>[].obs;
  final comments = <Comment>[].obs;
  final replies = <Reply>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadFeeds();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void increment() => count.value++;

  Future<void> loadFeeds() async {
    try {
      isLoading.value = true;
      // Simulate API call delay
      await Future.delayed(Duration(seconds: 1));

      // Create dummy feeds data
      feeds.value = List.generate(
        5,
        (index) => FeedsModel(
          id: 'feed-$index',
          caption:
              'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos.',
          imageUrl: index % 2 == 0
              ? null
              : 'https://picsum.photos/seed/feed$index/800/450',
          uid: 'user-1',
          commentIds: ['comment-1', 'comment-2', 'comment-3'],
          uploadTime: Timestamp.now(),
          likes: [],
        ),
      );

      // Create dummy comments
      comments.value = [
        Comment(
          id: 'comment-1',
          content: 'This is amazing! Love the design and concept.',
          uid: 'user-2',
          replyIds: ['reply-1', 'reply-2'],
          createdOn: DateTime.now().subtract(Duration(hours: 2)),
        ),
        Comment(
          id: 'comment-2',
          content: 'Great work! Keep it up 👏',
          uid: 'user-3',
          replyIds: ['reply-3'],
          createdOn: DateTime.now().subtract(Duration(hours: 1)),
        ),
        Comment(
          id: 'comment-3',
          content: 'Can you share more details about this?',
          uid: 'user-4',
          replyIds: ['reply-4', 'reply-5', 'reply-6'],
          createdOn: DateTime.now().subtract(Duration(minutes: 30)),
        ),
      ];

      // Create dummy replies
      replies.value = [
        Reply(
          id: 'reply-1',
          content: 'Thank you! Really appreciate your feedback.',
          uid: 'user-1',
          createdOn: DateTime.now().subtract(Duration(hours: 1, minutes: 45)),
        ),
        Reply(
          id: 'reply-2',
          content: 'I agree, the design is fantastic!',
          uid: 'user-5',
          createdOn: DateTime.now().subtract(Duration(hours: 1, minutes: 30)),
        ),
        Reply(
          id: 'reply-3',
          content: 'Thanks for the support! 🙏',
          uid: 'user-1',
          createdOn: DateTime.now().subtract(Duration(minutes: 45)),
        ),
        Reply(
          id: 'reply-4',
          content: 'Sure! What specific details would you like to know?',
          uid: 'user-1',
          createdOn: DateTime.now().subtract(Duration(minutes: 25)),
        ),
        Reply(
          id: 'reply-5',
          content: 'I\'d like to know about the technology stack used.',
          uid: 'user-4',
          createdOn: DateTime.now().subtract(Duration(minutes: 20)),
        ),
        Reply(
          id: 'reply-6',
          content:
              'We used Flutter for the frontend and Firebase for the backend.',
          uid: 'user-1',
          createdOn: DateTime.now().subtract(Duration(minutes: 15)),
        ),
      ];
    } catch (e) {
      print('Error loading feeds: $e');
    } finally {
      isLoading.value = false;
    }
  }

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
        'Please add a caption or select images',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      // Create a new feed
      final feed = FeedsModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        caption: captionController.text,
        imageUrl: selectedImages.isNotEmpty ? selectedImages.first.path : null,
        uid: 'current-user-id', // This would be replaced with actual user ID
        commentIds: [],
        uploadTime: Timestamp.now(),
        likes: [],
      );

      // Add to feeds list
      feeds.insert(0, feed);

      // Clear form
      captionController.clear();
      selectedImages.clear();

      // Navigate back
      Get.back();

      Get.snackbar(
        'Success',
        'Post uploaded successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print('Error uploading post: $e');
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

  Future<void> sendComment() async {
    if (commentController.text.isEmpty) return;

    try {
      final comment = Comment(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: commentController.text,
        uid: 'current-user-id', // This would be replaced with actual user ID
        replyIds: [],
        createdOn: DateTime.now(),
      );

      // Add to comments list
      comments.add(comment);

      // Clear input
      commentController.clear();
      cancelReply();
    } catch (e) {
      print('Error sending comment: $e');
      Get.snackbar(
        'Error',
        'Failed to send comment',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    captionController.dispose();
    commentController.dispose();
    super.onClose();
  }
}
