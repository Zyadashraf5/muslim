import 'package:get/get.dart';
import 'package:muslimapp/controllers/authController.dart';
import 'package:muslimapp/controllers/homeController.dart';
import 'package:muslimapp/controllers/masgedController.dart';
import 'package:muslimapp/controllers/qrcodeController.dart';

import '../controllers/SplashController.dart';
import '../controllers/bottom_bar_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.lazyPut(() => BottomBarController(), fenix: true);
  }
}
