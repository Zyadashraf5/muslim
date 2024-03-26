import 'dart:io';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:hemaya/controllers/masgedController.dart';
import 'package:hemaya/models/Gadwel.dart';
import 'package:hemaya/models/Masagedy.dart';
import 'package:hemaya/views/pdfs/pdf_inspection.dart';
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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                IconButton(
                    onPressed: () async {
                      final image = await controller.captureFromWidget(
                          screenshotMasgedImage(masgedModel));
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
                        "( تقرير زيارة )",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
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
                                      "الاستهلاك :${masgedModel.esthlak3aly}",
                                      textAlign: TextAlign.right,
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
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "بإدارة حماية مرافق المساجد وخدماتها ",
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

Widget screenshotMasgedImage(masgedModel) => MediaQuery(
      data: MediaQueryData(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
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
                        "( تقرير زيارة )",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
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
                                      "الاستهلاك : ${masgedModel.esthlak3aly}",
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
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "بإدارة حماية مرافق المساجد وخدماتها ",
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

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

  if (images.isNotEmpty) {
    await Future.forEach(images, (element) async {
      final image = pw.MemoryImage(element);
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(child: pw.Image(image));
          },
        ),
      );
    });
  }
  Directory? output;
  if (Platform.isAndroid) {
    output = Directory('/storage/emulated/0/Download');
  } else {
    output = await getApplicationDocumentsDirectory();
  }
  final file = File("${output.path}/$name.pdf");
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
