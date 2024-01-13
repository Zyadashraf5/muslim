import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:muslimapp/controllers/authController.dart';
import 'package:muslimapp/controllers/settingController.dart';
import 'package:muslimapp/controllers/taskesController.dart';
import 'package:muslimapp/views/loading/loading.dart';
import 'package:muslimapp/views/select_masagedy/select_masagedy.dart';
import 'package:muslimapp/views/task/widget/item_widget.dart';

import '../../controllers/bottom_bar_controller.dart';
import '../movebar/bottom_move.dart';
import 'widget/item_widget.dart';

class lagna extends GetView<AuthControler> {
  const lagna({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AuthControler());

    return Scaffold(body: GetBuilder<AuthControler>(
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
                    top: 200,
                    right: 50,
                    left: 50,
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green, width: 2.0),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "مشرفين اللجان الميدانية",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "TajawalMedium",
                              color: Colors.black),
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
                        itemBuilder: (context, index) => Itemmshrfallgnh(
                              user: controller.users[index],
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: controller.users.length),
                  )
                ],
              );
      },
    ));
  }
}
