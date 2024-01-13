import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslimapp/models/Masagedy.dart';
import 'package:muslimapp/views/pdfs/pdf_inspection.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../select_masagedy/select_masagedy.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({required this.masagedyModel, super.key});
  MasagedyModel masagedyModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(PdfInspection(masgedModel: masagedyModel));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 150,
          width: 300,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green.shade800, width: 6),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QrImageView(
                  data: masagedyModel.namemasaged!,
                  size: 80,
                  foregroundColor: Colors.green.shade300),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "اسم المسجد : ${masagedyModel.namemasaged} ",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "TajawalMedium",
                        color: Colors.black),
                  ),
                  Text(
                    "(الجولات التفقديه)",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "TajawalMedium",
                        color: Colors.black),
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
