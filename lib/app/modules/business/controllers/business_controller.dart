import 'dart:convert';
import 'dart:developer';

import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:ebony_market_app/app/routes/app_pages.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_thumbnail_video/index.dart';
import 'package:get_thumbnail_video/video_thumbnail.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constant/constant.dart';
import '../data/models/business_model.dart';
import '../../home/data/models/category_model.dart';
import '../views/create/business_media_view.dart';

class BusinessController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // Text Controllers
  final businessNameC = TextEditingController();
  final ownerNameC = TextEditingController();
  final emailC = TextEditingController();
  final phoneC = TextEditingController();
  final addressC = TextEditingController();
  final descriptionC = TextEditingController();

  // Social Media Controllers
  final websiteC = TextEditingController();
  final facebookC = TextEditingController();
  final instagramC = TextEditingController();
  final twitterC = TextEditingController();

  // Category Selection
  final categories = <String>[].obs;
  final selectedCategory = Rxn<String>();
  final selectedSubCategory = Rxn<String>();
  final selectedSubCategoryId = Rxn<String>();
  final Map<String, dynamic> categoriesData = {};

  // Store all categories from the Category model
  final allCategories = <Category>[].obs;

  // Operating Hours
  final operatingHours = <OperatingHour>[].obs;

  final count = 0.obs;

  // Media variables
  final businessLogo = Rxn<XFile>();
  final businessBanner = Rxn<XFile>();
  final businessImages = <XFile>[].obs;
  final businessVideo = Rxn<XFile>();
  final videoThumbnail = Rxn<Uint8List>();

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    loadCategories();
    initializeOperatingHours();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    businessNameC.dispose();
    ownerNameC.dispose();
    emailC.dispose();
    phoneC.dispose();
    addressC.dispose();
    descriptionC.dispose();
    websiteC.dispose();
    facebookC.dispose();
    instagramC.dispose();
    twitterC.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  void loadCategories() async {
    try {
      // Load categories from the Category model
      allCategories.value = Category.fetchAllCategories();

      // Extract category names for the dropdown
      categories.value = allCategories.map((cat) => cat.name).toList();

      // Create a map of subcategories for each category
      categoriesData.clear();
      for (var category in allCategories) {
        categoriesData[category.name] =
            category.subcategories.map((sub) => sub.name).toList();
      }

      selectedCategory.value = null;
      selectedSubCategory.value = null;
      selectedSubCategoryId.value = null;
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  List<String> getSubCategories(String? category) {
    if (category == null) return [];
    return List<String>.from(categoriesData[category] ?? []);
  }

  void setCategory(String category) {
    selectedCategory.value = category;
    selectedSubCategory.value = null;
    selectedSubCategoryId.value = null;
  }

  void setSubCategory(String subCategory) {
    selectedSubCategory.value = subCategory;

    // Find the subcategory ID
    if (selectedCategory.value != null) {
      final categoryIndex =
          allCategories.indexWhere((cat) => cat.name == selectedCategory.value);
      if (categoryIndex >= 0) {
        final subCategoryIndex = allCategories[categoryIndex]
            .subcategories
            .indexWhere((sub) => sub.name == subCategory);
        if (subCategoryIndex >= 0) {
          selectedSubCategoryId.value =
              allCategories[categoryIndex].subcategories[subCategoryIndex].id;
        }
      }
    }
  }

  void initializeOperatingHours() {
    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    for (var day in days) {
      operatingHours.add(OperatingHour(day: day));
    }
  }

  void toggleDay(int index) {
    operatingHours[index].isOpen.toggle();
  }

  Future<void> selectTime(
      BuildContext context, int index, bool isOpenTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final timeString =
          '${picked.hour}:${picked.minute.toString().padLeft(2, '0')}';
      if (isOpenTime) {
        operatingHours[index].openTime.value = timeString;
      } else {
        operatingHours[index].closeTime.value = timeString;
      }
    }
  }

  Future<void> pickLogo() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        businessLogo.value = image;
      }
    } catch (e) {
      print('Error picking logo: $e');
    }
  }

  Future<void> pickBanner() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        businessBanner.value = image;
      }
    } catch (e) {
      print('Error picking banner: $e');
    }
  }

  Future<void> pickImages() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage();
      if (images.isNotEmpty) {
        if (businessImages.length + images.length > 7) {
          Get.snackbar(
            'Error',
            'Maximum 7 images allowed',
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }
        businessImages.addAll(images);
      }
    } catch (e) {
      print('Error picking images: $e');
    }
  }

  void removeImage(int index) {
    businessImages.removeAt(index);
  }

  Future<void> pickVideo() async {
    try {
      final XFile? video = await _picker.pickVideo(
        source: ImageSource.gallery,
        maxDuration: Duration(minutes: 1),
      );
      if (video != null) {
        businessVideo.value = video;
        // Generate thumbnail
        final thumbnailBytes = await VideoThumbnail.thumbnailData(
          video: video.path,
          imageFormat: ImageFormat.JPEG,
          quality: 25,
        );
        videoThumbnail.value = thumbnailBytes;
      }
    } catch (e) {
      print('Error picking video: $e');
    }
  }

  void createBusiness() {
    if (formKey.currentState!.validate()) {
      Get.to(() => BusinessMediaView());
    }
  }

  // Format operating hours to a string for the Business model
  String formatOperatingHours() {
    final Map<String, Map<String, String>> hoursMap = {};

    for (var hour in operatingHours) {
      if (hour.isOpen.value) {
        hoursMap[hour.day] = {
          'open': hour.openTime.value,
          'close': hour.closeTime.value
        };
      }
    }

    return json.encode(hoursMap);
  }

  void confirmBusiness() {
    // Create a Business object using the new model
    final Business business = Business(
      description: descriptionC.text,
      image: businessBanner.value?.path ?? '',
      name: businessNameC.text,
      address: addressC.text,
      email: emailC.text,
      logo: businessLogo.value?.path ?? '',
      subCategoryId: selectedSubCategoryId.value ?? '',
      website: websiteC.text.isEmpty ? null : websiteC.text,
      facebook: facebookC.text.isEmpty ? null : facebookC.text,
      instagram: instagramC.text.isEmpty ? null : instagramC.text,
      twitter: twitterC.text.isEmpty ? null : twitterC.text,
      phone: phoneC.text,
      hours: json.decode(formatOperatingHours()),
      owner:
          'current_user_id', // This would be replaced with actual user ID when connected to Firebase
      ownerName: ownerNameC.text,
      isApproved: false, // New businesses start as unapproved
      latitude: null, // Would be set with actual location data
      longitude: null, // Would be set with actual location data
      images: businessImages.map((image) => image.path).toList(),
      videos: businessVideo.value != null ? [businessVideo.value!.path] : [],
      uploaderId:
          'current_user_id', // This would be replaced with actual user ID when connected to Firebase
    );

    // In a real implementation, this would be sent to Firebase
    log('Business to be created: ${business.toMap()}');

    // Show loading dialog
    Get.dialog(
      Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: GColors.primary,
              ),
              16.s,
              Text(
                'Creating your business...',
                style: Poppins.medium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );

    // Simulate API call
    Future.delayed(Duration(seconds: 2), () {
      Get.back(); // Close loading dialog
      Get.offAllNamed(Routes.BOTTOMBAR); // Navigate to home
      Get.snackbar(
        'Success',
        'Your business has been created successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    });
  }
}

class OperatingHour {
  final String day;
  final RxBool isOpen;
  final RxString openTime;
  final RxString closeTime;

  OperatingHour({
    required this.day,
    bool isOpen = false,
    String openTime = '09:00',
    String closeTime = '17:00',
  })  : isOpen = isOpen.obs,
        openTime = openTime.obs,
        closeTime = closeTime.obs;
}
