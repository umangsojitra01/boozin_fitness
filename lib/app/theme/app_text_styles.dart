import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Common text styles used across the app. Use these instead of inline
/// [TextStyle] / [GoogleFonts] so fonts and sizes stay consistent.
class AppTextStyles {
  AppTextStyles._();

  /// Splash screen tagline (e.g. "Fitness").
  static TextStyle splashTagline(BuildContext context) {
    final theme = Theme.of(context);
    return GoogleFonts.nunito(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      height: 1.0,
      letterSpacing: 0,
      color: theme.colorScheme.onSurface,
    );
  }

  /// Large greeting (e.g. "Hi!").
  static TextStyle greeting(BuildContext context) {
    final theme = Theme.of(context);
    return GoogleFonts.nunito(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      height: 1.0,
      letterSpacing: 0,
      color: theme.colorScheme.onSurface,
    );
  }

  /// Small body / caption (e.g. bottom bar message).
  static TextStyle bodySmall(BuildContext context) {
    final theme = Theme.of(context);
    return GoogleFonts.nunito(
      fontSize: 12,
      height: 1.35,
      color: theme.colorScheme.onSurfaceVariant,
    );
  }

  /// Stats card label (e.g. "Steps:", "Calories Burned:").
  static TextStyle statsCardLabel(BuildContext context) {
    final theme = Theme.of(context);
    return GoogleFonts.montserrat(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.0,
      letterSpacing: 0,
      color: theme.colorScheme.onSurface,
    );
  }

  /// Stats card value (the number).
  static TextStyle statsCardValue(BuildContext context) {
    final theme = Theme.of(context);
    return GoogleFonts.nunito(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 1.0,
      letterSpacing: 0,
      color: theme.colorScheme.onSurface,
    );
  }

  /// Progress bar labels (e.g. "0", "Goal: 15,000").
  static TextStyle progressLabel(BuildContext context) {
    final theme = Theme.of(context);
    return GoogleFonts.nunito(
      fontWeight: FontWeight.w500,
      fontSize: 10,
      height: 1.0,
      letterSpacing: 0,
      color: theme.colorScheme.onSurface,
    );
  }
}
