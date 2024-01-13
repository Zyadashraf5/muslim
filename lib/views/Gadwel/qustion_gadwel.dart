import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getwidget/getwidget.dart';

import 'package:image_picker/image_picker.dart';
import 'package:muslimapp/models/Masagedy.dart';

import 'package:muslimapp/views/loading/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getwidget/getwidget.dart';

import 'package:muslimapp/models/Masagedy.dart';

import 'package:muslimapp/views/loading/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/Asnhlak3alyController.dart';
import '../../controllers/GadwelController.dart';
import '../../controllers/GadwelController.dart';
import '../../routes/app_pages.dart';

class QustionGadwel extends GetView<GadwelController> {
  QustionGadwel({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GadwelController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<GadwelController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  width: 300,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.green, width: 5),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "بيانات إضافة جدول ",
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
                                bottom:
                                    BorderSide(color: Colors.grey.shade200))),
                        child: TextFormField(
                          controller: controller.al3dwController,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 231, 237, 232),
                            hintText: " اسم العضو (اختياري)",
                          ),
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey.shade200))),
                        child: TextFormField(
                          controller: controller.yearController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 231, 237, 232),
                            hintText: " العام",
                          ),
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey.shade200))),
                        child: TextFormField(
                          controller: controller.monthController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 231, 237, 232),
                            hintText: " شهر",
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text(
                            ":األسبوع",
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
                          value: controller.weekControllerfrist.text != ""
                              ? controller.weekControllerfrist.text
                              : null,
                          items: controller.weeksfrist.map((valueitem) {
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
                            controller.weekControllerfrist.text = newvalue!;
                            controller.update();
                          },
                        ),
                      ),
                      controller.weekControllerfrist.text == "الاول"
                          ? Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller: controller.dateControllerfrist,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: " التاريخ  يوم/شهر",
                                    ),
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
                                    value: controller
                                                .centerControllerfrist.text !=
                                            ""
                                        ? controller.centerControllerfrist.text
                                        : null,
                                    items: controller.center.map((valueitem) {
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
                                      controller.centerControllerfrist.text =
                                          newvalue!;
                                      controller.update();
                                    },
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller: controller.al7yControllerfrist,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: " الحي",
                                    ),
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller: controller
                                        .numberofmasagedControllerfrist,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: " عدد المساجد",
                                    ),
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller:
                                        controller.asmalmra8bControllerfrist,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: "اسم المراقب",
                                    ),
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller:
                                        controller.numbermra8bControllerfrist,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: "جوال المراقب",
                                    ),
                                  ),
                                )
                              ],
                            )
                          : SizedBox(),

                      //////////////////////////////////////////////////////////////2
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text(
                            ":األسبوع",
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
                          value: controller.weekControllerSecond.text != ""
                              ? controller.weekControllerSecond.text
                              : null,
                          items: controller.weeksSecond.map((valueitem) {
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
                            controller.weekControllerSecond.text = newvalue!;
                            controller.update();
                          },
                        ),
                      ),
                      controller.weekControllerSecond.text == "الثاني"
                          ? Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller: controller.dateControllerSecond,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: " التاريخ  يوم/شهر",
                                    ),
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
                                    value: controller
                                                .centerControllerSecond.text !=
                                            ""
                                        ? controller.centerControllerSecond.text
                                        : null,
                                    items: controller.centerSecond
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
                                      controller.centerControllerSecond.text =
                                          newvalue!;
                                      controller.update();
                                    },
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller: controller.al7yControllerSecond,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: " الحي",
                                    ),
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller: controller
                                        .numberofmasagedControllerSecond,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: " عدد المساجد",
                                    ),
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller:
                                        controller.asmalmra8bControllerSecond,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: "اسم المراقب",
                                    ),
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller:
                                        controller.numbermra8bControllerSecond,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: "جوال المراقب",
                                    ),
                                  ),
                                )
                              ],
                            )
                          : SizedBox(),
                      ///////////////////////3
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text(
                            ":األسبوع",
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
                          value: controller.weekControllerthird.text != ""
                              ? controller.weekControllerthird.text
                              : null,
                          items: controller.weeksthird.map((valueitem) {
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
                            controller.weekControllerthird.text = newvalue!;
                            controller.update();
                          },
                        ),
                      ),
                      controller.weekControllerthird.text == "الثالث"
                          ? Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller: controller.dateControllerthird,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: " التاريخ  يوم/شهر",
                                    ),
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
                                    value: controller
                                                .centerControllerthird.text !=
                                            ""
                                        ? controller.centerControllerthird.text
                                        : null,
                                    items:
                                        controller.centerthird.map((valueitem) {
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
                                      controller.centerControllerthird.text =
                                          newvalue!;
                                      controller.update();
                                    },
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller: controller.al7yControllerthird,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: " الحي",
                                    ),
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller: controller
                                        .numberofmasagedControllerthird,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: " عدد المساجد",
                                    ),
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller:
                                        controller.asmalmra8bControllerthird,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: "اسم المراقب",
                                    ),
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller:
                                        controller.numbermra8bControllerthird,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: "جوال المراقب",
                                    ),
                                  ),
                                )
                              ],
                            )
                          : SizedBox(),
                      //////////////////////////////4
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text(
                            ":األسبوع",
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
                          value: controller.weekControllerfourth.text != ""
                              ? controller.weekControllerfourth.text
                              : null,
                          items: controller.weeksfourth.map((valueitem) {
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
                            controller.weekControllerfourth.text = newvalue!;
                            controller.update();
                          },
                        ),
                      ),
                      controller.weekControllerfourth.text == "الرابع"
                          ? Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller: controller.dateControllerfourth,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: " التاريخ  يوم/شهر",
                                    ),
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
                                    value: controller
                                                .centerControllerfourth.text !=
                                            ""
                                        ? controller.centerControllerfourth.text
                                        : null,
                                    items: controller.centerfourth
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
                                      controller.centerControllerfourth.text =
                                          newvalue!;
                                      controller.update();
                                    },
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller: controller.al7yControllerfourth,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: " الحي",
                                    ),
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller: controller
                                        .numberofmasagedControllerfourth,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: " عدد المساجد",
                                    ),
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller:
                                        controller.asmalmra8bControllerfourth,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: "اسم المراقب",
                                    ),
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    controller:
                                        controller.numbermra8bControllerfourth,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 231, 237, 232),
                                      hintText: "جوال المراقب",
                                    ),
                                  ),
                                )
                              ],
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () async {
                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();

                            final userSSN = await preferences.get('ssn');
                            await controller.createGadwel(userSSN);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("تم انشاء الجدول بنجاح"),
                            ));
                            Get.offAllNamed(Routes.home);
                          },
                          child: Container(
                            height: 50,
                            width: 380,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green.shade300),
                            child: Center(
                              child: Text(
                                "انشاء الجدول ",
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
                    ]),
              ),
            );
          },
        ));
  }
}
