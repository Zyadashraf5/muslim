import 'package:cloud_firestore/cloud_firestore.dart';

class MasagedyModel {
  final String? userSSN;
  final String location;
  final String image;
  final String? namemasaged;
  final String masgedwasera;
  final String branch;
  final String Governorate;
  final String Centerr;
  final String District;
  final String electricname;
  final String watername;
  final String cleaningmasaged;
  final String remembercleaningmasaged;
  final String Employeesmasged;
  final String rememberEmployeesmasged;
  final String homeEmployeesmasged;
  final String rememberhomeEmployeesmasged;
  final String typehomeamam;
  final String homeamam;
  final String electricandwaterforamam;
  final String numberelectric;
  final String remembernumberelectric;
  final String numberwater;
  final String remembernumberwater;
  final String typeMuezzin;
  final String homeMuezzin;
  final String electricandwaterforMuezzin;
  final String numberelectricMuezzin;
  final String remembernumberelectricMuezzin;
  final String numberwaterMuezzin;
  final String remembernumberwaterMuezzin;
  final String nameamam;
  final String Nationality;
  final String phonenumber;
  final String AppointmentDecision;
  final String nameMuezzin;
  final String NationalityMuezzin;
  final String phonenumberMuezzin;
  final String AppointmentDecisionMuezzin;
  final String nameServer;
  final String NationalityServer;
  final String phonenumberServer;
  final String AppointmentDecisionServer;
  final String mr8bmasaged;
  final String remembermr8bmasaged;
  final String mraf8masgedController1;
  final String remembermraf8masged;
  final List<String>? users;
  final List<String>? seenUsers;
  List<String>? was2k;

//
  String ta3dy3lakahrbaValue;
  String t3dy3lyalmyahValue;
  String t3dy3lyalkhrbaawalmyahValue;
  String ta3dy3lmrafakValue;

  //
  bool ta3dy3lakahrba;
  bool t3dy3lyalmyah;
  bool t3dy3lyalkhrbaawalmyah;
  bool ta3dy3lmrafak;

  String? mo5alfat;

  bool signed;
  String qr;
  String? creator;
  final bool? signedRole3;
  final bool? signedRole2;
  final String? signerNameRole3;
  final String? signerSSNRole3;
  final String? signatureRole3;
  final String? signerNameRole2;
  final String? signerSSNRole2;
  final String? signatureRole2;
  String? date;

  MasagedyModel({
    this.seenUsers,
    this.was2k,
    this.signedRole3,
    this.signerNameRole3,
    this.signerSSNRole3,
    this.signatureRole3,
    this.signedRole2,
    this.signerNameRole2,
    this.signerSSNRole2,
    this.signatureRole2,
    required this.qr,
    this.users,
    this.userSSN,
    required this.location,
    required this.image,
    required this.signed,
    this.creator,
    this.mo5alfat,
    //
    this.date,
    required this.namemasaged,
    required this.masgedwasera,
    required this.branch,
    required this.Governorate,
    required this.Centerr,
    required this.District,
    required this.electricname,
    required this.watername,
    required this.cleaningmasaged,
    required this.remembercleaningmasaged,
    required this.Employeesmasged,
    required this.rememberEmployeesmasged,
    required this.homeEmployeesmasged,
    required this.rememberhomeEmployeesmasged,
    required this.typehomeamam,
    required this.homeamam,
    required this.electricandwaterforamam,
    required this.numberelectric,
    required this.remembernumberelectric,
    required this.numberwater,
    required this.remembernumberwater,
    required this.typeMuezzin,
    required this.homeMuezzin,
    required this.electricandwaterforMuezzin,
    required this.numberelectricMuezzin,
    required this.remembernumberelectricMuezzin,
    required this.numberwaterMuezzin,
    required this.remembernumberwaterMuezzin,
    required this.nameamam,
    required this.Nationality,
    required this.phonenumber,
    required this.AppointmentDecision,
    required this.nameMuezzin,
    required this.NationalityMuezzin,
    required this.phonenumberMuezzin,
    required this.AppointmentDecisionMuezzin,
    required this.nameServer,
    required this.NationalityServer,
    required this.phonenumberServer,
    required this.AppointmentDecisionServer,
    required this.mr8bmasaged,
    required this.remembermr8bmasaged,
    required this.mraf8masgedController1,
    required this.remembermraf8masged,

    //

    required this.ta3dy3lakahrba,
    required this.t3dy3lyalmyah,
    required this.t3dy3lyalkhrbaawalmyah,
    required this.ta3dy3lmrafak,

    //

    this.ta3dy3lakahrbaValue = "تعدي على الكهرباء",
    this.t3dy3lyalmyahValue = "تعدي على المياه",
    this.t3dy3lyalkhrbaawalmyahValue = "تعدي على الكهرباء والمياه",
    this.ta3dy3lmrafakValue = "تعدي على المرافق",
  });

