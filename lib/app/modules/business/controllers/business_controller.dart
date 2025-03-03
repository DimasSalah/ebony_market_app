import 'dart:convert';

import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:ebony_market_app/app/routes/app_pages.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_thumbnail_video/index.dart';
import 'package:get_thumbnail_video/video_thumbnail.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constant/constant.dart';
import '../views/business_preview_view.dart';
import '../views/business_media_view.dart';

class BusinessController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // Text Controllers
  final businessNameC = TextEditingController();
  final ownerNameC = TextEditingController();
  final emailC = TextEditingController();
  final phoneC = TextEditingController();
  final addressC = TextEditingController();
  final descriptionC = TextEditingController();

  // Category Selection
  final categories = <String>[].obs;
  final selectedCategory = Rxn<String>();
  final selectedSubCategory = Rxn<String>();
  final Map<String, dynamic> categoriesData = {};

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
    super.onClose();
  }

  void increment() => count.value++;

  void loadCategories() async {
    try {
      final categoriesJson = await rootBundle.loadString(
          'assets/json/business_categories_model.json');
      final Map<String, dynamic> data = json.decode(categoriesJson);
      categoriesData.clear();
      categoriesData.addAll(data);
      categories.value = categoriesData.keys.toList();

      selectedCategory.value = null;
      selectedSubCategory.value = null;
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
  }

  void setSubCategory(String subCategory) {
    selectedSubCategory.value = subCategory;
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

  void confirmBusiness() {
    // Implement your API call here
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
