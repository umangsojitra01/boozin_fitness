import 'package:flutter/material.dart';

import 'package:boozin_fitness/app/core/utils/format_utils.dart';
import 'package:boozin_fitness/app/theme/app_text_styles.dart';

/// A card showing a single stat (e.g. steps or calories) with progress bar.
class StatsCard extends StatelessWidget {
  const StatsCard({
    super.key,
    required this.iconAssetLight,
    required this.iconAssetDark,
    required this.label,
    required this.value,
    required this.goal,
    required this.goalLabel,
    required this.colorScheme,
  });

  final String iconAssetLight;
  final String iconAssetDark;
  final String label;
  final int value;
  final int goal;
  final String goalLabel;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final progress = goal > 0 ? (value / goal).clamp(0.0, 1.0) : 0.0;
    final progressTheme = Theme.of(context).progressIndicatorTheme;
    final titleStyle = AppTextStyles.statsCardLabel(context);
    final valueStyle = AppTextStyles.statsCardValue(context);
    final progressLabelStyle = AppTextStyles.progressLabel(context);
    final valueStr = FormatUtils.formatIntegerWithCommas(value);

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: '$label: ', style: titleStyle),
                        TextSpan(text: valueStr, style: valueStyle),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 12,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      backgroundColor:
                          progressTheme.linearTrackColor ??
                          colorScheme.surfaceContainerHighest,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        progressTheme.color ?? colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('0', style: progressLabelStyle),
                      Text(
                        'Goal: $goalLabel',
                        style: progressLabelStyle,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Image.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? iconAssetDark
                  : iconAssetLight,
              width: 52,
              height: 52,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
