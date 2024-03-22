import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getwidget/getwidget.dart';

import 'package:image_picker/image_picker.dart';
import 'package:hemaya/models/Gadwel.dart';
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
import '../../controllers/GadwelController.dart';
import '../../controllers/GadwelController.dart';
import '../../routes/app_pages.dart';

class editgadwel extends GetView<GadwelController> {
  editgadwel({super.key, required this.gadwelModel});
  GadwelModel gadwelModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<GadwelController>(
          builder: (controller) {
            Get.put(GadwelController());
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
                          ////controller: controller.al3dwController,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.center,
                          initialValue: gadwelModel!.al3dw,
                          onChanged: (value) {
                            gadwelModel!.al3dw = value;
                            controller.al3dwController.text = value;
                            controller.update();
                          },
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
                          readOnly: true,
                          ////controller: controller.yearController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            gadwelModel!.year = value;
                            controller.yearController.text = value;
                            controller.update();
                          },
                          initialValue: gadwelModel!.year,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(135, 162, 158, 158),
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
                          readOnly: true,
                          //controller: controller.monthController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            gadwelModel!.month = value;
                            controller.monthController.text = value;
                            controller.update();
                          },
                          initialValue: gadwelModel!.month,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(135, 162, 158, 158),
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
                          value: gadwelModel!.weekFrist != ""
                              ? gadwelModel!.weekFrist
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
                            gadwelModel!.weekFrist = newvalue;
                            controller.update();
                          },
                        ),
                      ),
                      gadwelModel.weekFrist == "الاول"
                          ? Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    //controller: controller.dateControllerfrist,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      gadwelModel!.dateFrist = value;
                                      controller.dateControllerfrist.text =
                                          value;
                                      controller.update();
                                    },
                                    initialValue: gadwelModel!.dateFrist,
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
                                    value: gadwelModel!.centerFrist,
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
                                      gadwelModel!.centerFrist = newvalue;
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
                                    //controller: controller.al7yControllerfrist,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      gadwelModel!.al7yFrist = value;
                                      controller.al7yControllerfrist.text =
                                          value;
                                      controller.update();
                                    },
                                    initialValue: gadwelModel!.al7yFrist,
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
                                    //controller: controller
                                    //  .numberofmasagedControllerfrist,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      gadwelModel!.numberofmasagedFrist = value;
                                      controller.numberofmasagedControllerfrist
                                          .text = value;
                                      controller.update();
                                    },
                                    initialValue:
                                        gadwelModel!.numberofmasagedFrist,
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
                                    //controller:
                                    // controller.asmalmra8bControllerfrist,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      gadwelModel!.asmalmra8bFrist = value;
                                      controller.asmalmra8bControllerfrist
                                          .text = value;
                                      controller.update();
                                    },
                                    initialValue: gadwelModel!.asmalmra8bFrist,
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
                                    //controller:
                                    //    controller.numbermra8bControllerfrist,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    initialValue: gadwelModel!.numbermra8bFrist,
                                    onChanged: (value) {
                                      gadwelModel!.numbermra8bFrist = value;
                                      controller.numbermra8bControllerfrist
                                          .text = value;
                                      controller.update();
                                    },
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
                          value: gadwelModel!.weekSecond != ""
                              ? gadwelModel!.weekSecond
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
                            gadwelModel!.weekSecond = newvalue;
                            controller.update();
                          },
                        ),
                      ),
                      gadwelModel.weekSecond == "الثاني"
                          ? Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    //controller: controller.dateControllerSecond,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    initialValue: gadwelModel!.dateSecond,
                                    onChanged: (value) {
                                      gadwelModel!.dateSecond = value;
                                      controller.dateControllerSecond.text =
                                          value;
                                      controller.update();
                                    },
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
                                    value: gadwelModel!.centerSecond != ""
                                        ? gadwelModel!.centerSecond
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
                                      gadwelModel!.centerSecond = newvalue;
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
                                    //controller: controller.al7yControllerSecond,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    initialValue: gadwelModel!.al7ySecond,
                                    onChanged: (value) {
                                      gadwelModel!.al7ySecond = value;
                                      controller.al7yControllerSecond.text =
                                          value;
                                      controller.update();
                                    },
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
                                    //controller: controller
                                    //   .numberofmasagedControllerSecond,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      gadwelModel!.numberofmasagedSecond =
                                          value;
                                      controller.numberofmasagedControllerSecond
                                          .text = value;
                                      controller.update();
                                    },
                                    initialValue:
                                        gadwelModel!.numberofmasagedSecond,
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
                                    //controller:
                                    //   controller.asmalmra8bControllerSecond,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    initialValue: gadwelModel!.asmalmra8bSecond,
                                    onChanged: (value) {
                                      gadwelModel!.asmalmra8bSecond = value;
                                      controller.asmalmra8bControllerSecond
                                          .text = value;
                                      controller.update();
                                    },
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
                                    //controller:
                                    //   controller.numbermra8bControllerSecond,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      gadwelModel!.numbermra8bSecond = value;
                                      controller.numbermra8bControllerSecond
                                          .text = value;
                                      controller.update();
                                    },
                                    initialValue:
                                        gadwelModel!.numbermra8bSecond,
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
                          value: gadwelModel!.weekThird != ""
                              ? gadwelModel!.weekThird
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
                            gadwelModel!.weekThird = newvalue;
                            controller.update();
                          },
                        ),
                      ),
                      gadwelModel.weekThird == "الثالث"
                          ? Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    //controller: controller.dateControllerthird,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    initialValue: gadwelModel!.dateThird,
                                    onChanged: (value) {
                                      gadwelModel!.dateThird = value;
                                      controller.dateControllerthird.text =
                                          value;
                                      controller.update();
                                    },
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
                                    value: gadwelModel!.centerThird != ""
                                        ? gadwelModel!.centerThird
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
                                      gadwelModel!.centerThird = newvalue;
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
                                    //controller: controller.al7yControllerthird,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    initialValue: gadwelModel!.al7yThird,
                                    onChanged: (value) {
                                      gadwelModel!.al7yThird = value;
                                      controller.al7yControllerthird.text =
                                          value;
                                      controller.update();
                                    },
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
                                    //controller: controller
                                    //  .numberofmasagedControllerthird,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      gadwelModel!.numberofmasagedThird = value;
                                      controller.numberofmasagedControllerthird
                                          .text = value;
                                      controller.update();
                                    },
                                    initialValue:
                                        gadwelModel!.numberofmasagedThird,
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
                                    //controller:
                                    //   controller.asmalmra8bControllerthird,
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      gadwelModel!.asmalmra8bThird = value;
                                      controller.asmalmra8bControllerthird
                                          .text = value;
                                      controller.update();
                                    },
                                    textAlign: TextAlign.center,
                                    initialValue: gadwelModel!.asmalmra8bThird,
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
                                    //controller:
                                    //     controller.numbermra8bControllerthird,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      gadwelModel!.numbermra8bThird = value;
                                      controller.numbermra8bControllerthird
                                          .text = value;
                                      controller.update();
                                    },
                                    textAlign: TextAlign.center,
                                    initialValue: gadwelModel!.numbermra8bThird,
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
                          value: gadwelModel!.weekFourth != ""
                              ? gadwelModel!.weekFourth
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
                            gadwelModel!.weekFourth = newvalue;
                            controller.update();
                          },
                        ),
                      ),
                      gadwelModel.weekFourth == "الرابع"
                          ? Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    //controller: controller.dateControllerfourth,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    initialValue: gadwelModel!.dateFourth,
                                    onChanged: (value) {
                                      gadwelModel!.dateFourth = value;
                                      controller.dateControllerfourth.text =
                                          value;
                                      controller.update();
                                    },
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
                                    value: gadwelModel!.centerFourth != ""
                                        ? gadwelModel!.centerFourth
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
                                      gadwelModel!.centerFourth = newvalue;
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
                                    //controller: controller.al7yControllerfourth,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    initialValue: gadwelModel!.al7yFourth,
                                    onChanged: (value) {
                                      gadwelModel!.al7yFourth = value;
                                      controller.al7yControllerfourth.text =
                                          value;
                                      controller.update();
                                    },
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
                                    //controller: controller
                                    //   .numberofmasagedControllerfourth,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      gadwelModel!.numberofmasagedFourth =
                                          value;
                                      controller.numberofmasagedControllerfourth
                                          .text = value;
                                      controller.update();
                                    },
                                    initialValue:
                                        gadwelModel!.numberofmasagedFourth,
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
                                    //controller:
                                    //   controller.asmalmra8bControllerfourth,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      gadwelModel!.asmalmra8bFourth = value;
                                      controller.asmalmra8bControllerfourth
                                          .text = value;
                                      controller.update();
                                    },
                                    initialValue: gadwelModel!.asmalmra8bFourth,
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
                                    //controller:
                                    //   controller.numbermra8bControllerfourth,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      gadwelModel!.numbermra8bFourth = value;
                                      controller.numbermra8bControllerfourth
                                          .text = value;
                                      controller.update();
                                    },
                                    initialValue:
                                        gadwelModel!.numbermra8bFourth,
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
                            await controller.editData(
                                gadwelModel!.year + gadwelModel!.month,
                                gadwelModel!);
                            SnackBar snackBar = SnackBar(
                              content: Text("تم التعديل بنجاح"),
                              backgroundColor: Colors.green,
                            );
                            Get.snackbar(
                              "",
                              "",
                              snackPosition: SnackPosition.BOTTOM,
                              snackStyle: SnackStyle.FLOATING,
                              backgroundColor: Colors.green,
                              messageText: Text(
                                "تم التعديل بنجاح",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              duration: Duration(seconds: 3),
                            );
                            final delay = Future.delayed(
                                Duration(
                                  seconds: 2,
                                ), () {
                              Get.offAllNamed(Routes.home);
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 380,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green.shade300),
                            child: Center(
                              child: Text(
                                "تعديل",
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
