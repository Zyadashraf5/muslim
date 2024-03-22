import 'dart:io';

import 'dart:typed_data';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:hemaya/models/Masagedy.dart';
import 'package:hemaya/views/pdfs/pdf_inspection.dart';
import 'package:hemaya/views/profile/profile.screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QrcodeController extends GetxController {
  bool isloading = true;
  String? ssn;

  @override
  Future<void> onInit() async {
    isloading = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    ssn = await preferences.getString("ssn");
    isloading = false;
    update();
    super.onInit();
  }

  final GlobalKey qrkey = GlobalKey();
  bool dirExists = false;
  dynamic externalDir = '/storage/emulated/0/Download/Qr_code';
  Future<Uint8List> generateQrCode(
      BuildContext context, String masgedId) async {
    try {
      RenderRepaintBoundary boundary =
          qrkey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);

      //Drawing White Background because Qr Code is Black
      final whitePaint = Paint()..color = Colors.white;
      final recorder = PictureRecorder();
      final canvas = Canvas(recorder,
          Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()));
      canvas.drawRect(
          Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
          whitePaint);
      canvas.drawImage(image, Offset.zero, Paint());
      final picture = recorder.endRecording();
      final img = await picture.toImage(image.width, image.height);
      ByteData? byteData = await img.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      return pngBytes;
    } catch (e) {
      return Uint8List(0);
    }
  }

  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode("#2A99CF", "cancel", true, ScanMode.QR)
          .then((value) async {
        final snapshot = await FirebaseFirestore.instance
            .collection("masgedy")
            .doc(value)
            .get();
        MasagedyModel masgedModel = MasagedyModel.fromSnapShot(snapshot);
        if (masgedModel.namemasaged == null) {
          Get.snackbar("خطأ", "الكود غير صحيح");
          return;
        }

        Get.to(PdfInspection(masgedModel: masgedModel));
      });
    } catch (e) {}
    update();
  }
}
