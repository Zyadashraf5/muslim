import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hemaya/controllers/SplashController.dart';
import 'package:hemaya/views/login/login.dart';
import 'package:video_player/video_player.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: GetBuilder<SplashController>(
        builder: (SplashController controller) {
          return Center(
            child: Center(
              child: controller.getPhotoBackground(),
            ),
          );
        },
      ),
    );
  }
}
