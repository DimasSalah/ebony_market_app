import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/constant.dart';

class GToast {
  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: GColors.grey.withOpacity(0.9),
          ),
          child: Center(
              child: Text(message,
                  style: Theme.of(Get.context!).textTheme.labelLarge)),
        ),
      ),
    );
  }

  static void success({required String content}) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.shade100,
      colorText: Colors.black,
      icon: const Icon(Icons.check_circle_outline_rounded,
          color: Colors.black, size: 24),
      margin: const EdgeInsets.all(10),
      borderRadius: 20,
      duration: const Duration(seconds: 3),
      showProgressIndicator: false,
      borderWidth: 2,
      borderColor: Colors.green,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      titleText: const Text(
        'Success',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      messageText: Text(
        content,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static void error({required String content}) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.shade100,
      colorText: Colors.black,
      icon: const Icon(Icons.cancel_outlined, color: Colors.black, size: 24),
      margin: const EdgeInsets.all(10),
      borderRadius: 20,
      duration: const Duration(seconds: 3),
      showProgressIndicator: false,
      borderWidth: 2,
      borderColor: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      titleText: const Text(
        'Error',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      messageText: Text(
        content,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static void info({required String content}) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue.shade100,
      colorText: Colors.black,
      icon: const Icon(Icons.info_outlined, color: Colors.black, size: 24),
      margin: const EdgeInsets.all(10),
      borderRadius: 20,
      duration: const Duration(seconds: 3),
      showProgressIndicator: false,
      borderWidth: 2,
      borderColor: Colors.blue,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      titleText: const Text(
        'Info',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      messageText: Text(
        content,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static void warning({required String content}) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.yellow.shade100,
      colorText: Colors.black,
      icon: const Icon(Icons.warning_amber_rounded,
          color: Colors.black, size: 24),
      margin: const EdgeInsets.all(10),
      borderRadius: 20,
      duration: const Duration(seconds: 3),
      showProgressIndicator: false,
      borderWidth: 2,
      borderColor: Colors.yellow.shade700,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      titleText: const Text(
        'Warning',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      messageText: Text(
        content,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
    ;
  }
}
