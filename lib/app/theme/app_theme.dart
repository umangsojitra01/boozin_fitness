import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _lightPrimary = Color(0xFF0D9488);
  static const Color _lightOnPrimary = Color(0xFFFFFFFF);
  static const Color _lightSurface = Color(0xFFFFFFFF);
  static const Color _lightSurfaceContainer = Color(0xFFF0F0F0);
  static const Color _lightOnSurface = Color(0xFF1A1A1A);
  static const Color _lightOnSurfaceVariant = Color(0xFF5C5C5C);
  static const Color _lightOutline = Color(0xFFE0E0E0);
  static const Color _lightProgressTrack = Color(0xFFC4C4C4);
  static const Color _lightProgressValue = Color(0xFF000000);

  static ThemeData get light {
    final colorScheme = ColorScheme.light(
      primary: _lightPrimary,
      onPrimary: _lightOnPrimary,
      surface: _lightSurface,
      onSurface: _lightOnSurface,
      onSurfaceVariant: _lightOnSurfaceVariant,
      outline: _lightOutline,
      surfaceContainerHighest: _lightSurfaceContainer,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: _lightSurface,
      textTheme: _buildTextTheme(Brightness.light),
      cardTheme: CardThemeData(
        elevation: 0,
        color: _lightSurfaceContainer,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        clipBehavior: Clip.antiAlias,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: _lightProgressValue,
        linearTrackColor: _lightProgressTrack,
        circularTrackColor: _lightProgressTrack,
      ),
    );
  }

  static const Color _darkPrimary = Color(0xFF2DD4BF);
  static const Color _darkOnPrimary = Color(0xFF003832);
  static const Color _darkSurface = Color(0xFF181818);
  static const Color _darkSurfaceContainer = Color(0xFF323232);
  static const Color _darkSurfaceContainerHigh = Color(0xFF242424);
  static const Color _darkOnSurface = Color(0xFFE8E8E8);
  static const Color _darkOnSurfaceVariant = Color(0xFFA3A3A3);
  static const Color _darkOutline = Color(0xFF3D3D3D);
  static const Color _darkProgressTrack = Color(0xFF8A8A8A);
  static const Color _darkProgressValue = Color(0xFFFFFFFF);

  static ThemeData get dark {
    final colorScheme = ColorScheme.dark(
      primary: _darkPrimary,
      onPrimary: _darkOnPrimary,
      surface: _darkSurface,
      onSurface: _darkOnSurface,
      onSurfaceVariant: _darkOnSurfaceVariant,
      outline: _darkOutline,
      surfaceContainerHighest: _darkSurfaceContainerHigh,
      surfaceContainer: _darkSurfaceContainer,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: _darkSurface,
      textTheme: _buildTextTheme(Brightness.dark),
      cardTheme: CardThemeData(
        elevation: 0,
        color: _darkSurfaceContainer,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        clipBehavior: Clip.antiAlias,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: _darkProgressValue,
        linearTrackColor: _darkProgressTrack,
        circularTrackColor: _darkProgressTrack,
      ),
    );
  }

  static TextTheme _buildTextTheme(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    final Color onSurface = isDark ? _darkOnSurface : _lightOnSurface;
    final Color onSurfaceVariant = isDark ? _darkOnSurfaceVariant : _lightOnSurfaceVariant;

    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        color: onSurface,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.25,
        color: onSurface,
      ),
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: onSurface,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: onSurfaceVariant,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: onSurface,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: onSurface,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: onSurfaceVariant,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: onSurface,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: onSurfaceVariant,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: onSurfaceVariant,
      ),
    );
  }
}
