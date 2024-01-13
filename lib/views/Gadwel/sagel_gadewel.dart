import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslimapp/controllers/GadwelController.dart';
import 'package:muslimapp/controllers/homeController.dart';
import 'package:muslimapp/models/Gadwel.dart';
import 'package:muslimapp/views/pdfs/pdf.dart';
import 'package:muslimapp/views/pdfs/pdfScreenShot.dart';

class SagelGadewelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: Stack(
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
            right: 10,
            bottom: 0,
            child: GetBuilder<HomeController>(
              init: HomeController(), // Replace with your own controller
              builder: (controller) {
                return SingleChildScrollView(
                  child: Column(
                    children: controller.gadawel
                        .map((e) => gadwal(
                              gadwelModel: e,
                            ))
                        .toList(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class gadwal extends StatelessWidget {
  gadwal({
    super.key,
    required this.gadwelModel,
  });

  GadwelModel gadwelModel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Container(
            width: 330,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              border: Border.all(color: Colors.green.shade700, width: 4.0),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        "جدول الجولات",
                        style: TextStyle(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.bold,
                            fontFamily: "robot",
                            fontSize: 18),
                      ),
                      Text(
                        "تاريخ : 2023/10/10",
                        style: TextStyle(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.bold,
                            fontFamily: "robot",
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.visibility,
                          size: 30,
                          color: Colors.green,
                        ),
                        onPressed: () async {
                          GadwelController gadwelController =
                              Get.put(GadwelController());
                          gadwelController.currentGadwel = gadwelModel;
                          gadwelController.update();
                          Get.to(Pdf());
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.print,
                          size: 30,
                          color: Colors.green,
                        ),
                        onPressed: () async {
                          GadwelController gadwelController =
                              Get.put(GadwelController());
                          final currentMonth = DateTime.now().month;
                          final currentYear = DateTime.now().year;
                          gadwelController.currentGadwel =
                              await gadwelController.getCurrentMonth(
                                  currentMonth.toString(),
                                  currentYear.toString());
                          print("here");
                          gadwelController.update();

                          Get.to(screenshot(
                              currentGadwel: gadwelController.currentGadwel!));
                        },
                      ),
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                ),
              ],
            ),
          ),
          onTap: () async {
            // GadwelController gadwelController =
            //     Get.put(GadwelController());
            // final currentMonth = DateTime.now().month;
            // final currentYear = DateTime.now().year;
            // gadwelController.currentGadwel =
            //     await gadwelController.getCurrentMonth(
            //         currentMonth.toString(),
            //         currentYear.toString());
            // print("here");
            // gadwelController.update();
            // Get.to(Pdf());
          },
        ),
      );
    });
  }
}