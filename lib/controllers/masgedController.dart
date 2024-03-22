import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hemaya/views/signature/signature.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hemaya/controllers/qrcodeController.dart';
import 'package:hemaya/models/Masagedy.dart';
import 'package:hemaya/models/UserModel.dart';
import 'package:hemaya/routes/app_pages.dart';
import 'package:pdf/widgets.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode/barcode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class CheckBoxState {
  final String title;
  bool value;
  bool other;
  String otherValue = "";
  CheckBoxState({required this.title, this.value = false, this.other = false});
}

CheckBoxState Infringement =
    CheckBoxState(title: "تعدي على كهرباء", other: true);
CheckBoxState Infringement1 =
    CheckBoxState(title: "تعدي على المياه", other: true);
CheckBoxState Infringement2 =
    CheckBoxState(title: "تعدي على الكهرباء والمياه", other: true);

CheckBoxState Infringement3 =
    CheckBoxState(title: "تعدي علي المرافق", other: true);
List<CheckBoxState> titles = [
  Infringement,
  Infringement1,
  Infringement2,
  Infringement3,
];

class MasgedController extends GetxController {
  @override
  void onInit() async {
    await getAll();
    await getAllSigned2Ways();
    await getAllSigned();
    super.onInit();
  }

  //late final DateTime? selectedDate = DateTime.now();
  TextEditingController searchController = TextEditingController();
  List<MasagedyModel> searchMasaged = [];
  List<MasagedyModel> allMasaged = [];
  List<MasagedyModel> allSigned2WayMasaged = [];
  File? selectedImagegalley;
  var files;
  List<File> file = [];
  List<MasagedyModel> masged = [];
  List<MasagedyModel> allSignedMasaged = [];
  List<MasagedyModel> allMasagedOnMap = [];
  String? mo5alfat = "";
  bool isSelected = false;
  var seletedtaker;
  DateTime? selectedDate;
  MasagedyModel? currentMasged;
  List<String>? wasa2k;
  LatLng? selectedLocation;
  int words = 0;
  bool isLoading = false;

  File? selectedFile;

  File? _selectedImage;
  File? selectedSak;
  var selectedOption;
  String esthlak = "";
  String? ssn;

  TimeOfDay? dateTime;

  String? valuechoose;
  bool creatingLoading = false;
  List branch = [
    "الرياض",
    "مكة المكرمة",
    "المدينة المنورة",
    "القصيم",
    "الشرقية",
    "عسير",
    "تبوك",
    "حائل",
    "الحدود الشمالية",
    "جازان",
    "نجران",
    "الباحة",
    "الجوف"
  ];

  List Governorate = [
    "الدرعية",
    "المجمعة",
    "المزاحمية",
    "القويعية",
    "الحريق",
    "الغاط",
    "الخرج",
    "الدوادمي",
    "وادي الدواسر",
    "الافلاح",
    "الزلفي",
    "شقراء",
    "حوطة بني تميم",
    "عفيف",
    "السليل",
    "ضرما",
    "رماح",
    "ثادق",
    "حريملاء",
    "مرات",
    "الدلم",
    "الرين",
    "الرياض"
  ];

  List Centerr = [
    "شمال الرياض",
    "شرق الرياض",
    "وسط الرياض",
    "غرب الرياض",
    "جنوب الرياض",
  ];

  List masgedwasera = [
    "نعم",
    "لا",
  ];
  List Employeesmasged = [
    "نعم",
    "لا",
  ];
  List rememberEmployeesmasged = [
    "أمام",
    "مؤذن",
    "خادم",
    "أمام ومؤذن",
    "أمام ومؤذن وخادم",
  ];

  List homeEmployeesmasged = [
    "نعم",
    "لا",
  ];
  List homerememberEmployeesmasged = [
    "سكن للامام",
    "سكن للمؤذن",
    "سكن اإلمام والمؤذن",
  ];

  //نعم مؤسسة الصيانة ) أسم الشركة ( – اخر ) السم (
  List cleaningmasaged = [
    "نعم",
    "لا",
  ];
  List typehomeamam = [
    "شقة",
    "دور",
    "فيلا",
  ];
  List homeamam = [
    "مستفيد",
    "مؤجر",
  ];
  List electricandwaterforamam = [
    "مستقلة",
    "مشترك المياه مع المسجد",
    "مشترك الكهرباء مع المسجد",
    " مشترك المياه مع المؤذن",
    "  مشترك الكهرباء مع المؤذن ",
  ];
  List numberelectric = [
    "نعم",
    "لا",
  ];
  List numberwater = [
    "نعم",
    "لا",
  ];
  List typeMuezzin = [
    "شقة",
    "دور",
    "فيلا",
  ];

