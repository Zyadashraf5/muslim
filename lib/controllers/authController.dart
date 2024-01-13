import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslimapp/models/UserModel.dart';
import 'package:muslimapp/views/admin/Dashbord_app.dart';
import 'package:muslimapp/views/login/login.dart';
import 'package:muslimapp/views/movebar/bottom_move.dart';
import 'package:muslimapp/views/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_pages.dart';

class AuthControler extends GetxController {
  bool isLoading = false;
  String? ssn;
  int? role;
  bool secourpasss = true;
  List<UserModel> users = [];
  String? valuechoose;
  List listitem = ["العضو", "مدير الاداره", "مشرف اللجان الميدانية", 'admin'];
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
  List branchs = ["الرياض", 'الرياض2'];
  var ssnController = TextEditingController();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var passwordController = TextEditingController();
  var confrimpasswordController = TextEditingController();

  var phoneController = TextEditingController();

  var branchControlleruser = TextEditingController();
  var GovernorateControlleruser = TextEditingController();
  var CenterrControlleruser = TextEditingController();

  var roleEditingController = TextEditingController();
  var roleIdController = TextEditingController();

  var fb = FirebaseFirestore.instance;

  Future<void> loginEmailandPassword(String ssn, password) async {
    try {
      final data = await fb.collection("users").doc(ssn).get();

      if (!data.exists) {
        throw Exception("الرقم السري غير صحيح");
      }

      final user = UserModel.fromSnapShot(data);

      if (user.password != password) {
        throw "الرقم السري غير صحيح";
      }
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('ssn', user.ssn!);
      ssn = user.ssn!;
      role = int.parse(user.role);
      update();
      if (user.role == "4") {
        Get.offAll(DashbordApp());
      } else {
        Get.offAllNamed(Routes.home);
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      SnackBar(content: Text(e.toString()));
      Get.snackbar("خطاء", e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  Future signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('ssn');
  }

  Future<void> addUser(
    String ssn,
    role,
    password,
    phone,
    name,
    roleName,
    BuildContext context,
  ) async {
    try {
      final user = UserModel(
          phone: phone,
          role: role,
          ssn: ssn,
          password: password,
          roleName: roleName,
          name: name,
          imagesignature: "");
      await FirebaseFirestore.instance
          .collection("users")
          .doc(ssn)
          .set(user.toJson());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<UserModel> getUser(String ssn) async {
    DocumentSnapshot<Map<String, dynamic>> data =
        await fb.collection("users").doc(ssn).get();
    UserModel user = UserModel.fromSnapShot(data);
    update();
    return user;
  }

  Future<String?> getssn() async {
    isLoading = true;
    update();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    ssn = preferences.getString('ssn');
    if (ssn == null) {
      Get.to(const login());
    }
    isLoading = false;
    update();
    return ssn;
  }

  Future<void> getUserByRule(String rule) async {
    users.clear();
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("role", isEqualTo: rule)
        .get();

    await Future.forEach(snapshot.docs, (element) async {
      users.add(await UserModel.fromSnapShot(element));
    });
    update();
  }

  @override
  Future<void> onInit() async {
    await getssn();
    user = await getUser(ssn!);
    update();

    super.onInit();
  }

  UserModel? user;

  // Future<void> didChangeDependencies() async {
  //   user = await authControler.getUser(ssn!);
  //   super.didChangeDependencies();
  //   isLoading = false;
  //   setState(() {});

  //   setState(() {});
  // }
}
