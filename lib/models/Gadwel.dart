import 'package:cloud_firestore/cloud_firestore.dart';

class GadwelModel {
  String al3dw; // rakam hawya
  String year;
  String month;
  String weekFrist;
  String weekSecond;
  String weekThird;
  String weekFourth;
  String dateFrist;
  String dateSecond;
  String dateThird;
  String dateFourth;
  String centerFrist;
  String centerSecond;
  String centerThird;
  String centerFourth;
  String al7yFrist;
  String al7ySecond;
  String al7yThird;
  String al7yFourth;
  String numberofmasagedFrist;
  String numberofmasagedSecond;
  String numberofmasagedThird;
  String numberofmasagedFourth;
  String asmalmra8bFrist;
  String asmalmra8bSecond;
  String asmalmra8bThird;
  String asmalmra8bFourth;
  String numbermra8bFrist;
  String numbermra8bSecond;
  String numbermra8bThird;
  String numbermra8bFourth;
  List<String>? users;
  List<String>? seenUsers;
  String? creator;
  bool? signedRole3;
  bool? signedRole2;
  String? signerNameRole3;
  String? signerSSNRole3;
  String? signatureRole3;
  String? signerNameRole2;
  String? signerSSNRole2;
  String? signatureRole2;
  String? date;

  GadwelModel({
    this.seenUsers,
    this.users,
    this.date,
    this.signedRole3,
    this.signerNameRole3,
    this.signerSSNRole3,
    this.signatureRole3,
    this.signedRole2,
    this.signerNameRole2,
    this.signerSSNRole2,
    this.signatureRole2,
    this.creator,
    required this.al3dw,
    required this.year,
    required this.month,
    required this.weekFrist,
    required this.weekSecond,
    required this.weekThird,
    required this.weekFourth,
    required this.dateFrist,
    required this.dateSecond,
    required this.dateThird,
    required this.dateFourth,
    required this.centerFrist,
    required this.centerSecond,
    required this.centerThird,
    required this.centerFourth,
    required this.al7yFrist,
    required this.al7ySecond,
    required this.al7yThird,
    required this.al7yFourth,
    required this.numberofmasagedFrist,
    required this.numberofmasagedSecond,
    required this.numberofmasagedThird,
    required this.numberofmasagedFourth,
    required this.asmalmra8bFrist,
    required this.asmalmra8bSecond,
    required this.asmalmra8bThird,
    required this.asmalmra8bFourth,
    required this.numbermra8bFrist,
    required this.numbermra8bSecond,
    required this.numbermra8bThird,
    required this.numbermra8bFourth,
  });
  toJson() {
    return {
      "seenUsers": seenUsers,
      "date": date,
      "signedRole3": signedRole3,
      "signerNameRole3": signerNameRole3,
      "signerSSNRole3": signerSSNRole3,
      "signatureRole3": signatureRole3,
      "signedRole2": signedRole2,
      "signerNameRole2": signerNameRole2,
      "signerSSNRole2": signerSSNRole2,
      "signatureRole2": signatureRole2,
      "creator": creator,
      "users": users,
      "al3dw": al3dw,
      "year": year,
      "month": month,
      "weekFrist": weekFrist,
      "weekSecond": weekSecond,
      "weekThird": weekThird,
      "weekFourth": weekFourth,
      "dateFrist": dateFrist,
      "dateSecond": dateSecond,
      "dateThird": dateThird,
      "dateFourth": dateFourth,
      "centerFrist": centerFrist,
      "centerSecond": centerSecond,
      "centerThird": centerThird,
      "centerFourth": centerFourth,
      "al7yFrist": al7yFrist,
      "al7ySecond": al7ySecond,
      "al7yThird": al7yThird,
      "al7yFourth": al7yFourth,
      "numberofmasagedFrist": numberofmasagedFrist,
      "numberofmasagedSecond": numberofmasagedSecond,
      "numberofmasagedThird": numberofmasagedThird,
      "numberofmasagedFourth": numberofmasagedFourth,
      "asmalmra8bFrist": asmalmra8bFrist,
      "asmalmra8bSecond": asmalmra8bSecond,
      "asmalmra8bThird": asmalmra8bThird,
      "asmalmra8bFourth": asmalmra8bFourth,
      "numbermra8bFrist": numbermra8bFrist,
      "numbermra8bSecond": numbermra8bSecond,
      "numbermra8bThird": numbermra8bThird,
      "numbermra8bFourth": numbermra8bFourth,
    };
  }

  factory GadwelModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return GadwelModel(
      creator: data["creator"],
      date: data["date"],
      seenUsers: List<String>.from(data["seenUsers"]),
      users: List<String>.from(data["users"]),
      al3dw: data["al3dw"],
      year: data["year"],
      month: data["month"],
      signedRole2: data["signedRole2"],
      signerNameRole2: data["signerNameRole2"],
      signerSSNRole2: data["signerSSNRole2"],
      signatureRole2: data["signatureRole2"],
      signedRole3: data["signedRole3"],
      signerNameRole3: data["signerRole3Name"],
      signerSSNRole3: data["signerRole3SSN"],
      signatureRole3: data["signatureRole3"],
      weekFrist: data["weekFrist"],
      weekSecond: data["weekSecond"],
      weekThird: data["weekThird"],
      weekFourth: data["weekFourth"],
      dateFrist: data["dateFrist"],
      dateSecond: data["dateSecond"],
      dateThird: data["dateThird"],
      dateFourth: data["dateFourth"],
      centerFrist: data["centerFrist"],
      centerSecond: data["centerSecond"],
      centerThird: data["centerThird"],
      centerFourth: data["centerFourth"],
      al7yFrist: data["al7yFrist"],
      al7ySecond: data["al7ySecond"],
      al7yThird: data["al7yThird"],
      al7yFourth: data["al7yFourth"],
      numberofmasagedFrist: data["numberofmasagedFrist"],
      numberofmasagedSecond: data["numberofmasagedSecond"],
      numberofmasagedThird: data["numberofmasagedThird"],
      numberofmasagedFourth: data["numberofmasagedFourth"],
      asmalmra8bFrist: data["asmalmra8bFrist"],
      asmalmra8bSecond: data["asmalmra8bSecond"],
      asmalmra8bThird: data["asmalmra8bThird"],
      asmalmra8bFourth: data["asmalmra8bFourth"],
      numbermra8bFrist: data["numbermra8bFrist"],
      numbermra8bSecond: data["numbermra8bSecond"],
      numbermra8bThird: data["numbermra8bThird"],
      numbermra8bFourth: data["numbermra8bFourth"],
    );
  }
}
