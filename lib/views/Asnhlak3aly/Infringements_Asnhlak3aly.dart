import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/Asnhlak3alyController.dart';
import '../../controllers/Asnhlak3alyController.dart';
import '../../controllers/masgedController.dart';
import '../../controllers/Asnhlak3alyController.dart';

Asnhlak3alyController asnhlak3alyController = Get.put(Asnhlak3alyController());

class InfringementsAsnhlak3aly extends GetView<Asnhlak3alyController> {
  InfringementsAsnhlak3aly({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Asnhlak3alyController());

    return Scaffold(body: GetBuilder<Asnhlak3alyController>(
      builder: (controller) {
        return SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
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
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: Colors.green.shade300, width: 4),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "التعديات",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      ":هل يوجد تعديات",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: List.generate(controller.lengths, (index) {
                          return Column(
                            children: [
                              CheckboxListTile(
                                  title: Text(
                                    controller
                                        .titlesAsnhlak3alyController[index]
                                        .title,
                                    textAlign: TextAlign.end,
                                  ),
                                  value: controller
                                      .titlesAsnhlak3alyController[index].value,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor: Colors.green,
                                  onChanged: (value) {
                                    controller
                                        .titlesAsnhlak3alyController[index]
                                        .value = value!;
                                    if (controller
                                            .titlesAsnhlak3alyController[0]
                                            .value ||
                                        controller
                                            .titlesAsnhlak3alyController[1]
                                            .value ||
                                        controller
                                            .titlesAsnhlak3alyController[2]
                                            .value ||
                                        controller
                                            .titlesAsnhlak3alyController[3]
                                            .value) {
                                      controller.lengths = controller
                                          .titlesAsnhlak3alyController.length;
                                      controller.update();
                                    } else {
                                      controller.lengths = 4;
                                      controller.update();
                                    }
                                    // asnhlak3alyController.update();
                                  }),
                              controller.titlesAsnhlak3alyController[index]
                                          .other &&
                                      controller
                                          .titlesAsnhlak3alyController[index]
                                          .value
                                  ? TextFormField(
                                      onChanged: (value) {
                                        controller
                                            .titlesAsnhlak3alyController[index]
                                            .otherValue = value;
                                        asnhlak3alyController.update();
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Colors.green.shade100,
                                      ),
                                    )
                                  : Container()
                            ],
                          );
                        }),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () async {
                      Get.back();
                    },
                    child: Container(
                      height: 50,
                      width: 380,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green.shade300),
                      child: Center(
                        child: Text(
                          "التالي ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "robot",
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
