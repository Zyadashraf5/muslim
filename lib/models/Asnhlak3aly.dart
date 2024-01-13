import 'package:cloud_firestore/cloud_firestore.dart';

class Asnhlak3alyModel {
  bool signed;
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

//

  bool ta3dy3lakahrba;
  bool t3dy3lyalmyah;
  bool t3dy3lyalkhrbaawalmyah;
  bool t3dy3lymsa7talmsgd;
  bool skny;
  bool mbnyt7taalnshaa;
  bool skn3mal;
  bool mbnytgary;
  bool mbny7kwmy;
  bool m76atw8wd;
  bool mstwd3at;
  bool mzar3;
  bool bytsh3r;
  bool dart7fyz;
  bool mkatbt3awnyt;
  bool massat5yryt;
  bool astra7at;
  bool a5ry;
  bool la;
//

  bool thalgatalmyah; //
  bool bradatalmyah; //
  bool mkbratalswt; //
  bool stghallalmraf8; //
  bool shwaayat; //
  bool tshwhbsry; //
  bool ghyabalmnswbyn; //
  bool ast7dathbnaa; //
  bool mkatbdaryt; //
  bool mktbat; //
  bool ktbghyrmr5st; //
  bool alftatwmnshwrat; //
  bool ashtrakal3dadatsknalmnswbynm3almsgd; //
  bool aal63mt; //
  bool swralsyant; //
  bool tshghylalmkbrat; //
  bool f6arda5lalmsgd; //
  bool msa7fghyrm6b3talmlkfhd; //
  bool dmwgwdkamyratmra8bt; //
  bool wgwdsnady8tbr3atawmstndat; //
  bool tagyrsknalmnswbyn; //
  bool wgwdmsa7fmmz8t; //
  bool wgwdknbawmsandardytfymraf8almsgd; //
  bool dmrb6almnswbynfwatyralkhrbaawalmyahbasmaahm;

  ///
  bool a5ryy;
  bool laa;
  String? signImage;

  Asnhlak3alyModel({
    this.signImage,
    required this.userSSN,
    required this.location,
    required this.image,
    required this.signed,
    //
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
    required this.t3dy3lymsa7talmsgd,
    required this.t3dy3lyalkhrbaawalmyah,
    required this.skny,
    required this.mbnyt7taalnshaa,
    required this.skn3mal,
    required this.mbnytgary,
    required this.mbny7kwmy,
    required this.m76atw8wd,
    required this.mstwd3at,
    required this.mzar3,
    required this.bytsh3r,
    required this.dart7fyz,
    required this.mkatbt3awnyt,
    required this.massat5yryt,
    required this.astra7at,
    required this.a5ry,
    required this.la,

    //
    required this.thalgatalmyah,
    required this.bradatalmyah,
    required this.mkbratalswt,
    required this.stghallalmraf8,
    required this.shwaayat,
    required this.tshwhbsry,
    required this.ghyabalmnswbyn,
    required this.ast7dathbnaa,
    required this.mkatbdaryt,
    required this.mktbat,
    required this.ktbghyrmr5st,
    required this.alftatwmnshwrat,
    required this.ashtrakal3dadatsknalmnswbynm3almsgd,
    required this.aal63mt,
    required this.swralsyant,
    required this.tshghylalmkbrat,
    required this.f6arda5lalmsgd,
    required this.msa7fghyrm6b3talmlkfhd,
    required this.dmwgwdkamyratmra8bt,
    required this.wgwdsnady8tbr3atawmstndat,
    required this.tagyrsknalmnswbyn,
    required this.wgwdmsa7fmmz8t,
    required this.wgwdknbawmsandardytfymraf8almsgd,
    required this.dmrb6almnswbynfwatyralkhrbaawalmyahbasmaahm,
    required this.a5ryy,
    required this.laa,
  });

