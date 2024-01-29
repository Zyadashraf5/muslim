import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslimapp/controllers/GadwelController.dart';
import 'package:muslimapp/controllers/authController.dart';
import 'package:muslimapp/controllers/homeController.dart';
import 'package:muslimapp/controllers/masgedController.dart';
import 'package:muslimapp/models/Gadwel.dart';
import 'package:muslimapp/models/Masagedy.dart';
import 'package:muslimapp/models/UserModel.dart';
import 'package:muslimapp/views/Gadwel/editgadwel.dart';
import 'package:muslimapp/views/Inspection%20tours/Infringements.dart';
import 'package:muslimapp/views/pdfs/pdf.dart';
import 'package:muslimapp/views/pdfs/pdfScreenShot.dart';
import 'package:muslimapp/views/pdfs/screenShotMasged.dart';
import 'package:muslimapp/views/task/widget/item_widget.dart';

import '../../controllers/bottom_bar_controller.dart';
import '../Gadwel/takree_gadwel.dart';
import '../admin/Dashbord_app.dart';
import '../movebar/bottom_move.dart';
import '../pdfs/pdf_inspection.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomBarController bottomController = Get.find();
    bottomController.currentIndex = 3;
    Get.put(HomeController());
    UserModel? user;

    return Scaffold(
      floatingActionButton: FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomBar(),
      body: GetBuilder<HomeController>(
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
                top: 40,
                right: 35,
                left: 35,
                bottom: 40,
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
              Positioned(
                top: 250,
                right: 0,
                left: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: controller.ownGadawel.length > 0 ||
                          controller.allMasaged.length > 0
                      ? Column(children: [
                          ...controller.ownGadawel
                              .map((e) => gadwal(
                                    gadwelModel: e,
                                  ))
                              .toList(),
                          ...controller.allMasaged
                              .map((e) => inspectiontours(
                                    masgedModel: e,
                                  ))
                              .toList(),
                        ])
                      : Container(),
                ),
              ),
              controller.listShown && controller.allUsers.length > 0
                  ? Positioned(
                      top: 300,
                      right: 50,
                      left: 50,
                      bottom: 200,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                              color: Colors.green.shade700, width: 4.0),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "اختر الموظف",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            DropdownButton(
                              hint: Text(
                                "اختر",
                              ),
                              dropdownColor: Colors.white,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              alignment: Alignment.center,
                              value: user != null
                                  ? user!.ssn
                                  : controller.allUsers[0].ssn,
                              items: controller.allUsers.map((valueitem) {
                                return DropdownMenuItem<String>(
                                  alignment: Alignment.center,
                                  value: valueitem.ssn,
                                  child: Text(
                                    valueitem.name!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newvalue) {
                                user = controller.allUsers.firstWhere(
                                    (element) =>
                                        element.ssn == newvalue.toString());
                                controller.selectedUser = newvalue.toString();
                                controller.update();
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await controller.shareDoc(
                                    controller.selectedUser,
                                    controller.selectedDoc);
                                controller.listShown = false;
                                controller.update();
                              },
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.green.shade300),
                                child: Center(
                                  child: Text(
                                    "ارسال",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "TajawalMedium",
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.listShown = false;
                                controller.update();
                              },
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.red.shade300),
                                child: Center(
                                  child: Text(
                                    "الغاء",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "TajawalMedium",
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
              controller.listShown2 && controller.allUsers.length > 0
                  ? Positioned(
                      top: 300,
                      right: 50,
                      left: 50,
                      bottom: 200,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                              color: Colors.green.shade700, width: 4.0),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "اختر الموظف",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            DropdownButton(
                              hint: Text(
                                "اختر",
                              ),
                              dropdownColor: Colors.white,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              alignment: Alignment.center,
                              value: user != null
                                  ? user!.ssn
                                  : controller.allUsers[0].ssn,
                              items: controller.allUsers.map((valueitem) {
                                return DropdownMenuItem<String>(
                                  alignment: Alignment.center,
                                  value: valueitem.ssn,
                                  child: Text(
                                    valueitem.name!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newvalue) {
                                user = controller.allUsers.firstWhere(
                                    (element) =>
                                        element.ssn == newvalue.toString());
                                controller.selectedUser = newvalue.toString();
                                controller.update();
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () async {
                                MasgedController masgedController =
                                    Get.put(MasgedController());
                                masgedController.shareDoc(
                                    masgedController.currentShare!,
                                    controller.selectedUser);

                                controller.listShown2 = false;
                                controller.update();
                              },
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.green.shade300),
                                child: Center(
                                  child: Text(
                                    "ارسال",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "TajawalMedium",
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.listShown2 = false;
                                controller.update();
                              },
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.red.shade300),
                                child: Center(
                                  child: Text(
                                    "الغاء",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "TajawalMedium",
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}

class inspectiontours extends StatelessWidget {
  inspectiontours({
    required this.masgedModel,
    super.key,
  });
  MasagedyModel masgedModel;
  AuthControler authControler = Get.put(AuthControler());
  @override
  Widget build(BuildContext context) {
    Get.put(MasgedController());
    return GetBuilder<MasgedController>(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Container(
            width: 365,
            height: 180,
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
                        " الجولات التفقديه  ",
                        style: TextStyle(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.bold,
                            fontFamily: "TajawalMedium",
                            fontSize: 18),
                      ),
                      Text(
                        "مسجد : ${masgedModel.namemasaged}",
                        style: TextStyle(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.bold,
                            fontFamily: "TajawalMedium",
                            fontSize: 18),
                      ),
                      Text(
                        "تاريخ : ${masgedModel.date!.split(" ")[0].toString()}",
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
                      masgedModel.creator != authControler.ssn
                          ? Container()
                          : IconButton(
                              icon: Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.green,
                              ),
                              onPressed: () async {
                                await context.deleteMasgedDocument(
                                    masgedModel.namemasaged!);
                                HomeController homeController =
                                    Get.put(HomeController());
                                await homeController.getAllMasaged();
                                homeController.update();
                                context.update();
                              },
                            ),
                      IconButton(
                        icon: Icon(
                          Icons.visibility,
                          size: 30,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          Get.to(PdfInspection(
                            masgedModel: masgedModel,
                          ));
                        },
                      ),
                      authControler.role != 2
                          ? Container()
                          : IconButton(
                              icon: Icon(
                                Icons.edit,
                                size: 30,
                                color: Colors.green,
                              ),
                              onPressed: () async {
                                MasgedController masgedController =
                                    Get.put(MasgedController());
                                await masgedController
                                    .signDoc(masgedModel.namemasaged!);
                                await masgedController.getAll();
                                HomeController homeController =
                                    Get.put(HomeController());
                                await homeController.getAllMasaged();

                                masgedController.update();
                              },
                            ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          size: 30,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          HomeController homeController =
                              Get.put(HomeController());
                          context.currentShare = masgedModel.namemasaged!;
                          context.update();
                          homeController.listShown2 = true;
                          homeController.update();
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.print,
                          size: 30,
                          color: Colors.green,
                        ),
                        onPressed: () async {
                          Get.to(screenshotMasged(masagedyModel: masgedModel));
                        },
                      ),
                      masgedModel.creator != authControler.ssn
                          ? Container()
                          : IconButton(
                              icon: Icon(
                                Icons.edit_document,
                                size: 30,
                                color: Colors.green,
                              ),
                              onPressed: () {
                                // Add your onPressed logic here
                                //TODO: edit gadwel
                              },
                            ),
                      IconButton(
                        icon: Icon(
                          Icons.archive,
                          size: 30,
                          color: Colors.green,
                        ),
                        onPressed: () async {
                          await context.archiveDoc(masgedModel);
                          HomeController homeController =
                              Get.put(HomeController());
                          await homeController.getAllMasaged();
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
                      IconButton(
                        icon: Icon(
                          Icons.archive,
                          size: 30,
                          color: Colors.green,
                        ),
                        onPressed: () async {
                          await controller
                              .archiveDoc(gadwelModel.year + gadwelModel.month);
                          HomeController homeController =
                              Get.put(HomeController());
                          await homeController.myGadawel();
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
