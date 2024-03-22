import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Asnhlak3aly/inspection_tours_one_Asnhlak3aly.dart';
import '../Inspection tours/inspection_tours_one.dart';

class InspectionTours extends StatelessWidget {
  const InspectionTours({super.key});

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
                  "وزارة الشؤون الإسلامية والدعوة والإرشاد ",
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
        //top 180 left 150
        Positioned(
          top: 190,
          left: 50,
          right: 50,
          child: Text(" :الرجاء تعبئة البيانات التالية",
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "TajawalBlack",
                  color: Colors.black87)),
        ),
        //top 240 left 60
        Positioned(
          top: 240,
          left: 20,
          right: 20,
          bottom: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Get.to(InspectionToursOne());
                },
                child: Column(
                  children: [
                    Container(
                      width: 330,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 7,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                            color: Colors.green.shade700, width: 4.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            color: Colors.grey,
                          ),
                          Text(
                            "جولة تفقدية",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "TajawalMedium",
                                color: Colors.black),
                          ),
                          Image.asset(
                            "assets/g2.png",
                            width: 40,
                            height: 60,
                            color: Colors.green,
                          ),
                        ],
                        mainAxisSize: MainAxisSize.min,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      width: 330,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 7,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                            color: Colors.green.shade700, width: 4.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            color: Colors.grey,
                          ),
                          Text(
                            "مساجد المزارع والهجر",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "TajawalMedium",
                                color: Colors.black),
                          ),
                          Image.asset(
                            "assets/asdfg.png",
                            width: 40,
                            height: 60,
                            color: Colors.green,
                          ),
                        ],
                        mainAxisSize: MainAxisSize.min,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //
      ],
    ));
  }
}
