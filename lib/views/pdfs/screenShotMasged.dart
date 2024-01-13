import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:muslimapp/controllers/masgedController.dart';
import 'package:muslimapp/models/Gadwel.dart';
import 'package:muslimapp/models/Masagedy.dart';
import 'package:muslimapp/views/pdfs/pdf_inspection.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:pdf/widgets.dart' as pw;

class screenshotMasged extends StatefulWidget {
  screenshotMasged({super.key, required this.masagedyModel});
  MasagedyModel masagedyModel;
  @override
  State<screenshotMasged> createState() =>
      _screenshotState(masgedModel: masagedyModel);
}

class _screenshotState extends State<screenshotMasged> {
  _screenshotState({required this.masgedModel});
  MasagedyModel masgedModel;

  final controller = ScreenshotController();
  @override
  Widget build(BuildContext context) => Screenshot(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                IconButton(
                    onPressed: () async {
                      final image = await controller.capture();
                      if (image != null) {
                        await saveImage(image);
                        SnackBar snackBar = SnackBar(
                          content: Text("تم حفظ الصورة بنجاح"),
                          duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    icon: Icon(Icons.print)),
                Padding(
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
                                      Text(
                                          "${masgedModel.date!.split(" ")[0]}"),
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
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
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
                                text: "لمنطقة : ${masgedModel.branch}  ",
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
                            flex: 1,
                            child: checkbox(
                              text: "لا",
                              isChecked: masgedModel.cleaningmasaged == "نعم"
                                  ? false
                                  : true,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: checkbox(
                              text: "نعم",
                              isChecked: masgedModel.cleaningmasaged == "نعم"
                                  ? true
                                  : false,
                            ),
                          ),
                          CustomDivider(
                            height: 40,
                          ),
                          Expanded(
                            flex: 2,
                            child: TableCell(
                              text: ": يوجد مؤسسة صيانة ونظافة  ",
                            ),
                          ),
                          CustomDivider(
                            height: 40,
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          CustomDivider(
                            height: 40,
                          ),
                          Expanded(
                            flex: 2,
                            child: TableCell(
                              text: "قم عداد المياه :5",
                            ),
                          ),
                          CustomDivider(
                            height: 40,
                          ),
                          Expanded(
                            flex: 2,
                            child: TableCell(
                              text: "قم عداد الكهرباء: 8",
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  "مشرف اللجان الميدانية",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                masgedModel.signatureRole2 != null
                                    ? Image(
                                        width: 100,
                                        height: 50,
                                        fit: BoxFit.contain,
                                        image: NetworkImage(
                                            masgedModel.signatureRole2!),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
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
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                masgedModel.signatureRole3 != null
                                    ? Image(
                                        width: 100,
                                        height: 50,
                                        fit: BoxFit.contain,
                                        image: NetworkImage(
                                            masgedModel.signatureRole3!),
                                      )
                                    : Container()
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      controller: controller);
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
          alignment: Alignment.center,
          color: const Color(0xffdfdfdf),
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
          alignment: Alignment.center,
          color: Colors.white,
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ));
  }
}

Future<String> saveImage(Uint8List bytes) async {
  await [Permission.storage].request();
  final time = DateTime.now().millisecondsSinceEpoch.toString();
  final name = 'masged $time';
  final result = await ImageGallerySaver.saveImage(bytes, name: name);
  return result['filePath'];
}
