import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:muslimapp/routes/app_pages.dart';

import 'package:muslimapp/views/splach/splach_screnn.dart';
import 'package:muslimapp/views/admin/add_user.dart';

import 'package:muslimapp/views/select_masagedy/select_masagedy.dart';
import 'package:muslimapp/views/login/login.dart';
import 'package:muslimapp/views/movebar/bottom_move.dart';
import 'package:muslimapp/views/qrcode/qr_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
