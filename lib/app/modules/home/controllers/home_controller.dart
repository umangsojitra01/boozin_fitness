import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:boozin_fitness/app/data/providers/health_provider.dart';
import 'package:boozin_fitness/app/modules/home/constants/home_constants.dart';

class HomeController extends GetxController {
  HomeController(this._healthProvider);

  final HealthProvider _healthProvider;

  final RxInt steps = 0.obs;
  final RxDouble calories = 0.0.obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;
  final RxBool isFallbackData = false.obs;

  @override
  void onReady() {
    super.onReady();
    loadHealthData();
  }

  Future<void> loadHealthData() async {
    if (isClosed) return;
    isLoading.value = true;
    errorMessage.value = '';
    isFallbackData.value = false;

    try {
      final available = await _healthProvider.isAvailable();
      if (isClosed) return;
      if (!available) {
        _applyFallback(
          'Health tracking isn\'t available on this device. You\'re seeing sample numbers so you can explore the app.',
        );
        return;
      }

      final granted = await _healthProvider.requestPermissions();
      if (isClosed) return;
      if (!granted) {
        _applyFallback(
          'Turn on health access in Settings to see your real steps and calories. Until then, here are sample numbers.',
        );
        return;
      }

      final summary = await _healthProvider.getTodaySummary();
      if (isClosed) return;
      steps.value = summary.steps;
      calories.value = summary.activeCalories ?? 0.0;
      isFallbackData.value = false;
      errorMessage.value = '';
    } catch (e, stackTrace) {
      debugPrint('Health data load error: $e');
      debugPrint(stackTrace.toString());
      if (!isClosed) {
        _applyFallback(
          'We couldn\'t load your health data. Pull down to try again—or explore with the sample numbers below.',
        );
      }
    } finally {
      if (!isClosed) isLoading.value = false;
    }
  }

  void _applyFallback(String message) {
    if (isClosed) return;
    steps.value = HomeConstants.mockSteps;
    calories.value = HomeConstants.mockCalories;
    isFallbackData.value = true;
    errorMessage.value = message;
  }

  Future<void> refreshHealthData() => loadHealthData();
}
