import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:boozin_fitness/app/routes/app_pages.dart';
import 'package:boozin_fitness/app/modules/splash/constants/splash_constants.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late final AnimationController pinAnimationController;
  late final Animation<double> pinOffsetAnimation;

  late final AnimationController logoFadeController;
  late final Animation<double> logoFade;

  late final AnimationController fitnessTextController;
  late final Animation<double> fitnessTextFade;

  @override
  void onInit() {
    super.onInit();
    pinAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: SplashConstants.pinAnimationDurationMs,
      ),
    );
    pinOffsetAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: pinAnimationController,
        curve: Curves.easeOutCubic,
      ),
    );

    logoFadeController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: SplashConstants.logoFadeDurationMs,
      ),
    );
    logoFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: logoFadeController, curve: Curves.easeOut),
    );

    fitnessTextController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: SplashConstants.fitnessTextFadeDurationMs,
      ),
    );
    fitnessTextFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: fitnessTextController, curve: Curves.easeOut),
    );

    pinAnimationController.addStatusListener(_onPinAnimationStatus);
  }

  void _onPinAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed && !isClosed) {
      fitnessTextController.forward();
    }
  }

  @override
  void onReady() {
    super.onReady();
    final startDelay =
        const Duration(milliseconds: SplashConstants.startDelayMs);
    final logoDelay =
        const Duration(milliseconds: SplashConstants.logoDelayMs);
    final totalDuration =
        const Duration(milliseconds: SplashConstants.totalSplashDurationMs);

    // Wait startDelay, then drop pin; logo fades in after logoDelay
    Future.delayed(startDelay, () {
      if (isClosed) return;
      pinAnimationController.forward();
      Future.delayed(logoDelay, () {
        if (!isClosed) logoFadeController.forward();
      });
    });

    // After totalDuration, go to home
    Future.delayed(totalDuration, () {
      if (!isClosed) Get.offAllNamed(Routes.HOME);
    });
  }

  @override
  void onClose() {
    pinAnimationController.removeStatusListener(_onPinAnimationStatus);
    pinAnimationController.dispose();
    logoFadeController.dispose();
    fitnessTextController.dispose();
    super.onClose();
  }
}
