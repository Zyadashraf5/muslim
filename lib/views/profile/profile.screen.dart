import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:muslimapp/controllers/GadwelController.dart';
import 'package:muslimapp/controllers/homeController.dart';
import 'package:muslimapp/controllers/signatureController.dart';
import 'package:muslimapp/views/login/login.dart';
import 'package:muslimapp/views/mshrf%20allgnh/lagna.dart';
import 'package:muslimapp/views/profile/myAnalytics.dart';
import 'package:muslimapp/views/task/ownGadawel.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:muslimapp/controllers/authController.dart';
import 'package:muslimapp/models/UserModel.dart';
import 'package:muslimapp/routes/app_pages.dart';

import 'package:muslimapp/views/admin/add_user.dart';
import 'package:muslimapp/views/loading/loading.dart';
import 'package:muslimapp/views/select_masagedy/select_masagedy.dart';
import 'package:muslimapp/views/task/taskes.screen.dart';

import '../../controllers/bottom_bar_controller.dart';
import '../Dutyofcommitteemember/Duty_of_committee_member.dart';

import '../Gadwel/select_gadwel.dart';
import '../a3da2.dart/a3da2.dart';
import '../inspectionGenteral/Inspection_tours.dart';
import '../movebar/bottom_move.dart';
import '../pdfs/pdf_inspection.dart';
import '../signature/signature.dart';
import '../t3dyat_walm5alfat/Infringements_duty.dart';
import '../t3dyat_walm5alfat/t3dyat_walm5alfat_page.dart';

class profile extends GetView<AuthControler> {
  @override
  Widget build(BuildContext context) {
    Get.put(AuthControler());
    final BottomBarController bottomController = Get.find();
    bottomController.currentIndex = 0;

    return Scaffold(
        floatingActionButton: FloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const BottomBar(),
        body: GetBuilder<AuthControler>(
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
                        right: 35,
                        left: 35,
                        bottom: 40,
                        child: Center(
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/logo1.png",
                                height: 100,
                              ),
                              Text(
                                "وزارة الشؤون الاسلامية و الدعوة و الارشاد ",
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
                        top: 180,
                        right: 50,
                        left: 50,
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.green, width: 2.0),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: controller.user != null
                                            ? Text(
                                                //controller.user!.roleName,
                                                controller.user!.name,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "TajawalMedium",
                                                  color: Colors.black,
                                                ),
                                              )
                                            : CircularProgressIndicator()),
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.person_outline,
                                        size: 35,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("إدارة حماية مرافق المساجد وخدماتها ",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "TajawalMedium",
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: 300,
                          left: 0,
                          right: 0,
                          bottom: 10,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Wrap(
                                  runSpacing: 10,
                                  spacing: 5,
                                  textDirection: TextDirection.rtl,
                                  alignment: WrapAlignment.center,
                                  children: [
                                    if (int.parse(controller.user!.role) == 1)
                                      customIconWithText(
                                        "مهام عضو اللجنه",
                                        "assets/task.png",
                                        // Replace with the actual image path
                                        () {
                                          Get.to(DutyMember());
                                        },
                                      ),
                                    if (int.parse(controller.user!.role) == 3)
                                      customIconWithText("مهام مشرف اللجان  ",
                                          "assets/task.png", () {
                                        Get.to(DutyMember());
                                      }),
                                    if (int.parse(controller.user!.role) == 2)
                                      customIconWithText(
                                        "مهام مدير حمايه",
                                        "assets/task.png",
                                        // Replace with the actual image path
                                        () {
                                          Get.toNamed(Routes.tasks);
                                        },
                                      ),
                                    if (int.parse(controller.user!.role) == 1 ||
                                        int.parse(controller.user!.role) == 2 ||
                                        int.parse(controller.user!.role) == 3)
                                      customIconWithText(
                                        "الجولات التفقديه",
                                        "assets/g2.png",
                                        // Replace with the actual image path
                                        () {
                                          Get.to(InspectionTours());
                                        },
                                      ),
                                    if (int.parse(controller.user!.role) == 1 ||
                                        int.parse(controller.user!.role) == 2 ||
                                        int.parse(controller.user!.role) == 3)
                                      customIconWithText(
                                        "الملاحظات\n والتعديات",
                                        "assets/mok.png",
                                        () {
                                          Get.to(t3dyatwalm5alfat());
                                        },
                                      ),
                                    if (int.parse(controller.user!.role) == 2)
                                      customIconWithText(
                                          " مشرف اللجان ", "assets/profile.png",
                                          () async {
                                        AuthControler authControler =
                                            Get.put(AuthControler());
                                        await authControler.getUserByRule("3");
                                        Get.to(lagna());
                                      }),
                                    if (int.parse(controller.user!.role) == 2 ||
                                        int.parse(controller.user!.role) == 3)
                                      customIconWithText(
                                          "الاعضاء", "assets/pepeles.png",
                                          () async {
                                        AuthControler authControler =
                                            Get.put(AuthControler());
                                        await authControler.getUserByRule("1");
                                        Get.to(a3da2());
                                      }),
                                    if (int.parse(controller.user!.role) == 1 ||
                                        int.parse(controller.user!.role) == 2 ||
                                        int.parse(controller.user!.role) == 3)
                                      customIconWithText(
                                        "التوقيع",
                                        "assets/pen.png",
                                        () async {
                                          Get.to(signature());
                                        },
                                      ),
                                    if (int.parse(controller.user!.role) == 1 ||
                                        int.parse(controller.user!.role) == 2 ||
                                        int.parse(controller.user!.role) == 3)
                                      customIconWithText(
                                        "الاحصائيات",
                                        "assets/satic.png",
                                        () async {
                                          HomeController homeController =
                                              Get.put(HomeController());
                                          await homeController.getMyAnalytics();
                                          Get.to(MyAnalytics());
                                        },
                                      ),
                                    if (int.parse(controller.user!.role) == 1)
                                      customIconWithText(
                                        "جدول الجولات",
                                        "assets/gadwel.png",
                                        () async {
                                          GadwelController gadwelController =
                                              Get.put(GadwelController());
                                          await gadwelController.ownGadwel();
                                          Get.to(OwnGadawel());
                                        },
                                      ),
                                    if (int.parse(controller.user!.role) == 2 ||
                                        int.parse(controller.user!.role) == 3)
                                      customIconWithText(
                                        "جدول الجولات",
                                        "assets/gadwel.png",
                                        () {
                                          Get.to(SelectGadwel());
                                        },
                                      ),
                                    customIconWithText(
                                      "تسجبل الخروج",
                                      "assets/layer.png",
                                      () async {
                                        await controller.signOut();
                                        Get.offAll(() => login());
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 90, right: 280),
                                      child: InkWell(
                                        onTap: () {
                                          launch(
                                              "tel://1933"); // Replace "1234567890" with the desired phone number
                                        },
                                        child: CircleAvatar(
                                          radius: 28,
                                          backgroundImage: AssetImage(
                                              "assets/customerserves.png"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                    ],
                  );
          },
        ));
  }

  Widget customIconWithText(
    String text,
    String imagePath,
    Function? onTap,
  ) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: 100,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontFamily: "TajawalMedium",
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
