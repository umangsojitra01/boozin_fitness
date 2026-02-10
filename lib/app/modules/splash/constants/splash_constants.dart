/// Shared constants for the Splash module (timing and layout).
abstract final class SplashConstants {
  SplashConstants._();

  // Timing (milliseconds)

  /// Delay before pin animation starts.
  static const int startDelayMs = 1200;

  /// Pin animation duration.
  static const int pinAnimationDurationMs = 1200;

  /// Delay after pin starts before logo fades in.
  static const int logoDelayMs = 200;

  /// Logo fade duration.
  static const int logoFadeDurationMs = 300;

  /// Fitness text fade duration.
  static const int fitnessTextFadeDurationMs = 400;

  /// Time the splash content is visible before redirect.
  static const int displayDurationMs = 2000;

  /// Extra delay before navigating away.
  static const int redirectDelayMs = 500;

  /// Total time until navigation: startDelay + display + redirectDelay.
  static const int totalSplashDurationMs =
      startDelayMs + displayDurationMs + redirectDelayMs;

  // Layout (factors of screen size)

  /// Logo/pin image height as factor of screen width (e.g. 0.2 = 20%).
  static const double imageHeightFactor = 0.2;

  /// Pin horizontal offset multiplier (fraction of width).
  static const double pinOffsetFactor = 0.135;

  /// Tagline vertical position as factor of screen height (e.g. 0.565 = 56.5%).
  static const double taglineTopFactor = 0.565;

  // Copy

  /// Tagline text shown on splash (e.g. "Fitness").
  static const String tagline = 'Fitness';
}
