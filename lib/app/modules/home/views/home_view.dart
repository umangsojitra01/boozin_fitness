import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:boozin_fitness/app/core/constants/app_images.dart';
import 'package:boozin_fitness/app/modules/home/constants/home_constants.dart';
import 'package:boozin_fitness/app/modules/home/controllers/home_controller.dart';
import 'package:boozin_fitness/app/modules/home/widgets/stats_card.dart';
import 'package:boozin_fitness/app/theme/app_text_styles.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value &&
              controller.steps.value == 0 &&
              controller.calories.value == 0) {
            return Center(
              child: CircularProgressIndicator(color: colorScheme.primary),
            );
          }
          return RefreshIndicator(
            onRefresh: controller.refreshHealthData,
            color: colorScheme.primary,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi!',
                    style: AppTextStyles.greeting(context),
                  ),
                  const SizedBox(height: 25),
                  StatsCard(
                    iconAssetLight: AppImages.homeFootStepLight,
                    iconAssetDark: AppImages.homeFootStepDark,
                    label: 'Steps',
                    value: controller.steps.value,
                    goal: HomeConstants.stepsGoal,
                    goalLabel: '15,000',
                    colorScheme: colorScheme,
                  ),
                  const SizedBox(height: 20),
                  StatsCard(
                    iconAssetLight: AppImages.homeCaloriesLight,
                    iconAssetDark: AppImages.homeCaloriesDark,
                    label: 'Calories Burned',
                    value: controller.calories.value.round(),
                    goal: HomeConstants.caloriesGoal,
                    goalLabel: '1,000 kcal',
                    colorScheme: colorScheme,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
      bottomNavigationBar: Obx(() {
        if (!controller.isFallbackData.value) return const SizedBox.shrink();
        final message = controller.errorMessage.value;
        final displayText = message.isNotEmpty
            ? message
            : 'Connect health in Settings to see your real activity. Until then, you\'re seeing sample numbers.';
        return SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  size: 20,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    displayText,
                    style: AppTextStyles.bodySmall(context),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
