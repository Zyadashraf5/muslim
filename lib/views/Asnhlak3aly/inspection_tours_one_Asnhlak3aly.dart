import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/Asnhlak3alyController.dart';
import 'Asnhlak3aly.dart';
import 'Data_masaged_Asnhlak3aly.dart';
import 'Infringements_Asnhlak3aly.dart';
import 'documents_Asnhlak3aly.dart';
import 'location_Asnhlak3alyController.dart';
import 'malfat_Asnhlak3aly.dart';

class InspectionToursOneAsnhlak3aly extends GetView<Asnhlak3alyController> {
  InspectionToursOneAsnhlak3aly({super.key});
  bool bayanat = false;
  bool t3adyat = false;
  bool m5alfat = false;
  bool watha2ek = false;

  get selectedOption => null;
  bool map = true;
  @override
  Widget build(BuildContext context) {
    Get.put(Asnhlak3alyController());
    return Scaffold(body: GetBuilder<Asnhlak3alyController>(
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
            Positioned(
              top: 240,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    item(
                        "موقع المسجد",
                        width: 30,
                        height: 60,
                        Icons.arrow_back_ios, () {
                      Get.to(LocationPageAsnhlak3aly());
                    },
                        "assets/locationaa.png",
                        controller.location != LatLng(0, 0)
                            ? Colors.green
                            : Colors.grey),
                    item(
                        "بيانات المسجد",
                        width: 40,
                        height: 30,
                        Icons.arrow_back_ios, () {
                      Get.to(DataMasagedAsnhlak3aly());
                    },
                        "assets/cvbbn.png",
                        controller.namemasagedController.text.isNotEmpty &&
                                controller
                                    .masgedwaseraController.text.isNotEmpty &&
                                controller.branchController.text.isNotEmpty &&
                                controller
                                    .GovernorateController.text.isNotEmpty &&
                                controller.CenterController.text.isNotEmpty &&
                                controller
                                    .DistrictnameController.text.isNotEmpty &&
                                controller.streetnameController.text.isNotEmpty
                            ? Colors.green
                            : Colors.grey),
                    item(
                        "استهلاك عالي",
                        width: 40,
                        height: 70,
                        Icons.arrow_back_ios, () {
                      Get.to(Asnhlak3aly());
                    },
                        "assets/asdf.png",
                        controller.Asnhlak3alyController1.text.isNotEmpty
                            ? Colors.green
                            : Colors.grey),
                    item(
                        "التعديات",
                        width: 40,
                        height: 70,
                        Icons.arrow_back_ios, () {
                      Get.to(InfringementsAsnhlak3aly());
                    },
                        "assets/zxcvv.png",
                        InfringementM.value ||
                                Infringement1M.value ||
                                Infringement2M.value ||
                                Infringement3M.value ||
                                Infringement4M.value ||
                                Infringement5M.value ||
                                Infringement6M.value ||
                                Infringement7M.value ||
                                Infringement8M.value ||
                                Infringement9M.value ||
                                Infringement10M.value ||
                                Infringement11M.value ||
                                Infringement12M.value ||
                                Infringement13M.value ||
                                Infringement14M.value ||
                                Infringement15M.value ||
                                Infringement16M.value ||
                                Infringement17M.value
                            ? Colors.green
                            : Colors.grey),
                    item(
                        "المخالفات",
                        width: 35,
                        height: 50,
                        Icons.arrow_back_ios, () {
                      Get.to(malfatAsnhlak3aly());
                    },
                        "assets/qweerr.png",
                        Irregularities1M.value ||
                                Irregularities2M.value ||
                                Irregularities3M.value ||
                                Irregularities4M.value ||
                                Irregularities5M.value ||
                                Irregularities6M.value ||
                                Irregularities7M.value ||
                                Irregularities8M.value ||
                                Irregularities9M.value ||
                                Irregularities10M.value ||
                                Irregularities11M.value ||
                                Irregularities12M.value ||
                                Irregularities13M.value ||
                                Irregularities14M.value ||
                                Irregularities15M.value ||
                                Irregularities16M.value ||
                                Irregularities17M.value ||
                                Irregularities18M.value ||
                                Irregularities19M.value ||
                                Irregularities20M.value ||
                                Irregularities21M.value ||
                                Irregularities22M.value ||
                                Irregularities23M.value ||
                                Irregularities24M.value ||
                                Irregularities25M.value
                            ? Colors.green
                            : Colors.grey),
                    item("الوثائق", width: 35, height: 50, Icons.arrow_back_ios,
                        () {
                      Get.to(documentsAsnhlak3aly());
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
                          activeIcon: Icon(Icons.check, color: Colors.white),
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
                        onTap: () async {},
                        child: Container(
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.grey.shade300),
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
