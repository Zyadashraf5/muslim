import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslimapp/controllers/GadwelController.dart';
import 'package:muslimapp/controllers/homeController.dart';
import 'package:muslimapp/controllers/masgedController.dart';
import '../routes/app_pages.dart';
import '../views/Map/map_screen.dart';
import '../views/profile/profile.screen.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';

class BottomBarController extends GetxController {
  int currentIndex = 0;
  final iconList = <IconData>[
    Icons.person_outlined,
    FlutterIslamicIcons.mosque, // Updated element type to IconData
    Icons.location_pin,
    Icons.home_outlined,
  ];
  final labelList = <String>[
    'الملف الشخصي',
    'المسجد',
    'خريطة',
    'الرئيسية',
  ];

  void changePage(int? index) async {
    currentIndex = index!;
    print(currentIndex);
    HomeController homeController = Get.put(HomeController());
    MasgedController masgedController = Get.put(MasgedController());
    switch (currentIndex) {
      case 3:
        await homeController.myGadawel();
        await homeController.getAllMasaged();
        Get.toNamed(Routes.home);
        break;
      case 2:
        await masgedController.getMasgedOnMap();
        Get.to(MapScreen());
        break;
      case 1:
        await masgedController.getAll();
        await masgedController.getAllSigned();
        Get.toNamed(Routes.tasks);
        break;
      case 0:
        Get.toNamed(Routes.profile);
        break;
      default:
        Get.toNamed(Routes.home);
        break;
    }
  }
}
