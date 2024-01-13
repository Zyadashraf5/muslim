import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:muslimapp/controllers/GadwelController.dart';
import 'package:muslimapp/controllers/masgedController.dart';
import 'package:muslimapp/controllers/settingController.dart';
import 'package:muslimapp/controllers/taskesController.dart';
import 'package:muslimapp/views/Inspection%20tours/Infringements.dart';
import 'package:muslimapp/views/loading/loading.dart';
import 'package:muslimapp/views/pdfs/pdf_inspection.dart';
import 'package:muslimapp/views/select_masagedy/select_masagedy.dart';
import 'package:muslimapp/views/task/widget/gadwelWidget.dart';
import 'package:muslimapp/views/task/widget/item_widget.dart';

import '../../controllers/bottom_bar_controller.dart';
import '../movebar/bottom_move.dart';

class OwnGadawel extends GetView<taskescontroller> {
  const OwnGadawel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(GadwelController());
    return Scaffold(body: GetBuilder<GadwelController>(
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
              top: 50,
              right: 30,
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
              top: 230,
              right: 0,
              left: 0,
              bottom: 0,
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      GadwelWidget(gadwelModel: controller.ownGadawel[index]),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: controller.ownGadawel.length),
            )
          ],
        );
      },
    ));
  }
}
