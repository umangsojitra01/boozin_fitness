/// Shared constants for the Home module (goals and fallback/sample data).
abstract final class HomeConstants {
  HomeConstants._();

  /// Default daily steps goal (display and progress).
  static const int stepsGoal = 15000;

  /// Default daily active calories goal in kcal (display and progress).
  static const int caloriesGoal = 1000;

  /// Sample steps shown when health data is unavailable (fallback).
  static const int mockSteps = 13112;

  /// Sample calories shown when health data is unavailable (fallback).
  static const double mockCalories = 500.0;
}
