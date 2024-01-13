import 'package:get/get.dart';

import '../controllers/SplashController.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
