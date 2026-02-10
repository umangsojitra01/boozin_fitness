import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:boozin_fitness/app/routes/app_pages.dart';
import 'package:boozin_fitness/app/theme/app_theme.dart';

void main() {
  runApp(const BoozinFitnessApp());
}

class BoozinFitnessApp extends StatelessWidget {
  const BoozinFitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Boozin Fitness',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
