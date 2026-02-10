import 'package:health/health.dart';

import 'package:boozin_fitness/app/core/platform/app_platform.dart';
import 'package:boozin_fitness/app/domain/entities/health_summary.dart';

class HealthProvider {
  HealthProvider() : _health = Health();

  final Health _health;
  bool _configured = false;

  static const HealthDataType _stepsType = HealthDataType.STEPS;
  static const List<HealthDataType> _caloriesTypes = [
    HealthDataType.ACTIVE_ENERGY_BURNED,
  ];
  static List<HealthDataType> get _permissionTypes => [_stepsType, ..._caloriesTypes];

  Future<void> configure() async {
    if (_configured) return;
    await _health.configure();
    _configured = true;
  }

  Future<bool> isAvailable() async {
    await configure();
    if (isAndroid) {
      return _health.isHealthConnectAvailable();
    }
    if (isIOS) {
      return _health.isDataTypeAvailable(_stepsType);
    }
    return false;
  }

  Future<bool> requestPermissions() async {
    await configure();
    if (isAndroid) {
      final available = await _health.isHealthConnectAvailable();
      if (!available) return false;
      final has = await _health.hasPermissions(_permissionTypes);
      if (has == true) return true;
    }
    return _health.requestAuthorization(_permissionTypes);
  }

  Future<int> getTodaySteps() async {
    final (start, end) = _todayRange();
    await configure();
    try {
      if (isAndroid && !await _health.isHealthConnectAvailable()) {
        return 0;
      }
      final value = await _health.getTotalStepsInInterval(start, end);
      return value ?? 0;
    } catch (_) {
      return 0;
    }
  }

  Future<double> getTodayActiveCalories() async {
    final (start, end) = _todayRange();
    await configure();
    try {
      if (isAndroid && !await _health.isHealthConnectAvailable()) {
        return 0;
      }
      final points = await _health.getHealthDataFromTypes(
        types: _caloriesTypes,
        startTime: start,
        endTime: end,
      );
      double total = 0;
      for (final p in points) {
        final v = p.value;
        if (v is NumericHealthValue) total += v.numericValue;
      }
      return total;
    } catch (_) {
      return 0;
    }
  }

  Future<HealthSummary> getTodaySummary() async {
    final now = DateTime.now();
    final steps = await getTodaySteps();
    final activeCalories = await getTodayActiveCalories();
    return HealthSummary(
      steps: steps,
      activeCalories: activeCalories,
      date: now,
    );
  }

  static (DateTime start, DateTime end) _todayRange() {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day);
    return (start, now);
  }
}