  factory MasagedyModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return MasagedyModel(
      was2k: List<String>.from(data["was2k"]),
      date: data['date'],
      mo5alfat: data['mo5alfat'],
      creator: data['creator'],
      signedRole3: data['signedRole3'],
      signerNameRole3: data['signerNameRole3'],
      signerSSNRole3: data['signerSSNRole3'],
      signatureRole3: data['signatureRole3'],
      signedRole2: data['signedRole2'],
      signerNameRole2: data['signerNameRole2'],
      signerSSNRole2: data['signerSSNRole2'],
      signatureRole2: data['signatureRole2'],
      qr: data['qr'],
      ta3dy3lakahrbaValue: data['ta3dy3lakahrbaValue'],
      t3dy3lyalmyahValue: data['t3dy3lyalmyahValue'],
      t3dy3lyalkhrbaawalmyahValue: data['t3dy3lyalkhrbaawalmyahValue'],

      //
      users: List<String>.from(data["users"]),
      signed: data['signed'],
      namemasaged: data['namemasaged'],
      masgedwasera: data['masgedwasera'],
      image: data['image'],
      branch: data['branch'],
      Governorate: data['Governorate'],
      Centerr: data['Centerr'],
      District: data['District'],
      electricname: data['electricname'],
      watername: data['watername'],
      cleaningmasaged: data['cleaningmasaged'],
      remembercleaningmasaged: data['remembercleaningmasaged'],
      Employeesmasged: data['Employeesmasged'],
      rememberEmployeesmasged: data['rememberEmployeesmasged'],
      homeEmployeesmasged: data['homeEmployeesmasged'],
      rememberhomeEmployeesmasged: data['rememberhomeEmployeesmasged'],
      typehomeamam: data['typehomeamam'],
      homeamam: data['homeamam'],
      electricandwaterforamam: data['electricandwaterforamam'],
      numberelectric: data['numberelectric'],
      remembernumberelectric: data['remembernumberelectric'],
      numberwater: data['numberwater'],
      remembernumberwater: data['remembernumberwater'],
      typeMuezzin: data['typeMuezzin'],
      homeMuezzin: data['homeMuezzin'],
      electricandwaterforMuezzin: data['electricandwaterforMuezzin'],
      numberelectricMuezzin: data['numberelectricMuezzin'],
      remembernumberelectricMuezzin: data['remembernumberelectricMuezzin'],
      numberwaterMuezzin: data['numberwaterMuezzin'],
      remembernumberwaterMuezzin: data['remembernumberwaterMuezzin'],
      nameamam: data['nameamam'],
      Nationality: data['Nationality'],
      phonenumber: data['phonenumber'],
      AppointmentDecision: data['AppointmentDecision'],
      nameMuezzin: data['nameMuezzin'],
      NationalityMuezzin: data['NationalityMuezzin'],
      phonenumberMuezzin: data['phonenumberMuezzin'],
      AppointmentDecisionMuezzin: data['AppointmentDecisionMuezzin'],
      nameServer: data['nameServer'],
      NationalityServer: data['NationalityServer'],
      phonenumberServer: data['phonenumberServer'],
      AppointmentDecisionServer: data['AppointmentDecisionServer'],
      mr8bmasaged: data['mr8bmasaged'],
      remembermr8bmasaged: data['remembermr8bmasaged'],
      mraf8masgedController1: data['mraf8masgedController1'],
      remembermraf8masged: data['remembermraf8masged'],
      seenUsers: List<String>.from(data["seenUsers"]),
      //
      ta3dy3lakahrba: data['ta3dy3lakahrba'],
      t3dy3lyalmyah: data['t3dy3lyalmyah'],
      t3dy3lyalkhrbaawalmyah: data['t3dy3lyalkhrbaawalmyah'],
      ta3dy3lmrafak: data['ta3dy3lmrafak'],

//
      userSSN: data['userSSN'],
      location: data["location"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "was2k": was2k,
      "creator": creator,
      "date": date,
      "signedRole3": signedRole3,
      "signerNameRole3": signerNameRole3,
      "signerSSNRole3": signerSSNRole3,
      "signatureRole3": signatureRole3,
      "signedRole2": signedRole2,
      "signerNameRole2": signerNameRole2,
      "signerSSNRole2": signerSSNRole2,
      "signatureRole2": signatureRole2,
      "qr": qr,
      "ta3dy3lakahrbaValue": ta3dy3lakahrbaValue,
      "t3dy3lyalmyahValue": t3dy3lyalmyahValue,
      "t3dy3lyalkhrbaawalmyahValue": t3dy3lyalkhrbaawalmyahValue,
      "mo5alfat": mo5alfat,
      "seenUsers": seenUsers,
      //
      'signed': signed,
      "namemasaged": namemasaged,
      "masgedwasera": masgedwasera,
      "branch": branch,
      "image": image,
      "Governorate": Governorate,
      "Centerr": Centerr,
      "District": District,
      "electricname": electricname,
      "watername": watername,
      "cleaningmasaged": cleaningmasaged,
      "remembercleaningmasaged": remembercleaningmasaged,
      "Employeesmasged": Employeesmasged,
      "rememberEmployeesmasged": rememberEmployeesmasged,
      "homeEmployeesmasged": homeEmployeesmasged,
      "rememberhomeEmployeesmasged": rememberhomeEmployeesmasged,
      "typehomeamam": typehomeamam,
      "homeamam": homeamam,
      "electricandwaterforamam": electricandwaterforamam,
      "numberelectric": numberelectric,
      "remembernumberelectric": remembernumberelectric,
      "numberwater": numberwater,
      "remembernumberwater": remembernumberwater,
      "typeMuezzin": typeMuezzin,
      "homeMuezzin": homeMuezzin,
      "electricandwaterforMuezzin": electricandwaterforMuezzin,
      "numberelectricMuezzin": numberelectricMuezzin,
      "remembernumberelectricMuezzin": remembernumberelectricMuezzin,
      "numberwaterMuezzin": numberwaterMuezzin,
      "remembernumberwaterMuezzin": remembernumberwaterMuezzin,
      'nameamam': nameamam,
      'Nationality': Nationality,
      'phonenumber': phonenumber,
      'AppointmentDecision': AppointmentDecision,
      'nameMuezzin': nameMuezzin,
      'NationalityMuezzin': NationalityMuezzin,
      'phonenumberMuezzin': phonenumberMuezzin,
      'AppointmentDecisionMuezzin': AppointmentDecisionMuezzin,
      'nameServer': nameServer,
      'NationalityServer': NationalityServer,
      'phonenumberServer': phonenumberServer,
      'AppointmentDecisionServer': AppointmentDecisionServer,
      'mr8bmasaged': mr8bmasaged,
      'remembermr8bmasaged': remembermr8bmasaged,
      'mraf8masgedController1': mraf8masgedController1,
      'remembermraf8masged': remembermraf8masged,

      //
      "ta3dy3lakahrba": ta3dy3lakahrba,
      "t3dy3lyalmyah": t3dy3lyalmyah,
      "t3dy3lyalkhrbaawalmyah": t3dy3lyalkhrbaawalmyah,
      "ta3dy3lmrafak": ta3dy3lmrafak,

      "ssn": userSSN,
      "users": users,
      "location": location,
    };
  }
}
