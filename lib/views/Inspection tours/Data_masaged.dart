import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getwidget/getwidget.dart';

import 'package:hemaya/controllers/masgedController.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hemaya/models/Masagedy.dart';

import 'package:hemaya/views/loading/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getwidget/getwidget.dart';

import 'package:hemaya/controllers/masgedController.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hemaya/models/Masagedy.dart';

import 'package:hemaya/views/loading/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../routes/app_pages.dart';

class DataMasaged extends GetView<MasgedController> {
  DataMasaged({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MasgedController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<MasgedController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // IconButton(
                        //   onPressed: () {
                        //     Get.back();
                        //   },
                        // icon: const Icon(
                        //   Icons.arrow_back_ios,
                        //   color: Colors.black,
                        // ),
                        // ),
                        Center(
                          child: Column(
                            children: [
                              Container(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: Colors.green, width: 5),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "بيانات إضافة المساجد ومنسوبيها",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200))),
                      child: TextFormField(
                        controller: controller.namemasagedController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 231, 237, 232),
                          hintText: " اسم المسجد",
                        ),
                      ),
                    ),
                    Divider(),

                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     child: Text(
                    //       ":المسجد تحت اشراف الوزره",
                    //       style: TextStyle(
                    //         fontSize: 18,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    // Container(
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.grey, width: 1),
                    //     borderRadius: BorderRadius.circular(30),
                    //   ),
                    //   child: DropdownButton(
                    //     underline: SizedBox(),
                    //     hint: Text(
                    //       "اختر",
                    //     ),
                    //     dropdownColor: Colors.white,
                    //     icon: Icon(Icons.arrow_drop_down),
                    //     iconSize: 36,
                    //     isExpanded: true,
                    //     alignment: Alignment.centerRight,
                    //     value: controller.masgedwaseraController.text != ""
                    //         ? controller.masgedwaseraController.text
                    //         : null,
                    //     items: controller.masgedwasera.map((valueitem) {
                    //       return DropdownMenuItem<String>(
                    //         alignment: Alignment.centerRight,
                    //         value: valueitem,
                    //         child: Text(
                    //           valueitem,
                    //           textAlign: TextAlign.right,
                    //         ),
                    //       );
                    //     }).toList(),
                    //     onChanged: (newvalue) {
                    //       controller.masgedwaseraController.text = newvalue!;
                    //       controller.update();
                    //     },
                    //   ),
                    // ),

                    // Divider(),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     child: Text(
                    //       ":وجود صك للمسجد",
                    //       style: TextStyle(
                    //         fontSize: 18,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    // Container(
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.grey, width: 1),
                    //     borderRadius: BorderRadius.circular(30),
                    //   ),
                    //   child: DropdownButton(
                    //     underline: SizedBox(),
                    //     hint: Text(
                    //       "اختر",
                    //     ),
                    //     dropdownColor: Colors.white,
                    //     icon: Icon(Icons.arrow_drop_down),
                    //     iconSize: 36,
                    //     isExpanded: true,
                    //     alignment: Alignment.centerRight,
                    //     value: controller.sakamasgaedController.text != ""
                    //         ? controller.sakamasgaedController.text
                    //         : null,
                    //     items: controller.sakamasgaed.map((valueitem) {
                    //       return DropdownMenuItem<String>(
                    //         alignment: Alignment.centerRight,
                    //         value: valueitem,
                    //         child: Text(
                    //           valueitem,
                    //           textAlign: TextAlign.right,
                    //         ),
                    //       );
                    //     }).toList(),
                    //     onChanged: (newvalue) async {
                    //       controller.sakamasgaedController.text = newvalue!;
                    //       controller.update();
                    //       if (newvalue == "نعم (أرفاق صورة من الصك)") {
                    //         controller.selectedSak =
                    //             await controller.pickImageFromGallery();

                    //         controller.update();
                    //       }
                    //     },
                    //   ),
                    // ),
                    // controller.selectedSak != null
                    //     ? Text(controller.selectedSak!.path.split('/').last)
                    //     : Container(),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ":الفرع",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    //
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
                        value: controller.branchController.text != ""
                            ? controller.branchController.text
                            : null,
                        items: controller.branch.map((valueitem) {
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
                          controller.branchController.text = newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ":المحافظة",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
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
                        value: controller.GovernorateController.text != ""
                            ? controller.GovernorateController.text
                            : null,
                        items: controller.Governorate.map((valueitem) {
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
                          controller.GovernorateController.text = newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ":المكتب",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
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
                        value: controller.CenterController.text != ""
                            ? controller.CenterController.text
                            : null,
                        items: controller.Centerr.map((valueitem) {
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
                          controller.CenterController.text = newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    Divider(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200))),
                      child: TextFormField(
                        controller: controller.DistrictnameController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 231, 237, 232),
                          hintText: " اسم الحي",
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200))),
                      child: TextFormField(
                        controller: controller.electricnameController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 231, 237, 232),
                          hintText: "رقم العداد الخاص بالكهرباء",
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200))),
                      child: TextFormField(
                        controller: controller.waternameController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 231, 237, 232),
                          hintText: "رقم العداد الخاص بالمياه",
                        ),
                      ),
                    ),

                    Divider(),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     child: Text(
                    //       ":يوجد مؤسسة صيانة ونظافة للمسجد",
                    //       style: TextStyle(
                    //         fontSize: 18,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //       color: Colors.grey,
                    //       width: 1,
                    //     ),
                    //     borderRadius: BorderRadius.circular(30),
                    //   ),
                    //   child: DropdownButton(
                    //     underline: SizedBox(),
                    //     hint: Text(
                    //       "اختر",
                    //     ),
                    //     dropdownColor: Colors.white,
                    //     icon: Icon(Icons.arrow_drop_down),
                    //     iconSize: 36,
                    //     isExpanded: true,
                    //     alignment: Alignment.centerRight,
                    //     value: controller.cleaningmasagedController.text != ""
                    //         ? controller.cleaningmasagedController.text
                    //         : null,
                    //     items: controller.cleaningmasaged.map((valueitem) {
                    //       return DropdownMenuItem<String>(
                    //         alignment: Alignment.centerRight,
                    //         value: valueitem,
                    //         child: Text(
                    //           valueitem,
                    //           textAlign: TextAlign.right,
                    //         ),
                    //       );
                    //     }).toList(),
                    //     onChanged: (newvalue) {
                    //       controller.cleaningmasagedController.text = newvalue!;
                    //       controller.update();
                    //     },
                    //   ),
                    // ),
                    // controller.cleaningmasagedController.text == "نعم"
                    //     ? Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: TextField(
                    //           textAlign: TextAlign.end,
                    //           controller:
                    //               controller.remembercleaningmasagedController,
                    //           decoration: InputDecoration(
                    //             hintText: 'أسم الشركة ',
                    //             hintStyle: TextStyle(
                    //               fontSize: 15,
                    //               color: Colors.grey,
                    //             ),
                    //           ),
                    //           style: TextStyle(
                    //             fontSize: 15,
                    //             color: Colors.black,
                    //             fontFamily: "robot",
                    //           ),
                    //         ),
                    //       )
                    //     : SizedBox(),

                    // //////////////////////////////////////////////////////////////
                    // //////////////////////////////////////////////////////////
                    // ////////////////////////////////////////////////////
                    // ///////////////////////////
                    // Divider(),

                    SizedBox(
                      height: 30,
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
