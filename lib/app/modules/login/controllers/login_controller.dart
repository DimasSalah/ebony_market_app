import 'package:ebony_market_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class LoginController extends GetxController {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final isPasswordHidden = true.obs;

  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void onInit() {
    super.onInit();
    // initializePlayer();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {
    try {
      // TODO: Implement login logic
      Get.offAllNamed(Routes.BOTTOMBAR);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to login',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      // TODO: Implement Google login logic
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to login with Google',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> initializePlayer() async {
    videoPlayerController = VideoPlayerController.asset('');
    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      showControls: false,
      aspectRatio: videoPlayerController.value.aspectRatio,
    );
    update();
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.onClose();
  }
}
