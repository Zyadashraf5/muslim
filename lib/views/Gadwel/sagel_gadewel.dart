import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemaya/controllers/GadwelController.dart';
import 'package:hemaya/controllers/authController.dart';
import 'package:hemaya/controllers/homeController.dart';
import 'package:hemaya/models/Gadwel.dart';
import 'package:hemaya/views/Gadwel/editgadwel.dart';
import 'package:hemaya/views/pdfs/pdf.dart';
import 'package:hemaya/views/pdfs/pdfScreenShot.dart';

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
            top: 230,
            right: 10,
            left: 10,
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
  AuthControler authControler = Get.put(AuthControler());
  GadwelModel gadwelModel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Container(
            width: 365,
            height: 160,
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "جدول الجولات",
                        style: TextStyle(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.bold,
                            fontFamily: "TajawalMedium",
                            fontSize: 18),
                      ),
                      Text(
                        "تاريخ : ${gadwelModel!.year}/${gadwelModel!.month}",
                        style: TextStyle(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.bold,
                            fontFamily: "TajawalMedium",
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
                      gadwelModel.creator != authControler.ssn
                          ? Container()
                          : IconButton(
                              icon: Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.green,
                              ),
                              onPressed: () async {
                                await controller.deleteGadwelDocument(
                                    gadwelModel.year + gadwelModel.month);
                                controller.update();
                              },
                            ),
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
                      authControler.role != 3
                          ? Container()
                          : IconButton(
                              icon: Icon(
                                Icons.edit,
                                size: 30,
                                color: Colors.green,
                              ),
                              onPressed: () async {
                                GadwelController gadwelController =
                                    Get.put(GadwelController());
                                await gadwelController.signDoc(
                                    gadwelModel.year + gadwelModel.month);
                              },
                            ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          size: 30,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          controller.selectedDoc =
                              gadwelModel.year + gadwelModel.month;
                          controller.listShown = true;
                          controller.update();
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
                          gadwelController.currentGadwel = gadwelModel;
                          gadwelController.update();

                          Get.to(screenshot(
                              currentGadwel: gadwelController.currentGadwel!));
                        },
                      ),
                      gadwelModel.creator != authControler.ssn
                          ? Container()
                          : IconButton(
                              icon: Icon(
                                Icons.edit_document,
                                size: 30,
                                color: Colors.green,
                              ),
                              onPressed: () {
                                GadwelController gadwelController =
                                    Get.put(GadwelController());
                                gadwelController.currentGadwel = gadwelModel;

                                gadwelController.update();
                                Get.to(editgadwel(gadwelModel: gadwelModel));
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
