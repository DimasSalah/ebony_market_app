import 'package:ebony_market_app/app/core/utils/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import '../../../core/constant/constant.dart';
import '../../../core/utils/extension/sizedbox_extension.dart';
import '../../../core/utils/widgets/buttons/button_primary.dart';
import '../../../core/utils/widgets/textfields/input_primary.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Image Section
          Container(
            height: Get.height * 0.6,
            width: double.infinity,
            child: Stack(
              children: [
                // Video Player
                SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                ),
                // GetBuilder<LoginController>(
                //   builder: (controller) {
                //     if (controller.chewieController != null) {
                //       return SizedBox.expand(
                //         child: FittedBox(
                //           fit: BoxFit.cover,
                //           child: SizedBox(
                //             width: controller
                //                 .videoPlayerController.value.size.width,
                //             height: controller
                //                 .videoPlayerController.value.size.height,
                //             child: Chewie(
                //               controller: controller.chewieController!,
                //             ),
                //           ),
                //         ),
                //       );
                //     } else {
                //       return Center(
                //         child: CircularProgressIndicator(
                //           color: GColors.primary,
                //         ),
                //       );
                //     }
                //   },
                // ),
                // Gradient overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.5),
                      ],
                    ),
                  ),
                ),
                // Welcome text
                Positioned(
                  bottom: 30,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: Poppins.semiBold.copyWith(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Sign in to continue',
                        style: Poppins.regular.copyWith(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Login Form Section
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email Input
                InputPrimary(
                  controller: controller.emailC,
                  hint: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: HeroIcon(
                    HeroIcons.envelope,
                    color: GColors.textSecondary,
                    size: 20,
                  ).marginOnly(left: 10),
                ),
                10.s,
                // Password Input
                Obx(() => InputPrimary(
                      controller: controller.passwordC,
                      hint: 'Enter your password',
                      obsecureText: controller.isPasswordHidden.value,
                      prefixIcon: HeroIcon(
                        HeroIcons.lockClosed,
                        color: GColors.textSecondary,
                        size: 20,
                      ).marginOnly(left: 10),
                      suffixIcon: IconButton(
                        onPressed: controller.togglePasswordVisibility,
                        icon: HeroIcon(
                          controller.isPasswordHidden.value
                              ? HeroIcons.eyeSlash
                              : HeroIcons.eye,
                          color: GColors.textSecondary,
                          size: 20,
                        ),
                      ),
                    )),
                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Get.toNamed('/forgot-password'),
                    child: Text(
                      'Forgot Password?',
                      style: Poppins.medium.copyWith(
                        color: GColors.primary,
                      ),
                    ),
                  ),
                ),
                // Login Button
                ButtonPrimary(
                  fullWidth: true,
                  text: 'Login',
                  onPressed: () => controller.login(),
                ),
                24.s,
                // Or divider
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Or continue with',
                        style: Poppins.regular.copyWith(
                          color: GColors.textSecondary,
                        ),
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                24.s,
                // Google Login Button
                ButtonPrimary(
                  fullWidth: true,
                  isOutline: true,
                  outlineColor: GColors.borderSecondary,
                  color: GColors.white,
                  onPressed: () => controller.loginWithGoogle(),
                  text: 'Continue with Google',
                  textColor: GColors.textPrimary,
                  icon: SvgPicture.asset(
                    Vector.googleIconLogo,
                    width: 20,
                  ),
                ),
                // Container(
                //   width: double.infinity,
                //   height: 50,
                //   child: OutlinedButton(
                //     onPressed: () => controller.loginWithGoogle(),
                //     style: OutlinedButton.styleFrom(
                //       side: BorderSide(color: GColors.borderSecondary),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(12),
                //       ),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         SvgPicture.asset(Vector.googleIconLogo),
                //         12.s,
                //         Text(
                //           'Continue with Google',
                //           style: Poppins.medium.copyWith(
                //             color: GColors.textPrimary,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
