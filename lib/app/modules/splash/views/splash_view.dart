import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:boozin_fitness/app/core/constants/app_images.dart';
import 'package:boozin_fitness/app/modules/splash/constants/splash_constants.dart';
import 'package:boozin_fitness/app/modules/splash/controllers/splash_controller.dart';
import 'package:boozin_fitness/app/theme/app_text_styles.dart';

/// Splash screen with pin/logo animations and tagline.
class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageHeight = Get.width * SplashConstants.imageHeightFactor;
    final pinOffset = Get.width * SplashConstants.pinOffsetFactor;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: controller.pinOffsetAnimation,
            builder: (context, child) {
              return Center(
                child: Transform.translate(
                  offset: Offset(
                    pinOffset * controller.pinOffsetAnimation.value,
                    0,
                  ),
                  child: Image.asset(
                    AppImages.splashPin,
                    height: imageHeight,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.place,
                      size: 80,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              );
            },
          ),
          FadeTransition(
            opacity: controller.logoFade,
            child: Center(
              child: Image.asset(
                Get.isDarkMode ? AppImages.logoDark : AppImages.logoLight,
                height: imageHeight,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.place,
                  size: 80,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Get.height * SplashConstants.taglineTopFactor,
            child: FadeTransition(
              opacity: controller.fitnessTextFade,
              child: Text(
                SplashConstants.tagline,
                textAlign: TextAlign.center,
                style: AppTextStyles.splashTagline(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
