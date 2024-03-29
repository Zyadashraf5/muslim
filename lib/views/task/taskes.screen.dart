import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hemaya/controllers/masgedController.dart';
import 'package:hemaya/controllers/settingController.dart';
import 'package:hemaya/controllers/taskesController.dart';
import 'package:hemaya/views/Inspection%20tours/Infringements.dart';
import 'package:hemaya/views/loading/loading.dart';
import 'package:hemaya/views/pdfs/pdf_inspection.dart';
import 'package:hemaya/views/select_masagedy/select_masagedy.dart';
import 'package:hemaya/views/task/widget/item_widget.dart';

import '../../controllers/bottom_bar_controller.dart';
import '../movebar/bottom_move.dart';

class taskes extends GetView<taskescontroller> {
  const taskes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(taskescontroller());
    final BottomBarController bottomController = Get.find();
    bottomController.currentIndex = 1;
    Get.put(MasgedController());
    return Scaffold(
        floatingActionButton: FloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const BottomBar(),
        body: GetBuilder<MasgedController>(
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
                  right: 0,
                  left: 0,
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
                ),
                Positioned(
                  top: 210,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green.shade800),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: controller.searchController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                              hintText: 'ابحث عن مسجد',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            onChanged: (query) {
                              if (query.isNotEmpty) {
                                controller.searchMasaged = controller
                                    .allSignedMasaged
                                    .where((masged) => masged.namemasaged!
                                        .toLowerCase()
                                        .contains(query.toLowerCase()))
                                    .toList();
                                controller.update();
                              } else {
                                controller.searchMasaged =
                                    controller.allSignedMasaged;
                                controller.update();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 230,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: ListView.separated(
                      itemBuilder: (context, index) => ItemWidget(
                          masagedyModel: controller.searchMasaged[index]),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                      itemCount: controller.searchMasaged.length),
                )
              ],
            );
          },
        ));
  }
}
