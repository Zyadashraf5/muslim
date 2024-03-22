import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getwidget/getwidget.dart';

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

import 'package:hemaya/models/Masagedy.dart';

import 'package:hemaya/views/loading/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/Asnhlak3alyController.dart';
import '../../routes/app_pages.dart';

class DataMasagedAsnhlak3aly extends GetView<Asnhlak3alyController> {
  DataMasagedAsnhlak3aly({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Asnhlak3alyController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<Asnhlak3alyController>(
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
                          ":المركز",
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ":يوجد مؤسسة صيانة ونظافة للمسجد",
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
                        value: controller.cleaningmasagedController.text != ""
                            ? controller.cleaningmasagedController.text
                            : null,
                        items: controller.cleaningmasaged.map((valueitem) {
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
                          controller.cleaningmasagedController.text = newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    controller.cleaningmasagedController.text == "نعم"
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              textAlign: TextAlign.end,
                              controller:
                                  controller.remembercleaningmasagedController,
                              decoration: InputDecoration(
                                hintText: 'أسم الشركة ',
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

                    //////////////////////////////////////////////////////////////
                    //////////////////////////////////////////////////////////
                    ////////////////////////////////////////////////////
                    ///////////////////////////
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ":هل يوجد منسوبين للمسجد",
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
                        value: controller.EmployeesmasgedController.text != ""
                            ? controller.EmployeesmasgedController.text
                            : null,
                        items: controller.Employeesmasged.map((valueitem) {
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
                          controller.EmployeesmasgedController.text = newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    controller.EmployeesmasgedController.text == "نعم"
                        ? Container(
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
                                " اختر المنسوبين",
                              ),
                              dropdownColor: Colors.white,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              isExpanded: true,
                              alignment: Alignment.centerRight,
                              value: controller
                                          .rememberEmployeesmasgedController
                                          .text !=
                                      ""
                                  ? controller
                                      .rememberEmployeesmasgedController.text
                                  : null,
                              items: controller.rememberEmployeesmasged
                                  .map((valueitem) {
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
                                controller.rememberEmployeesmasgedController
                                    .text = newvalue!;
                                controller.update();
                              },
                            ),
                          )
                        : SizedBox(),
                    Divider(),

                    ////////////////////////////////////////////////////
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ":هل يوجد سكن للمنسوبين",
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
                        value:
                            controller.homeEmployeesmasgedController.text != ""
                                ? controller.homeEmployeesmasgedController.text
                                : null,
                        items: controller.homeEmployeesmasged.map((valueitem) {
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
                          controller.homeEmployeesmasgedController.text =
                              newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    controller.homeEmployeesmasgedController.text == "نعم"
                        ? Container(
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
                                " اختر نوع المنسوبين",
                              ),
                              dropdownColor: Colors.white,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              isExpanded: true,
                              alignment: Alignment.centerRight,
                              value: controller
                                          .rememberhomeEmployeesmasgedController
                                          .text !=
                                      ""
                                  ? controller
                                      .rememberhomeEmployeesmasgedController
                                      .text
                                  : null,
                              items: controller.homerememberEmployeesmasged
                                  .map((valueitem) {
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
                                controller.rememberhomeEmployeesmasgedController
                                    .text = newvalue!;
                                controller.update();
                              },
                            ),
                          )
                        : SizedBox(),
                    Divider(),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ":نوع سكن الامام",
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
                        value: controller.typehomeamamController.text != ""
                            ? controller.typehomeamamController.text
                            : null,
                        items: controller.typehomeamam.map((valueitem) {
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
                          controller.typehomeamamController.text = newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ": سكن الامام",
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
                        value: controller.homeamamController.text != ""
                            ? controller.homeamamController.text
                            : null,
                        items: controller.homeamam.map((valueitem) {
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
                          controller.homeamamController.text = newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ": عدادات الكهرباء والمياه لسكن الامام",
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
                        value: controller
                                    .electricandwaterforamamController.text !=
                                ""
                            ? controller.electricandwaterforamamController.text
                            : null,
                        items:
                            controller.electricandwaterforamam.map((valueitem) {
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
                          controller.electricandwaterforamamController.text =
                              newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ":فاتورة الكهرباء تسدد من قبل المستفيد",
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
                        value: controller.numberelectricController.text != ""
                            ? controller.numberelectricController.text
                            : null,
                        items: controller.numberelectric.map((valueitem) {
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
                          controller.numberelectricController.text = newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    controller.numberelectricController.text == "لا"
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              textAlign: TextAlign.end,
                              controller:
                                  controller.remembercleaningmasagedController,
                              decoration: InputDecoration(
                                hintText: 'من يقوم بسدادها ',
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
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ":فاتورة المياه تسدد من قبل المستفيد",
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
                        value: controller.numberwaterController.text != ""
                            ? controller.numberwaterController.text
                            : null,
                        items: controller.numberwater.map((valueitem) {
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
                          controller.numberwaterController.text = newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    controller.numberwaterController.text == "لا"
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              textAlign: TextAlign.end,
                              controller:
                                  controller.remembercleaningmasagedController,
                              decoration: InputDecoration(
                                hintText: 'من يقوم بسدادها ',
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
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ":نوع سكن المؤذن",
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
                        value: controller.typeMuezzinController.text != ""
                            ? controller.typeMuezzinController.text
                            : null,
                        items: controller.typeMuezzin.map((valueitem) {
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
                          controller.typeMuezzinController.text = newvalue!;
                          controller.update();
                        },
                      ),
                    ),

                    ///////////////////////////////////////////////////////////////////////////////////////////

                    ///////////////////////////////////////////////////////////////////////////////////////////

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ": سكن المؤذن",
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
                        value: controller.homeMuezzinController.text != ""
                            ? controller.homeMuezzinController.text
                            : null,
                        items: controller.homeMuezzin.map((valueitem) {
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
                          controller.homeMuezzinController.text = newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ": عدادات الكهرباء والمياه لسكن المؤذن",
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
                        value: controller.electricandwaterforMuezzinController
                                    .text !=
                                ""
                            ? controller
                                .electricandwaterforMuezzinController.text
                            : null,
                        items: controller.electricandwaterforMuezzin
                            .map((valueitem) {
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
                          controller.electricandwaterforMuezzinController.text =
                              newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ":فاتورة الكهرباء تسدد من قبل المستفيد",
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
                        value: controller
                                    .numberelectricMuezzinController.text !=
                                ""
                            ? controller.numberelectricMuezzinController.text
                            : null,
                        items:
                            controller.numberelectricMuezzin.map((valueitem) {
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
                          controller.numberelectricMuezzinController.text =
                              newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    controller.numberelectricMuezzinController.text == "لا"
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              textAlign: TextAlign.end,
                              controller: controller
                                  .remembernumberelectricMuezzinController,
                              decoration: InputDecoration(
                                hintText: 'من يقوم بسدادها ',
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
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ":فاتورة المياه تسدد من قبل المستفيد",
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
                        value:
                            controller.numberwaterMuezzinController.text != ""
                                ? controller.numberwaterMuezzinController.text
                                : null,
                        items: controller.numberwaterMuezzin.map((valueitem) {
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
                          controller.numberwaterMuezzinController.text =
                              newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    controller.numberwaterMuezzinController.text == "لا"
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              textAlign: TextAlign.end,
                              controller: controller
                                  .remembernumberwaterMuezzinController,
                              decoration: InputDecoration(
                                hintText: 'من يقوم بسدادها ',
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
                    Divider(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200))),
                      child: TextFormField(
                        controller: controller.nameamamController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 231, 237, 232),
                          hintText: " أسم الامام  ",
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200))),
                      child: TextFormField(
                        controller: controller.NationalityController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 231, 237, 232),
                          hintText: "الجنسية",
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200))),
                      child: TextFormField(
                        controller: controller.phonenumberController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 231, 237, 232),
                          hintText: " رقم الجوال",
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ": قرار التعيين ",
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
                        value:
                            controller.AppointmentDecisionController.text != ""
                                ? controller.AppointmentDecisionController.text
                                : null,
                        items: controller.AppointmentDecision.map((valueitem) {
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
                          controller.AppointmentDecisionController.text =
                              newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    ///////////////
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200))),
                      child: TextFormField(
                        controller: controller.nameMuezzinController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 231, 237, 232),
                          hintText: " اسم المؤذن",
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200))),
                      child: TextFormField(
                        controller: controller.NationalityMuezzinController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 231, 237, 232),
                          hintText: "الجنسية",
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200))),
                      child: TextFormField(
                        controller: controller.phonenumberMuezzinController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 231, 237, 232),
                          hintText: " رقم الجوال",
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ": قرار التعيين ",
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
                        value: controller.AppointmentDecisionMuezzinController
                                    .text !=
                                ""
                            ? controller
                                .AppointmentDecisionMuezzinController.text
                            : null,
                        items: controller.AppointmentDecisionMuezzin.map(
                            (valueitem) {
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
                          controller.AppointmentDecisionMuezzinController.text =
                              newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    Divider(),
                    ////////////////////////////////////////////////
                    ////////////////////////////////////////
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200))),
                      child: TextFormField(
                        controller: controller.nameServerController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 231, 237, 232),
                          hintText: " اسم الخادم",
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200))),
                      child: TextFormField(
                        controller: controller.NationalityServerController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 231, 237, 232),
                          hintText: "الجنسية",
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200))),
                      child: TextFormField(
                        controller: controller.phonenumberServerController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 231, 237, 232),
                          hintText: " رقم الجوال",
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ": قرار التعيين ",
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
                        value: controller
                                    .AppointmentDecisionServerController.text !=
                                ""
                            ? controller
                                .AppointmentDecisionServerController.text
                            : null,
                        items: controller.AppointmentDecisionServer.map(
                            (valueitem) {
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
                          controller.AppointmentDecisionServerController.text =
                              newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ":يوجد مراقب للمسجد",
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
                        value: controller.mr8bmasagedController.text != ""
                            ? controller.mr8bmasagedController.text
                            : null,
                        items: controller.mr8bmasaged.map((valueitem) {
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
                          controller.mr8bmasagedController.text = newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    controller.mr8bmasagedController.text == "نعم"
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              textAlign: TextAlign.end,
                              controller:
                                  controller.remembermr8bmasagedController,
                              decoration: InputDecoration(
                                hintText: 'اسم المراقب',
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
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          ":يوجد مرافق أخرى",
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
                        value: controller.mraf8masgedController1.text != ""
                            ? controller.mraf8masgedController1.text
                            : null,
                        items: controller.mraf8masged.map((valueitem) {
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
                          controller.mraf8masgedController1.text = newvalue!;
                          controller.update();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    controller.mraf8masgedController1.text == "نعم"
                        ? Container(
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
                                " اختر ",
                              ),
                              dropdownColor: Colors.white,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              isExpanded: true,
                              alignment: Alignment.centerRight,
                              value: controller.remembermraf8masgedController1
                                          .text !=
                                      ""
                                  ? controller
                                      .remembermraf8masgedController1.text
                                  : null,
                              items: controller.remembermraf8masged
                                  .map((valueitem) {
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
                                controller.remembermraf8masgedController1.text =
                                    newvalue!;
                                controller.update();
                              },
                            ),
                          )
                        : SizedBox(),
                    Divider(),
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
