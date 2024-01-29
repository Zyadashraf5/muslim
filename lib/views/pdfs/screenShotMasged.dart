import 'dart:io';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:muslimapp/controllers/masgedController.dart';
import 'package:muslimapp/models/Gadwel.dart';
import 'package:muslimapp/models/Masagedy.dart';
import 'package:muslimapp/views/pdfs/pdf_inspection.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:device_info_plus/device_info_plus.dart';

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
                        await saveImage(image, masgedModel);
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
                                  "عضو اللجنة الميدانية",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
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

Future<String> saveImage(Uint8List bytes, MasagedyModel masagedyModel) async {
  final plugin = DeviceInfoPlugin();
  final android = await plugin.androidInfo;

  final storageStatus = android.version.sdkInt! < 33
      ? await Permission.storage.request()
      : PermissionStatus.granted;

  if (storageStatus.isDenied) {
    print(
        "Storage permission permanently denied. Open app settings to enable.");
    openAppSettings();
    return "Error: Storage permission permanently denied";
  }
  final time = DateTime.now().millisecondsSinceEpoch.toString();
  final name = 'masged $time';
  final pdf = pw.Document();
  final image = pw.MemoryImage(bytes);
  List<Uint8List> images = [];

  if (masagedyModel.was2k != null) {
    await Future.forEach(masagedyModel.was2k!, (link) async {
      images.add(await NetworkAssetBundle(Uri.parse(link))
          .load("")
          .then((value) => value.buffer.asUint8List()));
    });
  }

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Center(child: pw.Expanded(child: pw.Image(image)));
      },
    ),
  );

  if (images.isNotEmpty) {
    await Future.forEach(images, (element) async {
      final image = pw.MemoryImage(element);
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Image(image);
          },
        ),
      );
    });
  }

  Directory output = Directory('/storage/emulated/0/Download');
  final file = File("${output!.path}/$name.pdf");
  final pdfBytes = await pdf.save();

  await file.writeAsBytes(pdfBytes);
  Uint8List data = await file.readAsBytes();

  // Save the PDF file using FileSaver
  final fileSaved = await FileSaver.instance.saveFile(
    name: "$name.pdf",
    bytes: data,
    mimeType: MimeType.pdf,
    filePath: output.path,
    file: file,
  );
  print(fileSaved);
  return fileSaved;
}
