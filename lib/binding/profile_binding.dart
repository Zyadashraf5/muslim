import 'package:get/get.dart';
import 'package:hemaya/controllers/authController.dart';
import 'package:hemaya/controllers/masgedController.dart';
import 'package:hemaya/controllers/qrcodeController.dart';

import '../controllers/SplashController.dart';

class ProfiledBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthControler>(AuthControler());
  }
}
