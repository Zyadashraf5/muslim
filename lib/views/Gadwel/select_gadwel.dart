import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslimapp/controllers/authController.dart';
import 'package:muslimapp/views/Gadwel/sagel_gadewel.dart';

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
            top: 80,
            right: 0,
            left: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/logo1.png",
                      height: 100,
                    ),
                    Text(
                      "وزارة الشؤون الاسلاميه و الدعوة و الارشاد ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                controller.role == 3
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: InkWell(
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
                        ),
                      )
                    : Container(
                        width: 0,
                        height: 0,
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: InkWell(
                    onTap: () {
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
                ),
              ],
            ),
          ),
        ],
      );
    }));
  }
}
