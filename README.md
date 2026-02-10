# Boozin Fitness

Flutter app: **today’s steps** and **active calories** with progress to 15,000 steps / 1,000 kcal. GetX + `health` (Health Connect on Android, Apple Health on iOS).

## Routes

| Route | Path | Screen | Binding |
|-------|------|--------|---------|
| `Routes.SPLASH` | `/splash` | SplashView | SplashBinding |
| `Routes.HOME` | `/home` | HomeView | HomeBinding |

- **Initial:** `AppPages.INITIAL` = SPLASH. After splash: `Get.offAllNamed(Routes.HOME)` (stack replaced, no back to splash).
- **Flow:** Splash → (fixed delay ~3.7s) → Home.

## Folder structure

```
lib/
├── main.dart
└── app/
    ├── core/constants/, platform/, utils/
    ├── data/providers/health_provider.dart
    ├── domain/entities/health_summary.dart
    ├── modules/splash/  (bindings, constants, controllers, views)
    ├── modules/home/   (bindings, constants, controllers, views, widgets/stats_card)
    ├── routes/app_pages.dart, app_routes.dart
    └── theme/app_theme.dart, app_text_styles.dart
```

- **core:** constants, platform (Android/iOS), format utils.
- **data:** `HealthProvider` only — single place for `health` package (configure, availability, permissions, today steps/calories).
- **domain:** `HealthSummary` entity; no repo layer.
- **modules:** per-feature bindings, constants, controllers, views, widgets.
- **routes:** GetPage list + path strings; bindings per page.

## Hard logic

**Splash** (`SplashController` + `SplashConstants`): Start delay 1200ms → pin animation → logo fade (after 200ms) → “Fitness” text when pin completes. After total 3700ms, `Get.offAllNamed(Routes.HOME)`. All delays/callbacks check `!isClosed` before acting.

**Home** (`HomeController.loadHealthData`): (1) `isAvailable()` → if no, `_applyFallback(msg)` and return. (2) `requestPermissions()` → if no, fallback and return. (3) `getTodaySummary()` → set steps/calories. (4) On exception → fallback. Fallback = mock steps 13,112, mock calories 500, `isFallbackData = true`, set message. Pull-to-refresh = same flow.

**HealthProvider:** Configure once. Android = Health Connect available; iOS = steps type available. Today = midnight to now. Steps via `getTotalStepsInInterval`, calories via `ACTIVE_ENERGY_BURNED` sum. Returns 0 on unavailability/error. No caching.

**Constants:** `HomeConstants`: stepsGoal 15000, caloriesGoal 1000, mockSteps 13112, mockCalories 500. `SplashConstants`: all timing (startDelay, pin, logo, total 3700ms).

**Bindings:** Splash → SplashController. Home → HealthProvider, then HomeController(HealthProvider).

## Tech stack & architecture

- Flutter ^3.10.1, GetX (state, routing, bindings), `health` ^13.3.1, Material 3 (system theme).
- One controller per screen; `HealthProvider` is sole health entry; views → controllers → HealthProvider.

## Run & reference

- **Prerequisites:** Flutter SDK, Android Studio / Xcode. `flutter pub get`.
- **Android:** `flutter run` (API 26+). Health Connect required for real data.
- **iOS:** Add HealthKit capability in Xcode; real data needs **physical device** (simulator = sample data).
- **Permissions:** Requested on home load; deny = sample data only. No background sync; data on load + pull-to-refresh.
- **Health:** Android = Health Connect + READ_STEPS, READ_ACTIVE_CALORIES_BURNED. iOS = HealthKit + usage descriptions in Info.plist.
- **Dark mode:** `ThemeMode.system`; themes in `app/theme/app_theme.dart`.
- **License:** Private (`publish_to: 'none'`).
