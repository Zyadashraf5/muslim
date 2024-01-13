import 'package:get/get.dart';
import 'package:muslimapp/controllers/qrcodeController.dart';

import '../controllers/SplashController.dart';

class ReadBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<QrcodeController>(QrcodeController());
  }
}
