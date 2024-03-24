import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hemaya/controllers/masgedController.dart';
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
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Container(
                            color: Colors.white,
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
                      "( تقرير زيارة )",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 2,
                      color: const Color.fromARGB(63, 0, 0, 0),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TableHead(
                          text: " اسم المسجد  :  ${masgedModel.namemasaged}",
                        ),
                      ],
                    ),
                    Divider(
                      height: 2,
                      color: const Color.fromARGB(63, 0, 0, 0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TableCell(
                          text: "المحافظة: ${masgedModel.Governorate}",
                        ),
                        TableCell(
                          text: "المنطقة : ${masgedModel.branch}  ",
                        ),
                      ],
                    ),
                    Divider(
                      height: 2,
                      color: const Color.fromARGB(63, 0, 0, 0),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TableCell(
                          text: "الحي: ${masgedModel.District}",
                        ),
                        TableCell(
                          text: "المكتب: ${masgedModel.Centerr}",
                        ),
                      ],
                    ),
                    Divider(
                      height: 2,
                      color: const Color.fromARGB(63, 0, 0, 0),
                    ),
                    TableCell(
                      text: " ${masgedModel.electricname} :رقم عداد الكهرباء",
                    ),
                    Divider(
                      height: 2,
                      color: const Color.fromARGB(63, 0, 0, 0),
                    ),

                    TableCell(
                      text: "${masgedModel.watername}: رقم عداد المياه ",
                    ),
                    Divider(
                      height: 2,
                      color: const Color.fromARGB(63, 0, 0, 0),
                    ),
                    Row(
                      children: [
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

                        Expanded(
                          flex: 2,
                          child: TableCell(
                            text: ": هل يوجد تعديات  ",
                          ),
                        ),

                        //
                      ],
                    ),
                    Divider(
                      height: 2,
                      color: const Color.fromARGB(63, 0, 0, 0),
                    ),
                    Row(
                      children: [
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

                        Expanded(
                          flex: 2,
                          child: TableCell(
                            text: ": هل يوجد ملاحظات   ",
                          ),
                        ),

                        //
                      ],
                    ),
                    Divider(
                      height: 2,
                      color: const Color.fromARGB(63, 0, 0, 0),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: checkbox(
                              text: "لا",
                              isChecked: masgedModel.esthlak3aly == ""),
                        ),
                        Expanded(
                          flex: 1,
                          child: checkbox(
                              text: "نعم",
                              isChecked: masgedModel.esthlak3aly != ""),
                        ),

                        Expanded(
                          flex: 2,
                          child: TableCell(
                            text: ": هل يوجد استهلاك عالي",
                          ),
                        ),

                        //
                      ],
                    ),
                    Divider(
                      height: 9,
                      color: const Color.fromARGB(63, 0, 0, 0),
                    ),
                    masgedModel.t3dy3lyalkhrbaawalmyah ||
                            masgedModel.t3dy3lyalmyah ||
                            masgedModel.ta3dy3lmrafak ||
                            masgedModel.ta3dy3lakahrba
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    "التعديات : ${masgedModel.t3dy3lyalkhrbaawalmyah ? masgedModel.t3dy3lyalkhrbaawalmyahValue : masgedModel.ta3dy3lakahrba ? masgedModel.ta3dy3lakahrbaValue : masgedModel.t3dy3lyalmyah ? masgedModel.ta3dy3lakahrbaValue : ""}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                    textAlign: TextAlign.right,
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                    masgedModel.t3dy3lyalkhrbaawalmyah ||
                            masgedModel.t3dy3lyalmyah ||
                            masgedModel.ta3dy3lmrafak ||
                            masgedModel.ta3dy3lakahrba
                        ? Divider(
                            height: 9,
                            color: const Color.fromARGB(63, 0, 0, 0),
                          )
                        : Container(),
                    masgedModel.mo5alfat != ""
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                    child: Text(
                                        "الملاحظات : ${masgedModel.mo5alfat}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                        textAlign: TextAlign.right)),
                              ],
                            ),
                          )
                        : Container(),
                    masgedModel.mo5alfat != ""
                        ? Divider(
                            height: 2,
                            color: const Color.fromARGB(63, 0, 0, 0),
                          )
                        : Container(),

                    masgedModel.esthlak3aly != ""
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    "الاستهلاك :${masgedModel.esthlak3aly} ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    masgedModel.esthlak3aly != ""
                        ? Divider(
                            height: 2,
                            color: const Color.fromARGB(63, 0, 0, 0),
                          )
                        : Container(),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "عضو اللجنة الميدانية",
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "بإدارة حماية مرافق المساجد وخدماتها ",
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              masgedModel.signatureRole3 != null && masgedModel.signatureRole3!=""
                                  ? Text(masgedModel.signerNameRole3!)
                                  : Container(),
                              masgedModel.signatureRole3 != null && masgedModel.signatureRole3!=""
                                  ? Image(
                                      width: 100,
                                      height: 50,
                                      fit: BoxFit.fill,
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
                              height: 100,
                              child: Column(
                                children: [
                                  // Text(
                                  //   "باركود التقرير",
                                  //   style: TextStyle(
                                  //       fontSize: 11,
                                  //       fontWeight: FontWeight.bold),
                                  //   textAlign: TextAlign.center,
                                  // ),
                                  QrImageView(
                                    data: masgedModel.qr,
                                    size: 80,
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
      width: 0.4,
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
      child: Container(
        height: 40,
        alignment: Alignment.centerRight,
        color: Colors.white,
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
    );
  }
}