  List homeMuezzin = [
    "مستفيد",
    "مؤجر",
  ];
  List electricandwaterforMuezzin = [
    "مستقلة",
    "مشترك المياه مع المسجد",
    "مشترك الكهرباء مع المسجد",
    " مشترك المياه مع المؤذن",
    "  مشترك الكهرباء مع المؤذن ",
  ];
  List numberelectricMuezzin = [
    "نعم",
    "لا",
  ];
  List numberwaterMuezzin = [
    "نعم",
    "لا",
  ];
  List AppointmentDecision = [
    "مكافاة",
    "عقد",
    "محتسب",
    " متقدم",
  ];
  List AppointmentDecisionMuezzin = [
    "مكافاة",
    "عقد",
    "محتسب",
    " متقدم",
  ];
  List AppointmentDecisionServer = [
    "مكافاة",
  ];
  List mr8bmasaged = [
    "نعم",
    "لا",
  ];
  List mraf8masged = [
    "نعم",
    "لا",
  ];
  List remembermraf8masged = [
    "محالت تجارية",
    "فيلا",
    "شقة",
    "ملاحق",
    "بناء عشوائي",
    "مستودع",
    "أوقاف",
    "مدرسة",
    "دار تحفيظ",
    "جمعيات",
    "أرض فضاء",
  ];
  String? currentShare;

  LatLng location = LatLng(0, 0);
  var remembernumberelectricController = TextEditingController();
  var remembernumberwaterController = TextEditingController();
  var masgedwaseraController = TextEditingController();
  var branchController = TextEditingController();
  var cleaningmasagedController = TextEditingController();
  var remembercleaningmasagedController = TextEditingController();
  var namemasagedController = TextEditingController();
  var GovernorateController = TextEditingController();
  var CenterController = TextEditingController();
  var DistrictnameController = TextEditingController();
  var streetnameController = TextEditingController();
  var electricnameController = TextEditingController();
  var waternameController = TextEditingController();
  var EmployeesmasgedController = TextEditingController();
  var rememberEmployeesmasgedController = TextEditingController();
  var homeEmployeesmasgedController = TextEditingController();
  var rememberhomeEmployeesmasgedController = TextEditingController();
  var typehomeamamController = TextEditingController();
  var homeamamController = TextEditingController();
  var electricandwaterforamamController = TextEditingController();
  var numberelectricController = TextEditingController();
  var numberwaterController = TextEditingController();
  var typeMuezzinController = TextEditingController();
  var homeMuezzinController = TextEditingController();
  var electricandwaterforMuezzinController = TextEditingController();
  var numberelectricMuezzinController = TextEditingController();
  var remembernumberelectricMuezzinController = TextEditingController();
  var numberwaterMuezzinController = TextEditingController();
  var remembernumberwaterMuezzinController = TextEditingController();
  var nameamamController = TextEditingController();
  var NationalityController = TextEditingController();
  var phonenumberController = TextEditingController();
  var AppointmentDecisionController = TextEditingController();

  var nameMuezzinController = TextEditingController();
  var NationalityMuezzinController = TextEditingController();
  var phonenumberMuezzinController = TextEditingController();
  var AppointmentDecisionMuezzinController = TextEditingController();

  var nameServerController = TextEditingController();
  var NationalityServerController = TextEditingController();
  var phonenumberServerController = TextEditingController();
  var AppointmentDecisionServerController = TextEditingController();

  var mr8bmasagedController = TextEditingController();
  var remembermr8bmasagedController = TextEditingController();

  var mraf8masgedController1 = TextEditingController();
  var remembermraf8masgedController1 = TextEditingController();
//amam

  void selectRight(CheckBoxState e) {
    e.value = !e.value;
    update();
  }

  var length = 4;

  List<CheckBoxState> titles = [
    Infringement,
    Infringement1,
    Infringement2,
    Infringement3,
  ];
//////////////////////////////////////////////////////////////

  Future<void> addLocation(String location, masgedName) {
    Map<String, dynamic> locationData = {
      "location": location,
    };
    return FirebaseFirestore.instance
        .collection("masgedy")
        .doc(masgedName)
        .update(locationData);
  }

  Future<void> getAll() async {
    allMasaged = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final ssn = await preferences.get('ssn');
    final userSnap = await FirebaseFirestore.instance
        .collection('users')
        .doc(ssn.toString())
        .get();

    UserModel user = UserModel.fromSnapShot(userSnap);

    final snapshot = await FirebaseFirestore.instance
        .collection('masgedy')
        .where(
          Filter("users", arrayContains: ssn.toString()),
        )
        .get();
    if (snapshot.docs.length == 0 && user.role != 4) {
      Get.snackbar('', 'لا يوجد مساجد مسجلة');
      return;
    }

    allMasaged = snapshot.docs
        .where((doc) => !doc['seenUsers'].contains(ssn.toString()))
        .map((e) => MasagedyModel.fromSnapShot(e))
        .toList();

    update();
  }

