import 'package:get/get.dart';
import 'package:hemaya/controllers/qrcodeController.dart';

import '../controllers/SplashController.dart';

class ScanBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<QrcodeController>(QrcodeController());
  }
}
