import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:hemaya/models/Gadwel.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:pdf/widgets.dart' as pw;

class screenshot extends StatefulWidget {
  screenshot({super.key, required this.currentGadwel});
  GadwelModel currentGadwel;
  @override
  State<screenshot> createState() =>
      _screenshotState(currentGadwel: currentGadwel);
}

class _screenshotState extends State<screenshot> {
  _screenshotState({required this.currentGadwel});
  GadwelModel currentGadwel;
  final controller = ScreenshotController();
  @override
  Widget build(BuildContext context) => Screenshot(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                IconButton(
                    onPressed: () async {
                      final image = await controller
                          .captureFromWidget(pdf(currentGadwel));
                      if (image != null) await saveImage(image);
                    },
                    icon: Icon(Icons.print)),
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
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("${currentGadwel!.date!.split(" ")[0]}"),
                                Text(":"),
                                Text("التاريخ"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/1.png",
                      width: 90,
                    ),
                    Image.asset(
                      "assets/2.png",
                      width: 90,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "(أعضاء اللجان الميدانية بإدارة حماية مرافق المساجد و خدماتها)",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" ${currentGadwel!.year} ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                    Text("لعام"),
                    Text(
                      " ${currentGadwel!.month} ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text("جدول العمل لشهر"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "العضو :  ${currentGadwel!.al3dw}",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  children: [
                    CustomDivider(
                      height: 25,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableHead(
                        text: "المراقب - الجوال",
                      ),
                    ),
                    CustomDivider(
                      height: 25,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableHead(
                        text: "عدد المساجد",
                      ),
                    ),
                    CustomDivider(
                      height: 25,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableHead(
                        text: "المركز - الحي",
                      ),
                    ),
                    CustomDivider(
                      height: 25,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableHead(
                        text: "التاريخ",
                      ),
                    ),
                    CustomDivider(
                      height: 25,
                    ),
                    Expanded(
                        child: TableHead(
                      text: "الأسبوع",
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
                        text:
                            "${currentGadwel!.asmalmra8bFrist} ${currentGadwel!.numbermra8bFrist}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text: "${currentGadwel!.numberofmasagedFrist}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text:
                            "${currentGadwel!.centerFrist} - ${currentGadwel!.al7yFrist}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text:
                            " ${currentGadwel!.month}/${currentGadwel!.dateFrist}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                        child: TableCell(
                      text: "الأول",
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
                        text:
                            "  ${currentGadwel!.asmalmra8bSecond} ${currentGadwel!.numbermra8bSecond}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text: "${currentGadwel!.numberofmasagedSecond}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text:
                            "${currentGadwel!.centerSecond} - ${currentGadwel!.al7ySecond}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text:
                            " ${currentGadwel!.month}/${currentGadwel!.dateSecond}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                        child: TableCell(
                      text: "الثاني",
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
                        text:
                            "${currentGadwel!.asmalmra8bThird} ${currentGadwel!.numbermra8bThird}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text: "${currentGadwel!.numberofmasagedThird}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text:
                            "${currentGadwel!.centerThird} - ${currentGadwel!.al7yThird}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text:
                            "${currentGadwel!.month}/${currentGadwel!.dateThird}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                        child: TableCell(
                      text: "الثالث",
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
                        text:
                            "${currentGadwel!.asmalmra8bFourth} ${currentGadwel!.numbermra8bFourth}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text: "${currentGadwel!.numberofmasagedFourth}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text:
                            "${currentGadwel!.centerFourth} - ${currentGadwel!.al7yFourth}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text:
                            "${currentGadwel!.month}/${currentGadwel!.dateFourth}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                        child: TableCell(
                      text: "الرابع",
                    )),
                    CustomDivider(
                      height: 40,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "مشرف اللجان الميدانية",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                        currentGadwel!.signatureRole3 != null
                            ? Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                child: Column(
                                  children: [
                                    Text(currentGadwel!.signerNameRole3!),
                                    Image.network(
                                      currentGadwel!.signatureRole3!,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              )
                            : Container()
                      ],
                    )
                  ],
                )
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

Widget pdf(GadwelModel currentGadwel) => MediaQuery(
      data: MediaQueryData(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(1),
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("${currentGadwel!.date!.split(" ")[0]}"),
                                Text(":"),
                                Text("التاريخ"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/1.png",
                      width: 90,
                    ),
                    Image.asset(
                      "assets/2.png",
                      width: 90,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "(أعضاء اللجان الميدانية بإدارة حماية مرافق المساجد و خدماتها)",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" ${currentGadwel!.year} ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                    Text("لعام"),
                    Text(
                      " ${currentGadwel!.month} ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text("جدول العمل لشهر"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "العضو :  ${currentGadwel!.al3dw}",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  children: [
                    CustomDivider(
                      height: 25,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableHead(
                        text: "المراقب - الجوال",
                      ),
                    ),
                    CustomDivider(
                      height: 25,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableHead(
                        text: "عدد المساجد",
                      ),
                    ),
                    CustomDivider(
                      height: 25,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableHead(
                        text: "المركز - الحي",
                      ),
                    ),
                    CustomDivider(
                      height: 25,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableHead(
                        text: "التاريخ",
                      ),
                    ),
                    CustomDivider(
                      height: 25,
                    ),
                    Expanded(
                        child: TableHead(
                      text: "الأسبوع",
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
                        text:
                            "${currentGadwel!.asmalmra8bFrist} ${currentGadwel!.numbermra8bFrist}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text: "${currentGadwel!.numberofmasagedFrist}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text:
                            "${currentGadwel!.centerFrist} - ${currentGadwel!.al7yFrist}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text:
                            " ${currentGadwel!.month}/${currentGadwel!.dateFrist}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                        child: TableCell(
                      text: "الأول",
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
                        text:
                            "  ${currentGadwel!.asmalmra8bSecond} ${currentGadwel!.numbermra8bSecond}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text: "${currentGadwel!.numberofmasagedSecond}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text:
                            "${currentGadwel!.centerSecond} - ${currentGadwel!.al7ySecond}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text:
                            " ${currentGadwel!.month}/${currentGadwel!.dateSecond}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                        child: TableCell(
                      text: "الثاني",
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
                        text:
                            "${currentGadwel!.asmalmra8bThird} ${currentGadwel!.numbermra8bThird}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text: "${currentGadwel!.numberofmasagedThird}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text:
                            "${currentGadwel!.centerThird} - ${currentGadwel!.al7yThird}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text:
                            "${currentGadwel!.month}/${currentGadwel!.dateThird}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                        child: TableCell(
                      text: "الثالث",
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
                        text:
                            "${currentGadwel!.asmalmra8bFourth} ${currentGadwel!.numbermra8bFourth}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text: "${currentGadwel!.numberofmasagedFourth}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text:
                            "${currentGadwel!.centerFourth} - ${currentGadwel!.al7yFourth}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: TableCell(
                        text:
                            "${currentGadwel!.month}/${currentGadwel!.dateFourth}",
                      ),
                    ),
                    CustomDivider(
                      height: 40,
                    ),
                    Expanded(
                        child: TableCell(
                      text: "الرابع",
                    )),
                    CustomDivider(
                      height: 40,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "مشرف اللجان الميدانية",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                        currentGadwel!.signatureRole3 != null
                            ? Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                child: Column(
                                  children: [
                                    Text(currentGadwel!.signerNameRole3!),
                                    Image.network(
                                      currentGadwel!.signatureRole3!,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              )
                            : Container()
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
Future<String> saveImage(Uint8List bytes) async {
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
  final name = 'gadwal $time';
  final pdf = pw.Document();
  final image = pw.MemoryImage(bytes);

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.standard,
      build: (pw.Context context) {
        return pw.FullPage(
            ignoreMargins: true,
            child: pw.Center(
              child: pw.Image(
                image,
                fit: pw.BoxFit.fill,
              ),
            ));
      },
    ),
  );

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
  Get.snackbar("", "تم حفظ الملف بنجاح");
  return fileSaved;
}