  Future<void> getAllSigned() async {
    allSignedMasaged = [];

    SharedPreferences preferences = await SharedPreferences.getInstance();
    final ssn = await preferences.get('ssn');
    final userSnap = await FirebaseFirestore.instance
        .collection('users')
        .doc(ssn.toString())
        .get();

    UserModel user = UserModel.fromSnapShot(userSnap);

    final snapshot = await FirebaseFirestore.instance
        .collection('masgedy')
        .where(Filter("seenUsers", arrayContains: ssn.toString()))
        .get();
    allSignedMasaged =
        snapshot.docs.map((e) => MasagedyModel.fromSnapShot(e)).toList();
    searchMasaged = allSignedMasaged;

    update();
  }

  Future<void> archiveDoc(MasagedyModel masged) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final ssn = await preferences.get('ssn');
      final userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(ssn.toString())
          .get();

      UserModel user = await UserModel.fromSnapShot(userSnap);
      await FirebaseFirestore.instance
          .collection('masgedy')
          .doc(masged.namemasaged.toString())
          .update({
        'seenUsers': FieldValue.arrayUnion([ssn.toString()]),
      });

      update();
      print('تم التعديل الجدول');
    } catch (e) {
      print('غطاء في تعديل : $e');
    }
  }

  Future<void> getMasgedOnMap() async {
    allMasagedOnMap = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final ssn = await preferences.get('ssn');
    final userSnap = await FirebaseFirestore.instance
        .collection('users')
        .doc(ssn.toString())
        .get();

    UserModel user = UserModel.fromSnapShot(userSnap);

    final snapshot =
        await FirebaseFirestore.instance.collection('masgedy').get();
    allMasagedOnMap =
        snapshot.docs.map((e) => MasagedyModel.fromSnapShot(e)).toList();

    update();
  }

  Future<void> getAllSigned2Ways() async {
    allSigned2WayMasaged = [];
    final snapshot = await FirebaseFirestore.instance
        .collection('masgedy')
        .where(Filter("seenUsers", arrayContains: ssn.toString()))
        .get();
    allSignedMasaged =
        snapshot.docs.map((e) => MasagedyModel.fromSnapShot(e)).toList();
    allSigned2WayMasaged = allSignedMasaged;
    searchMasaged = allSigned2WayMasaged;
    update();
  }

  Future<void> createMasged(name, userSSN, photo, BuildContext context) async {
    creatingLoading = true;
    update();
    if (userSSN == null) {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      userSSN = await preferences.get('ssn');
    }
    final exist =
        await FirebaseFirestore.instance.collection('masgedy').doc(name).get();
    if (exist.exists) {
      creatingLoading = false;
      update();
      Get.snackbar('خطأ', 'هذا المسجد موجود بالفعل');
      return;
    }
    final qrImage = await QrPainter(
      data: name,
      version: QrVersions.auto,
      gapless: false,
    ).toImageData(300);
    if (photo != null) {
      final Reference storageReference = FirebaseStorage.instance.ref();
      final qrRef = await storageReference.child('qrcodes/${name}');
      await qrRef.putData(qrImage!.buffer.asUint8List());

      final Reference photoRef = await storageReference.child('photos/${name}');
      await photoRef.putFile(photo);
    }
    String imageLink = '';

    List<String> wasa2k = [];
    if (selectedImagegalley != null) {
      final Reference storageReference = FirebaseStorage.instance.ref();
      final photoRef = await storageReference
          .child('masged/${selectedImagegalley!.path.split('/').last}');
      await photoRef.putFile(selectedImagegalley!);
      imageLink = await photoRef.getDownloadURL();
      wasa2k.add(imageLink);
    }

    if (file.length > 0) {
      await Future.forEach(file, (current) async {
        final Reference storageReference = FirebaseStorage.instance.ref();
        final photoRef = await storageReference
            .child('masged/${current.path.split('/').last}');
        await photoRef.putFile(current);
        final currentImage = await photoRef.getDownloadURL();
        wasa2k.add(currentImage);
      });
    }

    MasagedyModel masged = MasagedyModel(
      date: DateTime.now().toString(),
      creator: userSSN.toString(),
      mo5alfat: mo5alfat,
      seenUsers: [],
      users: [userSSN],
      signed: false,
      esthlak3aly: esthlak,
      userSSN: userSSN,
      location: location.toString(), //78887,23432
      image: imageLink,
      namemasaged: namemasagedController.text,
      masgedwasera: masgedwaseraController.text,
      branch: branchController.text,
      Governorate: GovernorateController.text,
      Centerr: CenterController.text,
      District: DistrictnameController.text,
      electricname: electricnameController.text,
      watername: waternameController.text,
      cleaningmasaged: cleaningmasagedController.text,
      remembercleaningmasaged: remembercleaningmasagedController.text,
      Employeesmasged: EmployeesmasgedController.text,
      rememberEmployeesmasged: rememberEmployeesmasgedController.text,
      homeEmployeesmasged: homeEmployeesmasgedController.text,
      rememberhomeEmployeesmasged: rememberhomeEmployeesmasgedController.text,
      typehomeamam: typehomeamamController.text,
      homeamam: homeamamController.text,
      electricandwaterforamam: electricandwaterforamamController.text,
      numberelectric: numberelectricController.text,
      remembernumberelectric: remembernumberelectricController.text,
      numberwater: numberwaterController.text,
      remembernumberwater: remembernumberwaterController.text,
      typeMuezzin: typeMuezzinController.text,
      homeMuezzin: homeMuezzinController.text,
      electricandwaterforMuezzin: electricandwaterforMuezzinController.text,
      numberelectricMuezzin: numberelectricMuezzinController.text,
      remembernumberelectricMuezzin:
          remembernumberelectricMuezzinController.text,
      numberwaterMuezzin: numberwaterMuezzinController.text,
      remembernumberwaterMuezzin: remembernumberwaterMuezzinController.text,
      nameamam: nameamamController.text,
      Nationality: NationalityController.text,
      phonenumber: phonenumberController.text,
      AppointmentDecision: AppointmentDecisionController.text,
      nameMuezzin: nameMuezzinController.text,
      NationalityMuezzin: NationalityMuezzinController.text,
      phonenumberMuezzin: phonenumberMuezzinController.text,
      AppointmentDecisionMuezzin: AppointmentDecisionMuezzinController.text,
      nameServer: nameServerController.text,
      NationalityServer: NationalityServerController.text,
      phonenumberServer: phonenumberServerController.text,
      AppointmentDecisionServer: AppointmentDecisionServerController.text,
      mr8bmasaged: mr8bmasagedController.text,
      remembermr8bmasaged: remembermr8bmasagedController.text,
      mraf8masgedController1: mraf8masgedController1.text,
      remembermraf8masged: remembermraf8masgedController1.text,
      ta3dy3lakahrba: Infringement.value,
      ta3dy3lmrafak: Infringement3.value,
      t3dy3lyalmyah: Infringement1.value,

      t3dy3lyalkhrbaawalmyah: Infringement2.value,
      ta3dy3lakahrbaValue: Infringement.otherValue,
      t3dy3lyalmyahValue: Infringement1.otherValue,
      t3dy3lyalkhrbaawalmyahValue: Infringement2.otherValue,
      ta3dy3lmrafakValue: Infringement3.otherValue,

      signedRole2: false,
      signedRole3: false,
      was2k: wasa2k,

      qr: namemasagedController.text,
    );
    await FirebaseFirestore.instance
        .collection("masgedy")
        .doc(name)
        .set(masged.toJson());
    creatingLoading = false;
    update();
    Get.snackbar('تم', 'تم اضافة المسجد بنجاح');
    Future.delayed(Duration(seconds: 2), () {
      Get.toNamed(Routes.home);
    });
  }

  Future<void> shareDoc(String docID, userSSN) async {
    final snapshot =
        await FirebaseFirestore.instance.collection("masgedy").doc(docID).get();
    MasagedyModel masged = MasagedyModel.fromSnapShot(snapshot);
    if (masged.users!.contains(userSSN)) {
      Get.snackbar('', 'هذا المستخدم تم الارسال له من قبل');
    } else {
      masged.users!.add(userSSN);
      await FirebaseFirestore.instance
          .collection("masgedy")
          .doc(docID)
          .update(masged.toJson());
      Get.snackbar('', ' تم الارسال له ');
    }

    update();
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
      if (user.imagesignature == null || user.imagesignature == "") {
        Get.snackbar("", "الرجاء رفع صوره توقيع");
        Get.to(signature());
        return;
      }
      await FirebaseFirestore.instance
          .collection('masgedy')
          .doc(documentId)
          .update({
        'signedRole3': true,
        'signerSSNRole3': ssn,
        "signerNameRole3": user.name,
        "signatureRole3": user.imagesignature,
      });

      update();
      print('تم التعديل الجدول');
    } catch (e) {
      print('غطاء في تعديل : $e');
    }
  }

  Future<void> deleteMasgedDocument(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection("masgedy")
          .doc(documentId)
          .delete();
      print('تم الحذف الجدول');
    } catch (e) {
      print('غطاء في الحذف : $e');
    }
  }
}
