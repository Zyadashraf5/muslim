import 'package:get/get.dart';

import '../controllers/taskesController.dart';

class TasksBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => taskescontroller());
  }
}
