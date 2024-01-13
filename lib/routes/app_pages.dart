import 'package:get/get.dart';
import 'package:muslimapp/binding/addmasaged_binding.dart';
import 'package:muslimapp/binding/addmasagedone_binding.dart';
import 'package:muslimapp/binding/adduser_binding.dart';
import 'package:muslimapp/binding/home_bindng.dart';
import 'package:muslimapp/binding/profile_binding.dart';
import 'package:muslimapp/binding/qr_binding.dart';
import 'package:muslimapp/binding/read_binding.dart';
import 'package:muslimapp/binding/scan_binding.dart';
import 'package:muslimapp/binding/splash_binding.dart';
import 'package:muslimapp/binding/taskes_binding.dart';

import 'package:muslimapp/views/admin/add_user.dart';
import 'package:muslimapp/views/home/home_screen.dart';
import 'package:muslimapp/views/profile/profile.screen.dart';
import 'package:muslimapp/views/qrcode/qr_screen.dart';
import 'package:muslimapp/views/qrcode/scan.dart';

import '../views/splach/splach_screnn.dart';
import '../views/task/taskes.screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
        name: _Paths.splash,
        page: () => const SplashPage(),
        bindings: [SplashBinding()]),
    GetPage(
        name: _Paths.tasks,
        page: () => const taskes(),
        bindings: [TasksBinding()]),
    GetPage(
        name: _Paths.scan, page: () => const Scan(), bindings: [ScanBinding()]),
    GetPage(
        name: _Paths.adduser,
        page: () => AddUser(),
        bindings: [AddUserBinding()]),
    GetPage(name: _Paths.home, page: () => Home(), bindings: [HomeBinding()]),
    GetPage(
        name: _Paths.profile,
        page: () => profile(),
        bindings: [ProfiledBinding()]),
    GetPage(name: _Paths.qr, page: () => QR(), bindings: [qrBinding()]),
  ];
}