  factory Asnhlak3alyModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Asnhlak3alyModel(
      signImage: data['signImage'],
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

      //
      ta3dy3lakahrba: data['ta3dy3lakahrba'],
      t3dy3lyalmyah: data['t3dy3lyalmyah'],
      t3dy3lyalkhrbaawalmyah: data['t3dy3lyalkhrbaawalmyah'],
      t3dy3lymsa7talmsgd: data['t3dy3lymsa7talmsgd'],
      skny: data['skny'],
      mbnyt7taalnshaa: data['mbnyt7taalnshaa'],
      skn3mal: data['skn3mal'],
      mbnytgary: data['mbnytgary'],
      mbny7kwmy: data['mbny7kwmy'],
      m76atw8wd: data['m76atw8wd'],
      mstwd3at: data['mstwd3at'],
      mzar3: data['mzar3'],
      bytsh3r: data['bytsh3r'],
      dart7fyz: data['dart7fyz'],
      mkatbt3awnyt: data['mkatbt3awnyt'],
      massat5yryt: data['massat5yryt'],
      astra7at: data['astra7at'],
      a5ry: data['a5ry'],
      la: data['la'],
      //
      thalgatalmyah: data['thalgatalmyah'],
      bradatalmyah: data['bradatalmyah'],
      mkbratalswt: data['mkbratalswt'],
      stghallalmraf8: data['stghallalmraf8'],
      shwaayat: data['shwaayat'],
      tshwhbsry: data['tshwhbsry'],
      ghyabalmnswbyn: data['ghyabalmnswbyn'],
      ast7dathbnaa: data['ast7dathbnaa'],
      mkatbdaryt: data['mkatbdaryt'],
      mktbat: data['mktbat'],
      ktbghyrmr5st: data['ktbghyrmr5st'],
      alftatwmnshwrat: data['alftatwmnshwrat'],
      ashtrakal3dadatsknalmnswbynm3almsgd:
          data['ashtrakal3dadatsknalmnswbynm3almsgd'],
      aal63mt: data['aal63mt'],
      swralsyant: data['swralsyant'],
      tshghylalmkbrat: data['tshghylalmkbrat'],
      f6arda5lalmsgd: data['f6arda5lalmsgd'],
      msa7fghyrm6b3talmlkfhd: data['msa7fghyrm6b3talmlkfhd'],
      dmwgwdkamyratmra8bt: data['dmwgwdkamyratmra8bt'],
      wgwdsnady8tbr3atawmstndat: data['wgwdsnady8tbr3atawmstndat'],
      tagyrsknalmnswbyn: data['tagyrsknalmnswbyn'],
      wgwdmsa7fmmz8t: data['wgwdmsa7fmmz8t'],
      wgwdknbawmsandardytfymraf8almsgd:
          data['wgwdknbawmsandardytfymraf8almsgd'],
      dmrb6almnswbynfwatyralkhrbaawalmyahbasmaahm:
          data['dmrb6almnswbynfwatyralkhrbaawalmyahbasmaahm'],
      a5ryy: data['a5ryy'],
      laa: data['laa'],
//
      userSSN: data['userSSN'],
      location: data["location"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'signImage': signImage,
      "signed": signed,
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
      "t3dy3lymsa7talmsgd": t3dy3lymsa7talmsgd,
      "skny": skny,
      "mbnyt7taalnshaa": mbnyt7taalnshaa,
      "skn3mal": skn3mal,
      "mbnytgary": mbnytgary,
      "mbny7kwmy": mbny7kwmy,
      "m76atw8wd": m76atw8wd,
      "mstwd3at": mstwd3at,
      "mzar3": mzar3,
      "bytsh3r": bytsh3r,
      "dart7fyz": dart7fyz,
      "mkatbt3awnyt": mkatbt3awnyt,
      "massat5yryt": massat5yryt,
      "astra7at": astra7at,
      "a5ry": a5ry,
      "la": la,

      //
      "thalgatalmyah": thalgatalmyah,
      "bradatalmyah": bradatalmyah,
      "mkbratalswt": mkbratalswt,
      "stghallalmraf8": stghallalmraf8,
      "shwaayat": shwaayat,
      "tshwhbsry": tshwhbsry,
      "ghyabalmnswbyn": ghyabalmnswbyn,
      "ast7dathbnaa": ast7dathbnaa,
      "mkatbdaryt": mkatbdaryt,
      "mktbat": mktbat,
      "ktbghyrmr5st": ktbghyrmr5st,
      "alftatwmnshwrat": alftatwmnshwrat,
      "ashtrakal3dadatsknalmnswbynm3almsgd":
          ashtrakal3dadatsknalmnswbynm3almsgd,
      "aal63mt": aal63mt,
      "swralsyant": swralsyant,
      "tshghylalmkbrat": tshghylalmkbrat,
      "f6arda5lalmsgd": f6arda5lalmsgd,
      "msa7fghyrm6b3talmlkfhd": msa7fghyrm6b3talmlkfhd,
      "dmwgwdkamyratmra8bt": dmwgwdkamyratmra8bt,
      "wgwdsnady8tbr3atawmstndat": wgwdsnady8tbr3atawmstndat,
      "tagyrsknalmnswbyn": tagyrsknalmnswbyn,
      "wgwdmsa7fmmz8t": wgwdmsa7fmmz8t,
      "wgwdknbawmsandardytfymraf8almsgd": wgwdknbawmsandardytfymraf8almsgd,
      "dmrb6almnswbynfwatyralkhrbaawalmyahbasmaahm":
          dmrb6almnswbynfwatyralkhrbaawalmyahbasmaahm,
      "a5ryy": a5ryy,
      "laa": laa,
      //
      "ssn": userSSN,
      "location": location,
    };
  }
}
