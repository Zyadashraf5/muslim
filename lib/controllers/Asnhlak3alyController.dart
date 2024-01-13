import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:muslimapp/models/Masagedy.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode/barcode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Asnhlak3aly.dart';

CheckBoxState Irregularities1M = CheckBoxState(title: " ثالجات المياه ");
CheckBoxState Irregularities2M = CheckBoxState(title: " برادات المياه ");
CheckBoxState Irregularities3M = CheckBoxState(title: " مكبرات الصوت ");
CheckBoxState Irregularities4M = CheckBoxState(title: " ستغالل المرافق ");
CheckBoxState Irregularities5M = CheckBoxState(title: " عشوائيات ");
CheckBoxState Irregularities6M = CheckBoxState(title: " تشوه بصري ");
CheckBoxState Irregularities7M = CheckBoxState(title: " غياب المنسوبين ");
CheckBoxState Irregularities8M = CheckBoxState(title: " استحداث بناء ");
CheckBoxState Irregularities9M = CheckBoxState(title: " مكاتب إدارية ");
CheckBoxState Irregularities10M = CheckBoxState(title: " مكتبات ");
CheckBoxState Irregularities11M = CheckBoxState(title: " كتب غير مرخصة  ");
CheckBoxState Irregularities12M = CheckBoxState(title: " الفتات ومنشورات ");
CheckBoxState Irregularities13M =
    CheckBoxState(title: " أشتراك العدادات سكن المنسوبين مع المسجد");
CheckBoxState Irregularities14M = CheckBoxState(title: " األطعمة");
CheckBoxState Irregularities15M = CheckBoxState(title: " قصور الصيانة ");
CheckBoxState Irregularities16M = CheckBoxState(title: " تشغيل المكبرات ");
CheckBoxState Irregularities17M = CheckBoxState(title: " إفطار داخل المسجد ");
CheckBoxState Irregularities18M =
    CheckBoxState(title: " مصاحف غير مطبعة الملك فهد ");
CheckBoxState Irregularities19M =
    CheckBoxState(title: " عدم وجود كاميرات مراقبة ");
CheckBoxState Irregularities20M =
    CheckBoxState(title: " وجود صناديق تبرعات او مستندات ");
CheckBoxState Irregularities21M = CheckBoxState(title: " تأجير سكن المنسوبين ");
CheckBoxState Irregularities22M = CheckBoxState(title: " وجود مصاحف ممزقة  ");
CheckBoxState Irregularities23M =
    CheckBoxState(title: " وجود كنب او مساند ارضية في مرافق المسجد  ");
CheckBoxState Irregularities24M = CheckBoxState(
    title: " عدم ربط المنسوبين فواتير الكهرباء والمياه باسمائهم ");
CheckBoxState Irregularities25M = CheckBoxState(title: "اخري", other: true);
CheckBoxState Irregularities26M = CheckBoxState(title: " لا ");

class CheckBoxState {
  final String title;
  bool value;
  bool other;
  String otherValue = "";
  CheckBoxState({required this.title, this.value = false, this.other = false});
}

CheckBoxState InfringementM = CheckBoxState(title: "تعدي على كهرباء");
CheckBoxState Infringement1M = CheckBoxState(title: "تعدي على المياه");
CheckBoxState Infringement2M =
    CheckBoxState(title: "تعدي على الكهرباء والمياه");
CheckBoxState Infringement3M = CheckBoxState(title: "تعدي على مساحة المسجد");
CheckBoxState Infringement4M = CheckBoxState(title: "سكني");
CheckBoxState Infringement5M = CheckBoxState(title: "مبنى تحت االنشاء");
CheckBoxState Infringement6M = CheckBoxState(title: "سكن عمال");
CheckBoxState Infringement7M = CheckBoxState(title: "مبنى تجاري");
CheckBoxState Infringement8M = CheckBoxState(title: "مبنى حكومي");
CheckBoxState Infringement9M = CheckBoxState(title: "محطات وقود");
CheckBoxState Infringement10M = CheckBoxState(title: "مستودعات");
CheckBoxState Infringement11M = CheckBoxState(title: "مزارع");
CheckBoxState Infringement12M = CheckBoxState(title: "بيت شعر");
CheckBoxState Infringement13M = CheckBoxState(title: "دار تحفيظ");
CheckBoxState Infringement14M = CheckBoxState(title: "مكاتب تعاونية");
CheckBoxState Infringement15M = CheckBoxState(title: "مؤسسات خيرية");
CheckBoxState Infringement16M = CheckBoxState(title: "استراحات");
CheckBoxState Infringement17M = CheckBoxState(title: "اخري", other: true);
CheckBoxState Infringement18M = CheckBoxState(title: "لا");

