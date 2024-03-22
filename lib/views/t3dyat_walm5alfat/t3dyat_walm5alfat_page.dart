import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Infringements_duty.dart';
import 'malfa.duty.dart';

class t3dyatwalm5alfat extends StatelessWidget {
  const t3dyatwalm5alfat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          child: Image.asset(
            "assets/backgroud1.png",
          ),
          width: MediaQuery.of(context).size.width,
          right: 0,
        ),
        Positioned(
          top: 40,
          right: 0,
          left: 0,
          bottom: 40,
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/logo1.png",
                  height: 100,
                ),
                Text(
                  "وزارة الشؤون الإسلامية والدعوة والإرشاد",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "TajawalMedium",
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 300,
          right: 10,
          child: InkWell(
            onTap: () {
              Get.to(Infringements_duty());
            },
            child: Image.asset(
              "assets/ict.png",
              height: 140,
            ),
          ),
        ),
        Positioned(
          top: 300,
          left: 10,
          child: InkWell(
            onTap: () {
              Get.to(Malfat_duty());
            },
            child: Image.asset(
              "assets/icm.png",
              height: 140,
            ),
          ),
        ),
      ],
    ));
  }
}
