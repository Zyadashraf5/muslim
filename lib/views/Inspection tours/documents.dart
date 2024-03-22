import 'dart:ffi';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../controllers/Asnhlak3alyController.dart';
import '../../controllers/masgedController.dart';

class documents extends GetView<MasgedController> {
  documents({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MasgedController());
    return Scaffold(body: GetBuilder<MasgedController>(
      builder: (controller) {
        return Stack(
          children: [
            Positioned(
              child: Image.asset(
                "assets/backgroud1.png",
              ),
              width: MediaQuery.of(context).size.width,
              right: 0,
            ),
            Positioned(
              top: 40,
              right: 0,
              left: 0,
              bottom: 40,
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/logo1.png",
                      height: 100,
                    ),
                    Text(
                      "وزارة الشؤون الاسلاميه و الدعوة و الارشاد ",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "TajawalMedium",
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            //top 180 left 150

            //top 240 left 60
            Positioned(
              top: 240,
              left: 20,
              right: 20,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        controller.selectedImagegalley =
                            await fromCameraImage();
                        controller.update();
                      },
                      child: Container(
                        width: 330,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 7,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                              color: Colors.green.shade700, width: 4.0),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: Colors.grey,
                            ),
                            Text(
                              "كاميرا",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "TajawalMedium",
                                  color: Colors.black),
                            ),
                            Image.asset(
                              "assets/fghj.png",
                              width: 40,
                              height: 60,
                              color: Colors.green,
                            ),
                          ],
                          mainAxisSize: MainAxisSize.min,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    controller.selectedImagegalley != null
                        ? Container(
                            width: 300,
                            child: Center(
                              child: Text(controller.selectedImagegalley
                                  .toString()
                                  .split('/')
                                  .last),
                            ))
                        : Container(),
                    InkWell(
                      onTap: () async {
                        controller.file = await fromFileImage();
                        controller.update();
                      },
                      child: Container(
                        width: 330,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 7,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                              color: Colors.green.shade700, width: 4.0),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: Colors.grey,
                            ),
                            Text(
                              "رفع صورة",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "TajawalMedium",
                                  color: Colors.black),
                            ),
                            Image.asset(
                              "assets/doumo.png",
                              width: 40,
                              height: 60,
                              color: Colors.green,
                            ),
                          ],
                          mainAxisSize: MainAxisSize.min,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    controller.selectedImagegalley != null
                        ? Container(
                            width: 300,
                            child: Center(
                              child: Text(controller.selectedImagegalley
                                  .toString()
                                  .split('/')
                                  .last),
                            ))
                        : Container(),
                    InkWell(
                      onTap: () async {
                        controller.file = await openFileExplorer();
                        controller.update();
                      },
                      child: Container(
                        width: 330,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 7,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                              color: Colors.green.shade700, width: 4.0),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: Colors.grey,
                            ),
                            Text(
                              "رفع ملف",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "TajawalMedium",
                                  color: Colors.black),
                            ),
                            Image.asset(
                              "assets/doummo.png",
                              width: 40,
                              height: 60,
                              color: Colors.green,
                            ),
                          ],
                          mainAxisSize: MainAxisSize.min,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () async {
                          Get.back();
                        },
                        child: Container(
                          height: 50,
                          width: 380,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green.shade300),
                          child: Center(
                            child: Text(
                              "التالي ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "robot",
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    ));
  }
}

Future<List<File>> fromFileImage() async {
  print("fromFileImage");
  final returnedImage = await ImagePicker().pickMultiImage();

  if (returnedImage == null) return [];
  return returnedImage.map((e) => File(e.path)).toList();
}

Future<File> fromCameraImage() async {
  print("fromCameraImage");
  final returnedImage =
      await ImagePicker().pickImage(source: ImageSource.camera);
  if (returnedImage == null) return File("");

  return File(returnedImage.path);
}

Future<List<File>> openFileExplorer() async {
  try {
    // Open file picker
    PermissionStatus permissionStatus = await Permission.storage.request();

    if (permissionStatus.isGranted) {
      print("granted");
    } else {
      print("not granted");
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
      allowMultiple: true,
    );

    if (result != null) {
      List<PlatformFile> files = result.files;
      List<File> filePaths =
          files.map((file) => File(file.path ?? 'No file path found')).toList();
      return filePaths;
      // Here, you can use the file paths to perform further operations like uploading.
      // Upload logic can be implemented using other packages or APIs.
    }
    return [];
  } catch (e) {
    print('File picking failed: $e');
    return [];
  }
}