class Asnhlak3alyController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  //late final DateTime? selectedDate = DateTime.now();
  File? selectedImagegalley;

  var files;
  File file = File('');

  bool isSelected = false;
  var seletedtaker;
  DateTime? selectedDate;

  LatLng? selectedLocation;
  int words = 0;
  bool? isLoading = false;

  File? selectedFile;

  File? _selectedImage;
  File? selectedSak;
  var selectedOption;

  String? ssn;

  TimeOfDay? dateTime;

  String? valuechoose;

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
    "لمجمعة",
    "المزاحمية",
    "القويعية",
    "الحريق",
    "الغاط",
    "الخرج",
    "الدوادمي",
    "وادي الدواسر",
    "الفالج",
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
  ];

  List Centerr = [
    "مركز الشراف على المساجد بشمال الرياض",
    "مركز الشراف على المساجد بشرق الرياض",
    "مركز الشراف على المساجد بوسط الرياض",
    "مركز الشراف على المساجد بغرب الرياض",
    "مركز الشراف على المساجد بجنوب الرياض",
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
  List Asnhlak3aly = [
    "الكهرباء ( مربع نص )",
    "المياة ( مربع نص )",
    "الكهرباء والمياة ( مربع نص )",
    "اخري",
  ];

  LatLng location = LatLng(0, 0);
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

  var Asnhlak3alyController1 = TextEditingController();
  var rememberAsnhlak3alyController = TextEditingController();

  var remembernumberelectricController = TextEditingController();
  var remembernumberwaterController = TextEditingController();

//amam

  void selectRight(CheckBoxState e) {
    e.value = !e.value;
    update();
  }

  var lengths = 4;

  List<CheckBoxState> titlesAsnhlak3alyController = [
    InfringementM,
    Infringement1M,
    Infringement2M,
    Infringement3M,
    Infringement4M,
    Infringement5M,
    Infringement6M,
    Infringement7M,
    Infringement8M,
    Infringement9M,
    Infringement10M,
    Infringement11M,
    Infringement12M,
    Infringement13M,
    Infringement14M,
    Infringement15M,
    Infringement16M,
    Infringement17M,
    Infringement18M,
  ];
//////////////////////////////////////////////////////////////

  List<CheckBoxState> titlessAsnhlak3alyController = [
    Irregularities1M,
    Irregularities2M,
    Irregularities3M,
    Irregularities4M,
    Irregularities5M,
    Irregularities6M,
    Irregularities7M,
    Irregularities8M,
    Irregularities9M,
    Irregularities10M,
    Irregularities11M,
    Irregularities12M,
    Irregularities13M,
    Irregularities14M,
    Irregularities15M,
    Irregularities16M,
    Irregularities17M,
    Irregularities18M,
    Irregularities19M,
    Irregularities20M,
    Irregularities21M,
    Irregularities22M,
    Irregularities23M,
    Irregularities24M,
    Irregularities25M,
    Irregularities26M,
  ];

  Future<void> addLocation(String location, masgedName) {
    Map<String, dynamic> locationData = {
      "location": location,
    };
    return FirebaseFirestore.instance
        .collection("masgedy")
        .doc(masgedName)
        .update(locationData);
  }

  Future<void> createMasged(name, userSSN, photo) async {
    final qrImage = await QrPainter(
      data: name,
      version: QrVersions.auto,
      gapless: false,
    ).toImageData(300);
    final Reference storageReference = FirebaseStorage.instance.ref();
    final qrRef = await storageReference.child('qrcodes/${name}');
    await qrRef.putData(qrImage!.buffer.asUint8List());

    final Reference photoRef = await storageReference.child('photos/${name}');
    await photoRef.putFile(photo);
    String imageLink = '';
    if (selectedImagegalley != null) {
      final Reference storageReference = FirebaseStorage.instance.ref();
      final photoRef = await storageReference
          .child('masged/${selectedImagegalley!.path.split('/').last}');
      await photoRef.putFile(selectedImagegalley!);
      imageLink = await photoRef.getDownloadURL();
    }
    Asnhlak3alyModel asnhlak = Asnhlak3alyModel(
      signed: false,
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
      //

      ta3dy3lakahrba: InfringementM.value,
      t3dy3lyalmyah: Infringement1M.value,
      t3dy3lyalkhrbaawalmyah: Infringement2M.value,
      t3dy3lymsa7talmsgd: Infringement3M.value,
      skny: Infringement4M.value,
      mbnyt7taalnshaa: Infringement5M.value,
      skn3mal: Infringement6M.value,
      mbnytgary: Infringement7M.value,
      mbny7kwmy: Infringement8M.value,
      m76atw8wd: Infringement9M.value,
      mstwd3at: Infringement10M.value,
      mzar3: Infringement11M.value,
      bytsh3r: Infringement12M.value,
      dart7fyz: Infringement13M.value,
      mkatbt3awnyt: Infringement14M.value,
      massat5yryt: Infringement15M.value,
      astra7at: Infringement16M.value,
      a5ry: Infringement17M.value,
      la: Infringement18M.value,

      //
      thalgatalmyah: Irregularities1M.value,
      bradatalmyah: Irregularities2M.value,
      mkbratalswt: Irregularities3M.value,
      stghallalmraf8: Irregularities4M.value,
      shwaayat: Irregularities5M.value,
      tshwhbsry: Irregularities6M.value,
      ghyabalmnswbyn: Irregularities7M.value,
      ast7dathbnaa: Irregularities8M.value,
      mkatbdaryt: Irregularities9M.value,
      mktbat: Irregularities10M.value,
      ktbghyrmr5st: Irregularities11M.value,
      alftatwmnshwrat: Irregularities12M.value,
      ashtrakal3dadatsknalmnswbynm3almsgd: Irregularities13M.value, //
      aal63mt: Irregularities14M.value, //
      swralsyant: Irregularities15M.value,
      tshghylalmkbrat: Irregularities16M.value,
      f6arda5lalmsgd: Irregularities17M.value,
      msa7fghyrm6b3talmlkfhd: Irregularities18M.value,
      dmwgwdkamyratmra8bt: Irregularities19M.value,
      wgwdsnady8tbr3atawmstndat: Irregularities20M.value,
      tagyrsknalmnswbyn: Irregularities21M.value,
      wgwdmsa7fmmz8t: Irregularities22M.value,
      wgwdknbawmsandardytfymraf8almsgd: Irregularities23M.value,
      dmrb6almnswbynfwatyralkhrbaawalmyahbasmaahm: Irregularities24M.value,
      a5ryy: Irregularities25M.value,
      laa: Irregularities26M.value,
    );
    await FirebaseFirestore.instance
        .collection("Asnhlak3aly")
        .doc(
          namemasagedController.text,
        )
        .set(asnhlak.toJson());
  }
}
