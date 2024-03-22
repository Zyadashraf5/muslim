import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hemaya/controllers/authController.dart';
import 'package:hemaya/models/UserModel.dart';
import 'package:hemaya/routes/app_pages.dart';
import 'package:hemaya/views/admin/Dashbord_app.dart';
import 'package:hemaya/views/login/login.dart';

class SplashController extends GetxController {
  bool _visible = false;

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    Future.delayed(Duration(seconds: 3), () async {
      _visible = true;
      AuthControler authControler = Get.put(AuthControler());
      final ssn = await authControler.getssn();
      if (ssn != "") {
        UserModel user = await authControler.getUser(ssn!);
        if (user.role == "4") {
          Get.offAll(DashbordApp());
        } else {
          Get.offAllNamed(Routes.home);
        }
      } else {
        Get.to(() => login());
      }
      update();
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  Widget getPhotoBackground() {
    return Image.asset(
      "assets/splachnewone.png",
    );
  }
}
