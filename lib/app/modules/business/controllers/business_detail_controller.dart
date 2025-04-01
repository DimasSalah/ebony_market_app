import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/models/business_model.dart';

class BusinessDetailController extends GetxController {
  final isFavorite = false.obs;
  final subCategoryName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Check if business is in favorites
    checkFavorite();

    // Get subcategory name from arguments if available
    if (Get.arguments is Map && Get.arguments['subCategoryName'] != null) {
      subCategoryName.value = Get.arguments['subCategoryName'];
    }
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

  void shareBusiness(Business business) {
    // TODO: Implement share functionality
    Get.snackbar(
      'Share',
      'Sharing ${business.name}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void callBusiness(String? phone) async {
    if (phone == null || phone.isEmpty) {
      Get.snackbar(
        'Error',
        'Phone number not available',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

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

  void messageBusiness(String? businessId) {
    if (businessId == null) return;

    // TODO: Implement messaging
    Get.snackbar(
      'Message',
      'Messaging feature coming soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void viewImage(List<String> images, int index) {
    Get.dialog(
      Dialog(
        insetPadding: EdgeInsets.zero,
        child: Container(
          height: Get.height * 0.5,
          width: double.infinity,
          child: PageView.builder(
            controller: PageController(initialPage: index),
            itemCount: images.length,
            itemBuilder: (context, pageIndex) => Stack(
              children: [
                // Image
                InteractiveViewer(
                  child: Image.network(
                    images[pageIndex],
                    fit: BoxFit.contain,
                  ),
                ),
                // Close button
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () => Get.back(),
                  ),
                ),
                // Image counter
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        '${pageIndex + 1}/${images.length}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void viewAllReviews(String? businessId) {
    if (businessId == null) return;

    // TODO: Implement view all reviews
    Get.snackbar(
      'Reviews',
      'View all reviews feature coming soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Helper method to format operating hours
  Map<String, Map<String, String>> getFormattedHours(dynamic hours) {
    if (hours == null) {
      return {};
    }

    if (hours is Map) {
      Map<String, Map<String, String>> result = {};
      hours.forEach((key, value) {
        if (value is Map) {
          result[key.toString()] = {
            'open': value['open']?.toString() ?? 'Closed',
            'close': value['close']?.toString() ?? 'Closed',
          };
        }
      });
      return result;
    }

    return {};
  }
}
