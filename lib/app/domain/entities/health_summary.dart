class HealthSummary {
  const HealthSummary({
    required this.steps,
    this.activeCalories,
    this.date,
  });

  final int steps;
  final double? activeCalories;
  final DateTime? date;

  HealthSummary copyWith({
    int? steps,
    double? activeCalories,
    DateTime? date,
  }) {
    return HealthSummary(
      steps: steps ?? this.steps,
      activeCalories: activeCalories ?? this.activeCalories,
      date: date ?? this.date,
    );
  }
}
