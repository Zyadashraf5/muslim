import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemaya/controllers/homeController.dart';
import 'package:hemaya/models/Masagedy.dart';
import 'package:hemaya/models/UserModel.dart';
import 'package:hemaya/views/pdfs/pdf_inspection.dart';

class Analytics extends GetView<HomeController> {
  const Analytics({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "الجولات",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "TajawalMedium",
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    controller.filteredUser != null
                        ? Text(
                            "${controller.usersDashboard.length}  : عدد المساجد")
                        : Container(),
                    SizedBox(
                      width: 20,
                    ),
                    controller.filterDate == null
                        ? Container(
                            child: DropdownButton(
                              hint: Text(
                                "اختر",
                              ),
                              dropdownColor: Colors.white,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 26,
                              alignment: Alignment.center,
                              value: controller.filteredUser,
                              items: [
                                DropdownMenuItem<UserModel>(
                                  alignment: Alignment.center,
                                  value:
                                      null, // Add null value for the null option
                                  child: Text(
                                    " اختر المستخدم", // Text for the null option
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ...controller.allUsers.map((valueitem) {
                                  return DropdownMenuItem<UserModel>(
                                    alignment: Alignment.center,
                                    value: valueitem,
                                    child: Text(
                                      valueitem.name!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ],
                              onChanged: (newvalue) async {
                                controller.filteredUser = newvalue;
                                if (newvalue == null) {
                                  await controller.getUsersWithDoc();
                                  controller.update();
                                  controller.update();
                                  return;
                                }
                                await controller.getUsersWithDoc(newvalue);
                                controller.update();
                              },
                            ),
                          )
                        : Container(),
                    controller.filteredUser == null
                        ? Container(
                            child: DropdownButton(
                              hint: Text(
                                "اختر",
                              ),
                              dropdownColor: Colors.white,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 26,
                              alignment: Alignment.center,
                              value: controller.filteredUser,
                              items: [
                                DropdownMenuItem<String?>(
                                  alignment: Alignment.center,
                                  value: controller.filterDate != null
                                      ? controller.filterDate
                                      : null, // Add null value for the null option
                                  child: Text(
                                    " اختر التاريخ", // Text for the null option
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  alignment: Alignment.center,
                                  value: "شهري",
                                  child: Text(
                                    "هذا الشهر"!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  alignment: Alignment.center,
                                  value: "سنوي",
                                  child: Text(
                                    "هذه السنه"!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                              onChanged: (newvalue) async {
                                if (newvalue == null) {
                                  controller.filterDate = null;
                                  await controller.getUsersWithDoc();

                                  controller.update();
                                  return;
                                }
                                controller.filterDate = newvalue.toString();
                                await controller.getUsersWithDoc(
                                    null, newvalue.toString());
                                controller.update();
                              },
                            ),
                          )
                        : Container()
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('اسم المسجد')),
                      DataColumn(label: Text('رقم الهويه')),
                      DataColumn(label: Text('اسم المستخدم')),
                      DataColumn(label: Text('موقعه من مدير الاداره')),
                      DataColumn(label: Text('موقعه من مشرف اللجان')),
                      DataColumn(label: Text('تاريخ')),
                    ],
                    rows: controller.usersDashboard.map((e) {
                      return DataRow(
                        cells: [
                          DataCell(Text(e.values.first.namemasaged!)),
                          DataCell(Text(e.keys.first.ssn!)),
                          DataCell(Text(e.keys.first.name)),
                          DataCell(
                              Text(e.values.first.signedRole2! ? "نعم" : "لا")),
                          DataCell(
                              Text(e.values.first.signedRole3! ? "نعم" : "لا")),
                          DataCell(Text(e.values.first.date!.split(" ")[0])),
                        ],
                        onSelectChanged: (value) {
                          if (value == true) {
                            Get.to(PdfInspection(
                              masgedModel: e.values.first,
                            ));
                          }
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
