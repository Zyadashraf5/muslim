import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hemaya/controllers/GadwelController.dart';
import 'package:hemaya/controllers/homeController.dart';
import 'package:hemaya/controllers/signatureController.dart';
import 'package:hemaya/views/pdfs/pdf.dart';
import 'package:hemaya/views/task/widget/item_widget.dart';

import '../../controllers/bottom_bar_controller.dart';
import '../Gadwel/takree_gadwel.dart';
import '../admin/Dashbord_app.dart';
import '../loading/loading.dart';
import '../movebar/bottom_move.dart';

class signature extends GetView<SignatureController> {
  signature({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignatureController());
    return Scaffold(
      body: GetBuilder<SignatureController>(
        builder: (controller) {
          return controller.isLoading
              ? Center(
                  child: Loading(),
                )
              : Stack(
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
                      top: 250,
                      right: 10,
                      left: 10,
                      child: InkWell(
                        onTap: () async {
                          controller.selectedimageSignature =
                              await givesignatureImage();
                          controller.update();
                        },
                        child: Container(
                          width: 330,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 7,
                                blurRadius: 10,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            border: Border.all(
                                color: Colors.green.shade700, width: 4.0),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                                color: Colors.grey,
                              ),
                              Text(
                                "رفع صورة التوقيع",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "TajawalMedium",
                                    color: Colors.black),
                              ),
                              Image.asset(
                                "assets/doumo.png",
                                width: 40,
                                height: 60,
                                color: Colors.green,
                              ),
                            ],
                            mainAxisSize: MainAxisSize.min,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 400,
                      right: 10,
                      left: 10,
                      child: controller.selectedimageSignature != null
                          ? Container(
                              width: 300,
                              height: 200,
                              child: Center(
                                child: Image.file(
                                    controller.selectedimageSignature!),
                              ),
                            )
                          : controller.urlSignature != ""
                              ? Container(
                                  width: 300,
                                  height: 200,
                                  child: Center(
                                    child:
                                        Image.network(controller.urlSignature!),
                                  ),
                                )
                              : Container(),
                    ),
                    Positioned(
                        top: 700,
                        right: 10,
                        left: 10,
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  await controller.selectSignature();
                                  controller.update();
                                },
                                child: Container(
                                  height: 50,
                                  width: 380,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromARGB(255, 1, 191, 10)),
                                  child: Center(
                                    child: Text(
                                      "حفظ التوقيع ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "robot",
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ))
                  ],
                );
        },
      ),
    );
  }

  Future<File> givesignatureImage() async {
    print("fromFileImage");
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return File("");

    return File(returnedImage.path);
  }
}
