import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslimapp/controllers/qrcodeController.dart';
import 'package:muslimapp/views/home/home_screen.dart';
import 'package:muslimapp/views/Map/map_screen.dart';
import 'package:muslimapp/views/profile/profile.screen.dart';
import 'package:muslimapp/views/qrcode/qr_screen.dart';
import 'package:muslimapp/views/task/taskes.screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/bottom_bar_controller.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class FloatingButton extends GetView<BottomBarController> {
  FloatingButton({super.key});
  QrcodeController Qrcontroller = Get.put(QrcodeController());

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Qrcontroller.scanQr();
        },
        backgroundColor: Colors.white,
        child: Image.asset(
          'assets/qr.png',
          fit: BoxFit.fill,
          scale: 0.1,
        ));
  }
}

class BottomBar extends GetView<BottomBarController> {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: controller.iconList,
      //labels: controller.labelList,

      activeColor: Colors.grey,
      inactiveColor: Color.fromRGBO(62, 173, 127, 1),
      iconSize: 30,
      shadow: BoxShadow(
        color: Colors.black.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 10,
        offset: const Offset(0, 3), // changes position of shadow
      ),
      backgroundColor: Colors.white,
      activeIndex: controller.currentIndex,
      gapLocation: GapLocation.center,
      elevation: 10,
      blurEffect: true,

      notchSmoothness: NotchSmoothness.softEdge,
      onTap: (index) => controller.changePage(index),
      //other params
    );
  }
}
