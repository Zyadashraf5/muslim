import 'package:get/get.dart';
import 'package:hemaya/controllers/authController.dart';
import 'package:hemaya/controllers/homeController.dart';
import 'package:hemaya/controllers/masgedController.dart';
import 'package:hemaya/controllers/qrcodeController.dart';

import '../controllers/SplashController.dart';
import '../controllers/bottom_bar_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.lazyPut(() => BottomBarController(), fenix: true);
  }
}
