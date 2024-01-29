import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:muslimapp/controllers/authController.dart';
import 'package:muslimapp/controllers/masgedController.dart';
import 'package:muslimapp/models/Asnhlak3aly.dart';
import 'package:muslimapp/models/Gadwel.dart';
import 'package:muslimapp/models/Masagedy.dart';
import 'package:muslimapp/models/UserModel.dart';
import 'package:muslimapp/views/Asnhlak3aly/Asnhlak3aly.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:muslimapp/views/profile/myAnalytics.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  List<Map<UserModel, MasagedyModel>> usersDashboard = [];
  List<Map<UserModel, GadwelModel>> gadwelDashboard = [];
  List<MasagedyModel> masaged = [];
  UserModel? filteredUser;
  String? filterDate;
  int myMo5lfat = 0;
  List<GadwelModel> myGadwalss = [];
  List<MasagedyModel> myMasagedss = [];
  MasagedyModel? selectedMasged;
  bool listShownMasaged = false;
  List<Asnhlak3alyModel> esthlak = [];
  List<UserModel> allUsers = [];
  bool listShown = false;
  bool listShown2 = false;
  String selectedDoc = '';
  String selectedUser = '';
  List<GadwelModel> gadawel = [];
  List<GadwelModel> ownGadawel = [];
  List<MasagedyModel> allMasaged = [];
  Map<DateTime, int> masgedsssDataChart = {};
  Map<DateTime, int> gadwelsssDataChart = {};
  @override
  void onInit() async {
    await getUsersWithDoc();
    await getAll();
    await getallGadwel();
    await myGadawel();
    await getAllMasaged();
    await getUserWithGadwels();
    super.onInit();
  }

  Future<void> getAllMasaged() async {
    MasgedController masgedController = Get.put(MasgedController());
    await masgedController.getAll();
    allMasaged = masgedController.allMasaged;
    masgedController.update();
    update();
  }

  Future<void> getAllEsthlak() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('esthlak')
        .where('signed', isEqualTo: false)
        .get();

    await Future.forEach(snapshot.docs, (element) async {
      esthlak.add(await Asnhlak3alyModel.fromSnapShot(element));
    });
    update();
  }

  String documentContent = 'Document content!';

  Future<void> saveAsPdf(BuildContext context) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(documentContent),
          );
        },
      ),
    );
    try {
      final downloadsDirectory = await getDownloadsDirectory();
      final file = File('${downloadsDirectory!.path}/output.pdf');
      await file.writeAsBytes(await pdf.save());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Saved to ${downloadsDirectory.path}'),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAll() async {
    allUsers = [];
    update();
    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    List<UserModel> users =
        snapshot.docs.map((e) => UserModel.fromSnapShot(e)).toList();
    allUsers = users;
    update();
  }

  Future<void> shareDoc(String ssn, docId) async {
    final snapshot =
        await FirebaseFirestore.instance.collection("Gadwel").doc(docId).get();
    GadwelModel gadwal = GadwelModel.fromSnapShot(snapshot);
    gadwal.users!.add(ssn);
    await FirebaseFirestore.instance
        .collection("Gadwel")
        .doc(docId)
        .update(gadwal.toJson());
  }

  Future<void> getallGadwel() async {
    gadawel = [];
    update();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ssn = prefs.getString('ssn')!;
    final snapshot = await FirebaseFirestore.instance
        .collection("Gadwel")
        .where("seenUsers", arrayContains: ssn)
        .get();
    List<GadwelModel> gadwel =
        snapshot.docs.map((e) => GadwelModel.fromSnapShot(e)).toList();
    gadawel = gadwel;
    update();
  }

  Future<void> myGadawel() async {
    ownGadawel = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ssn = prefs.getString('ssn')!;
    update();
    final snapshot = await FirebaseFirestore.instance
        .collection("Gadwel")
        .where('users', arrayContains: ssn)
        .get();
    List<GadwelModel> gadwel = snapshot.docs
        .where((doc) => !doc['seenUsers'].contains(ssn.toString()))
        .map((e) => GadwelModel.fromSnapShot(e))
        .toList();
    ownGadawel = gadwel;

    update();
  }

  Future<void> archiveDoc(String docId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ssn = prefs.getString('ssn')!;
    final snapshot = await FirebaseFirestore.instance
        .collection("Gadwel")
        .doc(docId)
        .update({
      "seenUsers": FieldValue.arrayUnion([ssn])
    });
    update();
  }

  Future<void> deleteGadwelDocument(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection("Gadwel")
          .doc(documentId)
          .delete();
      print('Document deleted successfully');
      await getallGadwel();
      await myGadawel();
      update();
    } catch (error) {
      print('Error deleting document: $error');
      // Handle errors or show an error message.
    }
  }

  Future<void> getUsersWithDoc([UserModel? filter, String? dateOption]) async {
    update();
    if (filter == null && dateOption == null) {
      final snapshot =
          await FirebaseFirestore.instance.collection("masgedy").get();
      List<MasagedyModel> masgedy =
          snapshot.docs.map((e) => MasagedyModel.fromSnapShot(e)).toList();

      List<Map<UserModel, MasagedyModel>> masgedsCount = [];
      await Future.forEach(masgedy, (masged) async {
        final userSnap = await FirebaseFirestore.instance
            .collection("users")
            .where('ssn', isEqualTo: masged.creator)
            .get();
        final user = await UserModel.fromSnapShot(userSnap.docs.first);
        masgedsCount.add({user: masged});
      });
      usersDashboard = masgedsCount;
    } else if (dateOption == null) {
      final snapshot = await FirebaseFirestore.instance
          .collection("masgedy")
          .where("creator", isEqualTo: filter!.ssn)
          .get();
      List<MasagedyModel> masgedy =
          snapshot.docs.map((e) => MasagedyModel.fromSnapShot(e)).toList();

      List<Map<UserModel, MasagedyModel>> masgedsCount = [];
      await Future.forEach(masgedy, (masged) async {
        final userSnap = await FirebaseFirestore.instance
            .collection("users")
            .where('ssn', isEqualTo: masged.creator)
            .get();
        final user = await UserModel.fromSnapShot(userSnap.docs.first);
        masgedsCount.add({user: masged});
      });
      usersDashboard = masgedsCount;
    } else if (dateOption == "شهري") {
      filterDate = dateOption;
      final snapshot = await FirebaseFirestore.instance
          .collection("masgedy")
          .where("date",
              isGreaterThanOrEqualTo:
                  DateTime.now().subtract(Duration(days: 31)).toString())
          .get();
      List<MasagedyModel> masgedy =
          snapshot.docs.map((e) => MasagedyModel.fromSnapShot(e)).toList();

      List<Map<UserModel, MasagedyModel>> masgedsCount = [];
      await Future.forEach(masgedy, (masged) async {
        final userSnap = await FirebaseFirestore.instance
            .collection("users")
            .where('ssn', isEqualTo: masged.creator)
            .get();
        final user = await UserModel.fromSnapShot(userSnap.docs.first);
        masgedsCount.add({user: masged});
      });
      usersDashboard = masgedsCount;
    } else {
      filterDate = dateOption;
      final snapshot = await FirebaseFirestore.instance
          .collection("masgedy")
          .where("date",
              isGreaterThanOrEqualTo:
                  DateTime.now().subtract(Duration(days: 365)).toString())
          .get();
      List<MasagedyModel> masgedy =
          snapshot.docs.map((e) => MasagedyModel.fromSnapShot(e)).toList();

      List<Map<UserModel, MasagedyModel>> masgedsCount = [];
      await Future.forEach(masgedy, (masged) async {
        final userSnap = await FirebaseFirestore.instance
            .collection("users")
            .where('ssn', isEqualTo: masged.creator)
            .get();
        final user = await UserModel.fromSnapShot(userSnap.docs.first);
        masgedsCount.add({user: masged});
      });
      usersDashboard = masgedsCount;
    }

    update();
  }

  Future<void> getUserWithGadwels(
      [UserModel? filter, String? dateOption]) async {
    update();
    if (filter == null && dateOption == null) {
      final snapshot =
          await FirebaseFirestore.instance.collection("Gadwel").get();
      List<GadwelModel> gadawel =
          snapshot.docs.map((e) => GadwelModel.fromSnapShot(e)).toList();

      List<Map<UserModel, GadwelModel>> masgedsCount = [];
      await Future.forEach(gadawel, (gadwal) async {
        final userSnap = await FirebaseFirestore.instance
            .collection("users")
            .where('ssn', isEqualTo: gadwal.creator)
            .get();
        final user = await UserModel.fromSnapShot(userSnap.docs.first);
        masgedsCount.add({user: gadwal});
      });
      gadwelDashboard = masgedsCount;
    } else if (dateOption == null) {
      final snapshot = await FirebaseFirestore.instance
          .collection("Gadwel")
          .where("creator", isEqualTo: filter!.ssn)
          .get();
      List<GadwelModel> gadawel =
          snapshot.docs.map((e) => GadwelModel.fromSnapShot(e)).toList();

      List<Map<UserModel, GadwelModel>> masgedsCount = [];
      await Future.forEach(gadawel, (gadwal) async {
        final userSnap = await FirebaseFirestore.instance
            .collection("users")
            .where('ssn', isEqualTo: gadwal.creator)
            .get();
        final user = await UserModel.fromSnapShot(userSnap.docs.first);
        masgedsCount.add({user: gadwal});
      });
      gadwelDashboard = masgedsCount;
    } else if (dateOption == "شهري") {
      final snapshot = await FirebaseFirestore.instance
          .collection("Gadwel")
          .where("date",
              isGreaterThanOrEqualTo:
                  DateTime.now().subtract(Duration(days: 31)).toString())
          .get();
      List<GadwelModel> gadawel =
          snapshot.docs.map((e) => GadwelModel.fromSnapShot(e)).toList();

      List<Map<UserModel, GadwelModel>> masgedsCount = [];
      await Future.forEach(gadawel, (gadwal) async {
        final userSnap = await FirebaseFirestore.instance
            .collection("users")
            .where('ssn', isEqualTo: gadwal.creator)
            .get();
        final user = await UserModel.fromSnapShot(userSnap.docs.first);
        masgedsCount.add({user: gadwal});
      });
      gadwelDashboard = masgedsCount;
    } else {
      final snapshot = await FirebaseFirestore.instance
          .collection("Gadwel")
          .where("date",
              isGreaterThanOrEqualTo:
                  DateTime.now().subtract(Duration(days: 365)).toString())
          .get();
      List<GadwelModel> gadawel =
          snapshot.docs.map((e) => GadwelModel.fromSnapShot(e)).toList();

      List<Map<UserModel, GadwelModel>> masgedsCount = [];
      await Future.forEach(gadawel, (gadwal) async {
        final userSnap = await FirebaseFirestore.instance
            .collection("users")
            .where('ssn', isEqualTo: gadwal.creator)
            .get();
        final user = await UserModel.fromSnapShot(userSnap.docs.first);
        masgedsCount.add({user: gadwal});
      });
      gadwelDashboard = masgedsCount;
    }

    update();
  }

  Future<void> getMyAnalytics() async {
    AuthControler authControler = Get.put(AuthControler());
    final ssn = await authControler.getssn();
    final gadwalSnap = await FirebaseFirestore.instance
        .collection("Gadwel")
        .where("creator", isEqualTo: ssn)
        .get();
    List<GadwelModel> myGadwels =
        gadwalSnap.docs.map((e) => GadwelModel.fromSnapShot(e)).toList();
    final masgedSnap = await FirebaseFirestore.instance
        .collection("masgedy")
        .where("creator", isEqualTo: ssn)
        .get();
    List<MasagedyModel> myMasageds =
        masgedSnap.docs.map((e) => MasagedyModel.fromSnapShot(e)).toList();
    myGadwalss = myGadwels;
    myMasagedss = myMasageds;
    int mola7azat = 0;
    await Future.forEach(
        myMasageds,
        (masged) => {
              if (masged.mo5alfat != "")
                {mola7azat += masged.mo5alfat!.split("-").length},
              print(masged.mo5alfat!)
            });
    myMo5lfat = mola7azat;
    Map<DateTime, int> masgedsDataChart = {};
    Map<DateTime, int> gadwelsDataChart = {};
    String date;
    List dataa;
    await Future.forEach(
        myMasageds,
        (element) => {
              dataa = element.date!.split(" ")[0].split(""),
              dataa.removeLast(),
              dataa.add("1"),
              date = dataa.join(),
              if (masgedsDataChart.keys.contains(DateTime.parse(date)))
                {
                  masgedsDataChart[DateTime.parse(date)] =
                      masgedsDataChart[DateTime.parse(date)]! + 1
                }
              else
                {masgedsDataChart[DateTime.parse(date)] = 1}
            });
    masgedsssDataChart = masgedsDataChart;
    await Future.forEach(
        myGadwels,
        (element) => {
              dataa = element.date!.split(" ")[0].split(""),
              dataa.removeLast(),
              dataa.add("1"),
              date = dataa.join(),
              if (gadwelsDataChart.keys.contains(DateTime.parse(date)))
                {
                  gadwelsDataChart[DateTime.parse(date)] =
                      gadwelsDataChart[DateTime.parse(date)]! + 1
                }
              else
                {gadwelsDataChart[DateTime.parse(date)] = 1}
            });
    gadwelsssDataChart = gadwelsDataChart;
    update();
  }
}
