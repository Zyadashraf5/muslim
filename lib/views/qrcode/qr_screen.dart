import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:muslimapp/views/qrcode/scan.dart';

import '../../controllers/bottom_bar_controller.dart';
import '../movebar/bottom_move.dart';

class QR extends StatefulWidget {
  const QR({super.key});

  @override
  State<QR> createState() => _QRState();
}

class _QRState extends State<QR> {
  @override
  Widget build(BuildContext context) {
    // final BottomBarController bottomController = Get.find();
    // bottomController.currentIndex = 3;
    return Scaffold(
        //  floatingActionButton: const FloatingButton(),
        //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //   bottomNavigationBar: const BottomBar(),
        body: Scan());
  }
}
