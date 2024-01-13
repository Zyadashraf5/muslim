import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../controllers/Asnhlak3alyController.dart';

class Asnhlak3aly extends GetView<Asnhlak3alyController> {
  const Asnhlak3aly({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<Asnhlak3alyController>(
        builder: (controller) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 180),
                  child: Container(
                    child: Text(
                      ":ما أسبب الاستهلاك العالي",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: DropdownButton(
                    underline: SizedBox(),
                    hint: Text(
                      "اختر",
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    alignment: Alignment.centerRight,
                    value: controller.Asnhlak3alyController1.text != ""
                        ? controller.Asnhlak3alyController1.text
                        : null,
                    items: controller.Asnhlak3aly.map((valueitem) {
                      return DropdownMenuItem<String>(
                        alignment: Alignment.centerRight,
                        value: valueitem,
                        child: Text(
                          valueitem,
                          textAlign: TextAlign.right,
                        ),
                      );
                    }).toList(),
                    onChanged: (newvalue) {
                      controller.Asnhlak3alyController1.text = newvalue!;
                      controller.update();
                    },
                  ),
                ),
                controller.Asnhlak3alyController1.text == "اخري"
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          textAlign: TextAlign.end,
                          controller: controller.rememberAsnhlak3alyController,
                          decoration: InputDecoration(
                            hintText: 'اسباب اخري',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "robot",
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }
}
