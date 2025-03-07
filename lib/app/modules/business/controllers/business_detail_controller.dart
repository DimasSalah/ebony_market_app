import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/models/business_model.dart';

class BusinessDetailController extends GetxController {
  final isFavorite = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Check if business is in favorites
    checkFavorite();
  }

  void checkFavorite() {
    // TODO: Implement checking if business is in favorites
    // This would typically involve checking a local database or API
    isFavorite.value = false;
  }

  void toggleFavorite(String businessId) {
    isFavorite.value = !isFavorite.value;
    // TODO: Implement saving favorite status
    if (isFavorite.value) {
      Get.snackbar(
        'Added to Favorites',
        'This business has been added to your favorites',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Removed from Favorites',
        'This business has been removed from your favorites',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void shareBusiness(BusinessModel business) {
    // TODO: Implement share functionality
    Get.snackbar(
      'Share',
      'Sharing ${business.name}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void callBusiness(String phone) async {
    final url = 'tel:$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Get.snackbar(
        'Error',
        'Could not launch phone call',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void getDirections(String address) {
    // TODO: Implement map directions
    Get.snackbar(
      'Directions',
      'Getting directions to $address',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void emailBusiness(String email) async {
    final url = 'mailto:$email';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Get.snackbar(
        'Error',
        'Could not launch email',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void messageBusiness(String businessId) {
    // TODO: Implement messaging
    Get.snackbar(
      'Message',
      'Messaging feature coming soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void viewImage(List<String> images, int index) {
    // TODO: Implement image viewer
    Get.dialog(
      Dialog(
        insetPadding: EdgeInsets.zero,
        child: Container(
          width: double.infinity,
          height: Get.height * 0.7,
          child: Image.network(
            images[index],
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  void viewAllReviews(String businessId) {
    // TODO: Implement view all reviews
    Get.snackbar(
      'Reviews',
      'View all reviews feature coming soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
