import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:muslimapp/routes/app_pages.dart';
import 'package:muslimapp/views/Inspection%20tours/Data_masaged.dart';
import 'package:muslimapp/views/Inspection%20tours/esthlak.dart';
import 'package:muslimapp/views/Inspection%20tours/malfat.dart';
import 'package:muslimapp/views/Inspection%20tours/documents.dart';
import 'package:muslimapp/views/Inspection%20tours/location.dart';
import 'package:muslimapp/views/loading/loading.dart';

import '../../controllers/masgedController.dart';
import 'Infringements.dart';

class InspectionToursOne extends GetView<MasgedController> {
  InspectionToursOne({super.key});
  bool bayanat = false;
  bool t3adyat = false;
  bool m5alfat = false;
  bool watha2ek = false;

  get selectedOption => null;
  bool map = true;
  @override
  Widget build(BuildContext context) {
    Get.put(MasgedController());
    return Scaffold(body: GetBuilder<MasgedController>(
      builder: (controller) {
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
              child: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/logo1.png",
                        height: 100,
                      ),
                      Text(
                        "وزارة الشؤون الاسلاميه و الدعوة و الارشاد ",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "TajawalMedium",
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //top 180 left 150

            Positioned(
              top: 180,
              left: 130,
              child: Text(" :الرجاء تعبئة البيانات التالية",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "TajawalBlack",
                      color: Colors.black87)),
            ),
            //top 240 left 60ظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظظ

            controller.isLoading
                ? Positioned(
                    left: 150,
                    right: 150,
                    top: 350,
                    bottom: 350,
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      color: Colors.green.shade300,
                    ))
                : Positioned(
                    top: 240,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          item("موقع المسجد", Icons.arrow_back_ios, () {
                            Get.to(LocationPage());
                          },
                              "assets/locationaa.png",
                              width: 30,
                              height: 60,
                              controller.location != LatLng(0, 0)
                                  ? Colors.green
                                  : Colors.grey),
                          item(
                              "بيانات المسجد",
                              width: 40,
                              height: 30,
                              Icons.arrow_back_ios, () {
                            Get.to(DataMasaged());
                          },
                              "assets/cvbbn.png",
                              controller.namemasagedController.text.isNotEmpty &&
                                      controller.masgedwaseraController.text
                                          .isNotEmpty &&
                                      controller
                                          .branchController.text.isNotEmpty &&
                                      controller.GovernorateController.text
                                          .isNotEmpty &&
                                      controller
                                          .CenterController.text.isNotEmpty &&
                                      controller.DistrictnameController.text
                                          .isNotEmpty
                                  ? Colors.green
                                  : Colors.grey),
                          item(
                              "التعديات",
                              width: 40,
                              height: 70,
                              Icons.arrow_back_ios, () {
                            Get.to(Infringements());
                          },
                              "assets/zxcvv.png",
                              Infringement.value ||
                                      Infringement1.value ||
                                      Infringement2.value
                                  ? Colors.green
                                  : Colors.grey),
                          item(
                              "الملاحظات",
                              width: 35,
                              height: 50,
                              Icons.arrow_back_ios, () {
                            Get.to(malfat());
                          },
                              "assets/qweerr.png",
                              controller.mo5alfat!.isNotEmpty
                                  ? Colors.green
                                  : Colors.grey),
                          item(
                              "استهلاك عالي",
                              width: 35,
                              height: 50,
                              Icons.arrow_back_ios, () {
                            Get.to(esthlak());
                          },
                              "assets/qweerr.png",
                              controller.esthlak!.isNotEmpty
                                  ? Colors.green
                                  : Colors.grey),
                          item(
                              "الوثائق",
                              width: 35,
                              height: 50,
                              Icons.arrow_back_ios, () {
                            Get.to(documents());
                          },
                              "assets/fghj.png",
                              controller.selectedImagegalley != null
                                  ? Colors.green
                                  : Colors.grey),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "أقر بأن جميع البيانات المدخلة صحيحة",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontFamily: "robot"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GFRadio(
                                type: GFRadioType.custom,
                                activeIcon:
                                    Icon(Icons.check, color: Colors.white),
                                radioColor: Colors.green,
                                size: GFSize.SMALL,
                                activeBgColor: Colors.green,
                                inactiveBorderColor: Colors.grey,
                                activeBorderColor: Colors.green,
                                value: controller.isSelected ? 1 : 0,
                                groupValue: controller.seletedtaker,
                                onChanged: (value) {
                                  controller.isSelected = !controller
                                      .isSelected; // Toggle the isSelected state
                                  controller.seletedtaker =
                                      controller.isSelected ? 1 : null;
                                  controller.update();
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: GestureDetector(
                              onTap: () async {
                                if (!controller.isSelected) {
                                  SnackBar snackBar = SnackBar(
                                    content: Text("الرجاء الموافقة على الشروط"),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 2),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  return;
                                } else if (controller
                                        .namemasagedController.text ==
                                    "") {
                                  SnackBar snackBar = SnackBar(
                                    content: Text("الرجاء ادخال بيانات المسجد"),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 2),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  return;
                                } else if (controller.location ==
                                    LatLng(0, 0)) {
                                  SnackBar snackBar = SnackBar(
                                    content: Text("الرجاء ادخال موقع المسجد"),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 2),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  return;
                                }

                                controller.isLoading = true;
                                controller.update();
                                await controller.createMasged(
                                    controller.namemasagedController.text,
                                    controller.ssn,
                                    controller.selectedImagegalley,
                                    context);
                                controller.isLoading = false;
                                controller.update();
                              },
                              child: Container(
                                height: 40,
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: controller.isSelected
                                        ? Colors.green.shade300
                                        : Colors.red.shade300),
                                child: const Center(
                                  child: Text(
                                    "ارسال ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        );
      },
    ));
  }
}

Widget item(
    String text, IconData icon, Function? onTap, String image, Color iconColor,
    {required int width, required int height}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        width: 330,
        height: 100,
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 40,
                color: iconColor,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "TajawalMedium",
                    color: Colors.black),
              ),
              Image.asset(
                image,
                width: width.toDouble(),
                height: height.toDouble(),
                color: Colors.green,
              ),
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ),
    ),
  );
}
