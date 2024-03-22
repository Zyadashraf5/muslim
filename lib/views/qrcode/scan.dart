import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hemaya/controllers/qrcodeController.dart';
import 'package:hemaya/views/loading/loading.dart';
import 'package:hemaya/views/profile/profile.screen.dart';

class Scan extends GetView<QrcodeController> {
  const Scan({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QrcodeController());
    return Scaffold(body: GetBuilder<QrcodeController>(
      builder: (QrcodeController controller) {
        return controller.isloading
            ? Loading()
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        child: Text(
                          "Scan",
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: controller.scanQr),
                  ],
                ),
              );
      },
    ));
  }
}
