import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:muslimapp/controllers/authController.dart';
import 'package:muslimapp/controllers/homeController.dart';
import 'package:muslimapp/views/admin/add_user.dart';
import 'package:muslimapp/views/admin/analytics.dart';
import 'package:muslimapp/views/admin/analyticsGawlat.dart';
import 'package:muslimapp/views/home/home_screen.dart';
import 'package:muslimapp/views/login/login.dart';

class DashbordApp extends StatelessWidget {
  const DashbordApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "لوحة التحكم",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "TajawalMedium",
          ),
        ),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.green.shade300,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      Get.to(AddUser());
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: Colors.green),
                      child: Center(
                        child: Text(
                          "اضافة مستخدم جديد",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "TajawalMedium",
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      HomeController homeController = Get.put(HomeController());
                      homeController.filteredUser = null;
                      await homeController.getUsersWithDoc();
                      Get.to(Analytics());
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: Colors.green),
                      child: Center(
                        child: Text(
                          "احصائيات الجولات",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "TajawalMedium",
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      HomeController homeController = Get.put(HomeController());
                      await homeController.getUserWithGadwels();
                      Get.to(AnalyticsGadwlat());
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: Colors.green),
                      child: Center(
                        child: Text(
                          "احصائيات الجداول",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "TajawalMedium",
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  AuthControler authControler = Get.put(AuthControler());
                  await authControler.signOut();
                  Get.offAll(() => login());
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.red),
                  child: Center(
                    child: Text(
                      "تسجيل الخروج",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "TajawalMedium",
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "assets/logo1.png",
                height: 150,
              ),
              Text(
                "وزارة الشؤون الاسلاميه و الدعوة و الارشاد ",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "TajawalMedium",
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class AnotherPage extends StatelessWidget {
//   const AnotherPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Another Page',
//           style: TextStyle(
//             color: Colors.black,
//             fontFamily: 'TajawalMedium',
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text('This is another page'),
//       ),
//     );
//   }
// }
