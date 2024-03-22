import 'package:get/get.dart';
import 'package:hemaya/controllers/masgedController.dart';
import 'package:hemaya/controllers/qrcodeController.dart';

import '../controllers/SplashController.dart';

class AddMasagedBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MasgedController>(MasgedController());
  }
}
