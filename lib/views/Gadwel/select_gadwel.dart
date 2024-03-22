import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemaya/controllers/authController.dart';
import 'package:hemaya/controllers/homeController.dart';
import 'package:hemaya/views/Gadwel/sagel_gadewel.dart';

import 'qustion_gadwel.dart';

class SelectGadwel extends StatelessWidget {
  const SelectGadwel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<AuthControler>(builder: (controller) {
      Get.put(AuthControler());
      return Stack(
        children: [
          Positioned(
            child: Image.asset(
              "assets/backgroud1.png",
            ),
            width: MediaQuery.of(context).size.width,
            right: 0,
          ),
          Positioned(
            top: 40,
            right: 0,
            left: 0,
            bottom: 40,
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo1.png",
                    height: 100,
                  ),
                  Text(
                    "وزارة الشؤون الإسلامية والدعوة والإرشاد",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "TajawalMedium",
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: controller.role == 3
                  ? MainAxisAlignment.spaceAround
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                controller.role == 3
                    ? InkWell(
                        onTap: () {
                          Get.to(QustionGadwel());
                        },
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/ic.png",
                              height: 140,
                            ),
                            Positioned(
                              top: 60,
                              right: 0,
                              left: 38,
                              child: Text(
                                "انشاء جدول",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "TajawalMedium",
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        width: 0,
                        height: 0,
                      ),
                InkWell(
                  onTap: () async {
                    HomeController homeController = Get.put(HomeController());
                    await homeController.getallGadwel();
                    Get.to(SagelGadewelPage());
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/ic.png",
                        height: 140,
                      ),
                      Positioned(
                        top: 60,
                        right: 0,
                        left: 38,
                        child: Text(
                          "سجل الجدول",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "TajawalMedium",
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }));
  }
}
