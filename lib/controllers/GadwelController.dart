import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hemaya/controllers/homeController.dart';
import 'package:hemaya/models/UserModel.dart';
import 'package:hemaya/views/signature/signature.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Gadwel.dart';

class GadwelController extends GetxController {
  GadwelModel? currentGadwel;
  List<GadwelModel> allGadwels = [];
  var al3dwController = TextEditingController();
  var yearController = TextEditingController();
  var monthController = TextEditingController();
  var weekControllerfrist = TextEditingController();
  var dateControllerfrist = TextEditingController();
  var centerControllerfrist = TextEditingController();
  var al7yControllerfrist = TextEditingController();
  var numberofmasagedControllerfrist = TextEditingController();
  var asmalmra8bControllerfrist = TextEditingController();
  var numbermra8bControllerfrist = TextEditingController();
//1
  var weekControllerSecond = TextEditingController();
  var dateControllerSecond = TextEditingController();
  var centerControllerSecond = TextEditingController();
  var al7yControllerSecond = TextEditingController();
  var numberofmasagedControllerSecond = TextEditingController();
  var asmalmra8bControllerSecond = TextEditingController();
  var numbermra8bControllerSecond = TextEditingController();
  //2

  var weekControllerthird = TextEditingController();
  var dateControllerthird = TextEditingController();
  var centerControllerthird = TextEditingController();
  var al7yControllerthird = TextEditingController();
  var numberofmasagedControllerthird = TextEditingController();
  var asmalmra8bControllerthird = TextEditingController();
  var numbermra8bControllerthird = TextEditingController();

  //3
  var weekControllerfourth = TextEditingController();
  var dateControllerfourth = TextEditingController();
  var centerControllerfourth = TextEditingController();
  var al7yControllerfourth = TextEditingController();
  var numberofmasagedControllerfourth = TextEditingController();
  var asmalmra8bControllerfourth = TextEditingController();
  var numbermra8bControllerfourth = TextEditingController();
  List<GadwelModel> ownGadawel = [];
  List weeksfrist = [
    "الاول",
    "اختر",
  ];
  List weeksSecond = [
    "الثاني",
    "اختر",
  ];
  List weeksthird = [
    "الثالث",
    "اختر",
  ];
  List weeksfourth = [
    "الرابع",
    "اختر",
  ];

  List center = [
    "الشمال",
    "الجنوب",
    "الوسط",
    "الغرب",
    "الشرق",
  ];
  List centerSecond = [
    "الشمال",
    "الجنوب",
    "الوسط",
    "الغرب",
    "الشرق",
  ];
  List centerthird = [
    "الشمال",
    "الجنوب",
    "الوسط",
    "الغرب",
    "الشرق",
  ];
  List centerfourth = [
    "الشمال",
    "الجنوب",
    "الوسط",
    "الغرب",
    "الشرق",
  ];
  Future<void> ownGadwel() async {
    ownGadawel = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ssn = prefs.getString('ssn')!;
    update();
    final snapshot = await FirebaseFirestore.instance
        .collection("Gadwel")
        .where('users', arrayContains: ssn)
        .get();
    List<GadwelModel> gadwel =
        snapshot.docs.map((e) => GadwelModel.fromSnapShot(e)).toList();
    ownGadawel = gadwel;

    update();
  }

  Future<void> createGadwel(userSSN) async {
    if (userSSN == null) {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      userSSN = await preferences.get('ssn');
    }

    GadwelModel gadwel = GadwelModel(
      date: DateTime.now().toString(),
      users: [userSSN],
      seenUsers: [],
      signedRole2: false,
      signedRole3: false,
      creator: userSSN,
      al3dw: al3dwController.text,
      year: yearController.text,
      month: monthController.text,
      weekFrist: weekControllerfrist.text,
      weekSecond: weekControllerSecond.text,
      weekThird: weekControllerthird.text,
      weekFourth: weekControllerfourth.text,
      dateFrist: dateControllerfrist.text,
      dateSecond: dateControllerSecond.text,
      dateThird: dateControllerthird.text,
      dateFourth: dateControllerfourth.text,
      centerFrist: centerControllerfrist.text,
      centerSecond: centerControllerSecond.text,
      centerThird: centerControllerthird.text,
      centerFourth: centerControllerfourth.text,
      al7yFrist: al7yControllerfrist.text,
      al7ySecond: al7yControllerSecond.text,
      al7yThird: al7yControllerthird.text,
      al7yFourth: al7yControllerfourth.text,
      numberofmasagedFrist: numberofmasagedControllerfrist.text,
      numberofmasagedSecond: numberofmasagedControllerSecond.text,
      numberofmasagedThird: numberofmasagedControllerthird.text,
      numberofmasagedFourth: numberofmasagedControllerfourth.text,
      asmalmra8bFrist: asmalmra8bControllerfrist.text,
      asmalmra8bSecond: asmalmra8bControllerSecond.text,
      asmalmra8bThird: asmalmra8bControllerthird.text,
      asmalmra8bFourth: asmalmra8bControllerfourth.text,
      numbermra8bFrist: numbermra8bControllerfrist.text,
      numbermra8bSecond: numbermra8bControllerSecond.text,
      numbermra8bThird: numbermra8bControllerthird.text,
      numbermra8bFourth: numbermra8bControllerfourth.text,
    );
    final yearMonth = gadwel.year + gadwel.month;
    await FirebaseFirestore.instance
        .collection("Gadwel")
        .doc(yearMonth)
        .set(gadwel.toJson());
    HomeController homeController = Get.put(HomeController());
    await homeController.myGadawel();
    await homeController.getAll();
    await homeController.getallGadwel();
    homeController.update();
  }

  Future<GadwelModel> getCurrentMonth(String month, Year) async {
    final yearMonth = Year + month;
    final snapshot = await FirebaseFirestore.instance
        .collection('Gadwel')
        .doc(yearMonth)
        .get();
    currentGadwel = GadwelModel.fromSnapShot(snapshot);
    update();
    return currentGadwel!;
  }

  Future<void> allGadwals() async {
    allGadwels.clear();
    final snapshot =
        await FirebaseFirestore.instance.collection("Gadwel").get();
    allGadwels = snapshot.docs.map((e) => GadwelModel.fromSnapShot(e)).toList();
  }

  Future<void> editData(String documentId, GadwelModel newData) async {
    try {
      await FirebaseFirestore.instance
          .collection('Gadwel')
          .doc(documentId)
          .update(newData.toJson());
      print('تم التعديل الجدول');
    } catch (e) {
      print('غطاء في تعديل : $e');
    }
  }

  Future<void> signDoc(String documentId) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final ssn = await preferences.get('ssn');
      final userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(ssn.toString())
          .get();

      UserModel user = UserModel.fromSnapShot(userSnap);

      await FirebaseFirestore.instance
          .collection('Gadwel')
          .doc(documentId)
          .update({
        'signedRole3': true,
        'signerSSNRole3': ssn,
        "signerNameRole3": user.name,
        "signatureRole3": user.imagesignature,
      });

      print('تم التعديل الجدول');
    } catch (e) {
      print('غطاء في تعديل : $e');
    }
  }
}
