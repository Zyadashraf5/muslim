import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:hemaya/controllers/homeController.dart';
import 'package:hemaya/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignatureController extends GetxController {
  bool isLoading = true;
  File? selectedimageSignature;
  String? urlSignature;

  @override
  void onInit() async {
    await getCurrentSignature();
    isLoading = false;
    super.onInit();
  }

  Future<void> getCurrentSignature() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final ssn = await preferences.get('ssn');
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(ssn.toString())
        .get();
    UserModel user = UserModel.fromSnapShot(snapshot);
    urlSignature = user.imagesignature;
    update();
  }

  Future<void> selectSignature() async {
    isLoading = true;
    update();
    FirebaseStorage storage = FirebaseStorage.instance;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final ssn = await preferences.get('ssn');
    Reference ref = storage.ref().child(
        "signatures/${ssn}${selectedimageSignature!.path.split('/').last}");
    UploadTask uploadTask = ref.putFile(selectedimageSignature!);
    uploadTask.whenComplete(() async {
      String url = await ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection("users")
          .doc(ssn.toString())
          .update({
        "imagesignature": url,
      });
      urlSignature = url;
      isLoading = false;
      update();
      HomeController homeController = Get.find();
      await homeController.myGadawel();
      homeController.update();
    });
  }
}
