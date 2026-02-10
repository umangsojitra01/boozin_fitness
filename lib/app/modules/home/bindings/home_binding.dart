import 'package:get/get.dart';

import 'package:boozin_fitness/app/data/providers/health_provider.dart';
import 'package:boozin_fitness/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthProvider>(() => HealthProvider());
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<HealthProvider>()),
    );
  }
}
