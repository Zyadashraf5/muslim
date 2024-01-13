import 'package:get/get.dart';
import 'package:muslimapp/controllers/authController.dart';
import 'package:muslimapp/controllers/masgedController.dart';
import 'package:muslimapp/controllers/qrcodeController.dart';

import '../controllers/SplashController.dart';

class ProfiledBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthControler>(AuthControler());
  }
}
