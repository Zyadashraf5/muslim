import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:muslimapp/controllers/masgedController.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../controllers/GadwelController.dart';
import '../../models/Masagedy.dart';

class PdfInspection extends GetView<MasgedController> {
  PdfInspection({super.key, required this.masgedModel});

  MasagedyModel masgedModel;
  @override
  Widget build(BuildContext context) {
    Get.put(MasgedController());
    return Scaffold(body: GetBuilder<MasgedController>(
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                    width: double.infinity,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.black,
                        padding: const EdgeInsets.all(1),
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("${masgedModel.date!.split(" ")[0]}"),
                                  Text(":"),
                                  Text("التاريخ"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/1.png",
                        width: 80,
                      ),
                      Image.asset(
                        "assets/2.png",
                        width: 100,
                      ),
                    ],
                  ),
                  const Text(
                    "( تقرير جولة )",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CustomDivider(
                        height: 25,
                      ),
                      Expanded(
                          child: TableHead(
                        text:
                            "    اسم المسجد / الجامع :  ${masgedModel.namemasaged}",
                      )),
                      CustomDivider(
                        height: 25,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomDivider(
                        height: 40,
                      ),
                      Expanded(
                        flex: 2,
                        child: TableCell(
                          text: "الحي: ${masgedModel.District}",
                        ),
                      ),
                      CustomDivider(
                        height: 40,
                      ),
                      Expanded(
                        flex: 3,
                        child: TableCell(
                          text: "المركز: ${masgedModel.Centerr}",
                        ),
                      ),
                      CustomDivider(
                        height: 40,
                      ),
                      Expanded(
                        flex: 2,
                        child: TableCell(
                          text: "المحافظة: ${masgedModel.Governorate}",
                        ),
                      ),
                      CustomDivider(
                        height: 40,
                      ),
                      Expanded(
                          flex: 2,
                          child: TableCell(
                            text: "المنطقة : ${masgedModel.branch}  ",
                          )),
                      CustomDivider(
                        height: 40,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomDivider(
                        height: 40,
                      ),
                      Expanded(
                        flex: 2,
                        child: TableCell(
                          text: "${masgedModel.watername}: قم عداد المياه ",
                        ),
                      ),
                      CustomDivider(
                        height: 40,
                      ),
                      Expanded(
                        flex: 2,
                        child: TableCell(
                          text:
                              " ${masgedModel.electricname} :قم عداد الكهرباء",
                        ),
                      ),
                      CustomDivider(
                        height: 40,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomDivider(
                        height: 40,
                      ),
                      Expanded(
                        flex: 1,
                        child: checkbox(
                          text: "لا",
                          isChecked: !masgedModel.t3dy3lyalkhrbaawalmyah &&
                              !masgedModel.t3dy3lyalmyah &&
                              !masgedModel.ta3dy3lakahrba,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: checkbox(
                          text: "نعم",
                          isChecked: masgedModel.t3dy3lyalkhrbaawalmyah ||
                              masgedModel.t3dy3lyalmyah ||
                              masgedModel.ta3dy3lakahrba,
                        ),
                      ),
                      CustomDivider(
                        height: 40,
                      ),
                      Expanded(
                        flex: 2,
                        child: TableCell(
                          text: ": هل يوجد تعديات  ",
                        ),
                      ),
                      CustomDivider(
                        height: 40,
                      ),
                      //
                    ],
                  ),
                  Row(
                    children: [
                      CustomDivider(
                        height: 40,
                      ),
                      Expanded(
                        flex: 1,
                        child: checkbox(
                            text: "لا",
                            isChecked: masgedModel.mo5alfat == null ||
                                masgedModel.mo5alfat == ""),
                      ),
                      Expanded(
                        flex: 1,
                        child: checkbox(
                            text: "نعم",
                            isChecked: masgedModel.mo5alfat != null &&
                                masgedModel.mo5alfat != ""),
                      ),
                      CustomDivider(
                        height: 40,
                      ),
                      Expanded(
                        flex: 2,
                        child: TableCell(
                          text: ": هل يوجد ملاحظات   ",
                        ),
                      ),
                      CustomDivider(
                        height: 40,
                      ),
                      //
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "تم رصد تعديات ومخالفات التالية : ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${masgedModel.t3dy3lyalkhrbaawalmyah ? masgedModel.t3dy3lyalkhrbaawalmyahValue : masgedModel.ta3dy3lakahrba ? masgedModel.ta3dy3lakahrbaValue : masgedModel.t3dy3lyalmyah ? masgedModel.ta3dy3lakahrbaValue : ""}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        Text(":"),
                        Text("التعديات")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${masgedModel.mo5alfat}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        Text(":"),
                        Text("الملاحظات"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "عضو اللجنة الميدانية",
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            masgedModel.signatureRole3 != null
                                ? Text(masgedModel.signerNameRole3!)
                                : Container(),
                            masgedModel.signatureRole3 != null
                                ? Image(
                                    width: 100,
                                    height: 50,
                                    fit: BoxFit.contain,
                                    image: NetworkImage(
                                        masgedModel.signatureRole3!),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "باركود التقرير",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                QrImageView(
                                  data: masgedModel.qr,
                                  size: 70,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      ...masgedModel.was2k!
                          .map((e) => Container(
                                child: Image.network(e),
                                padding: EdgeInsets.symmetric(vertical: 20),
                              ))
                          .toList()
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.height,
  });
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: 1,
      height: height,
    );
  }
}

class TableHead extends StatelessWidget {
  const TableHead({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: Container(
          height: 25,
          alignment: Alignment.centerRight,
          color: Colors.white,
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
        ));
  }
}

class TableCell extends StatelessWidget {
  const TableCell({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        padding: const EdgeInsets.only(bottom: 1),
        child: Container(
          height: 40,
          alignment: Alignment.centerRight,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}

class checkbox extends StatelessWidget {
  checkbox({
    Key? key,
    required this.text,
    this.isChecked = false,
  }) : super(key: key);

  final String text;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // Add a boolean variable to track the checkbox state

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(bottom: 1),
      child: Container(
        height: 40,
        alignment: Alignment.centerRight,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  isChecked = value ?? false; // Update the checkbox state
                },
              ),
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
