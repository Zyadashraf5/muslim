import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemaya/models/Masagedy.dart';
import 'package:hemaya/views/pdfs/pdf_inspection.dart';
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
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.right,
                      "اسم المسجد : ${masagedyModel.namemasaged} ",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "TajawalMedium",
                          color: Colors.black),
                    ),
                    Text(
                      "(الجولات التفقديه)",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "TajawalMedium",
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
