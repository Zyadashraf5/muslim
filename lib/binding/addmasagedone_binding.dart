import 'package:get/get.dart';
import 'package:muslimapp/controllers/masgedController.dart';
import 'package:muslimapp/controllers/qrcodeController.dart';

import '../controllers/SplashController.dart';

class AddMasagedoneBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MasgedController>(MasgedController());
  }
}
