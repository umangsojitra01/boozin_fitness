import 'dart:io' show Platform;

enum AppPlatform {
  android,
  ios,
  other,
}

AppPlatform get currentPlatform {
  if (Platform.isAndroid) return AppPlatform.android;
  if (Platform.isIOS) return AppPlatform.ios;
  return AppPlatform.other;
}

bool get isAndroid => currentPlatform == AppPlatform.android;
bool get isIOS => currentPlatform == AppPlatform.ios;
