import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/masgedController.dart';

MasgedController masgedController = Get.put(MasgedController());

class Infringements extends GetView<MasgedController> {
  Infringements({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MasgedController());

    return Scaffold(body: GetBuilder<MasgedController>(
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
                        children: List.generate(4, (index) {
                          return Column(
                            children: [
                              CheckboxListTile(
                                  title: Text(
                                    controller.titles[index].title,
                                    textAlign: TextAlign.end,
                                  ),
                                  value: controller.titles[index].value,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor: Colors.green,
                                  onChanged: (value) {
                                    controller.titles[index].value = value!;
                                    controller.update();
                                  }),
                              controller.titles[index].other &&
                                      controller.titles[index].value
                                  ? TextFormField(
                                      onChanged: (value) {
                                        controller.titles[index].otherValue =
                                            value;
                                        masgedController.update();
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
