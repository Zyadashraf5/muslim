import 'package:get/get.dart';

import '../controllers/bottom_bar_controller.dart';

class BottomBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomBarController(), fenix: true);
  }
}
