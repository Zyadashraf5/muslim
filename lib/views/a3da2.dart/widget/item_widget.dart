import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemaya/models/UserModel.dart';


import '../../select_masagedy/select_masagedy.dart';

class Itema3da2 extends StatelessWidget {
  Itema3da2({super.key, required this.user});
  UserModel user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          height: 180,
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 5),
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade100,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                color: Colors.green.shade300,
                size: 80,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'الاسم:${user!.name!} ',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "TajawalMedium",
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'رقم الجوال:${user!.phone!} ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "TajawalMedium",
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    ' رقم الهوية:${user!.ssn!} ',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "TajawalMedium",
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
