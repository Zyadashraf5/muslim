import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemaya/controllers/homeController.dart';
import 'package:hemaya/models/Masagedy.dart';
import 'package:hemaya/models/UserModel.dart';
import 'package:hemaya/views/pdfs/pdf_inspection.dart';

class mol7azat extends GetView<HomeController> {
  const mol7azat({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "التعديات و الملاحظات",
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
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('رقم الهويه')),
                      DataColumn(label: Text('اسم المستخدم')),
                      DataColumn(label: Text('عدد التعديات')),
                      DataColumn(label: Text('عدد الملاحظات')),
                    ],
                    rows: controller.dashboardData.entries.map((e) {
                      String ssn = e.key.ssn!; // Assuming key is the SSN
                      String userName = e.key
                          .name; // Fetch username from your UserModel using the SSN
                      int tweetsCount = e.value[
                          1]; // Assuming tweets count is stored at index 0
                      int notesCount = e.value[
                          0]; // Assuming notes count is stored at index 1

                      return DataRow(cells: [
                        DataCell(Text(ssn)),
                        DataCell(Text(userName)),
                        DataCell(Text('$tweetsCount')),
                        DataCell(Text('$notesCount')),
                      ]);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
